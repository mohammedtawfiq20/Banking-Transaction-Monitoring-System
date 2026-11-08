
/* STEP 1: BASIC DATA PROFILING */


proc contents data=work.transactions;
run;

proc freq data=work.transactions;
    tables transaction_type
           currency
           channel
           transaction_status;
run;
/* Missing  &  positive numbers amount in Transactions */

proc means data=work.transactions
    n nmiss min max mean sum;
    var amount;
run;
 /* Duplicate Transactions */
proc sql;

    select
        transaction_id,
        count(*) as duplicate_count

    from work.transactions

    group by transaction_id

    having count(*) > 1;

quit;
 /* Missing Amounts */
proc sql;

    select *
    from work.transactions
    where missing(amount);

quit;
/* Negative Amounts */
proc sql;

    select *
    from work.transactions
    where amount < 0;

quit;

/* Invalid Account References */
/*  Sender */
proc sql;
select  t.transaction_id,
        t.sender_account,
        t.receiver_account from 
TRANSACTIONS t left join
ACCOUNTS a
on t.sender_account=a.account_id
where a.account_id is null;
quit;

 /* Receiver  */
proc sql;
select  t.transaction_id,
        t.sender_account,
        t.receiver_account from 
TRANSACTIONS t left join
ACCOUNTS a
on t.receiver_account=a.account_id
where a.account_id is null;
quit;

/* STEP 3: CENTRALIZED DATA QUALITY ENGINE */

proc sql;

    create table work.quality_issues as

    /* 1. DUPLICATE TRANSACTIONS */

    select
        t.transaction_id,
        'Duplicate Transaction' as issue_type length=30,
        'HIGH' as severity length=10,
        'Transaction ID appears more than once'
            as issue_details length=100

    from work.transactions as t

    group by t.transaction_id

    having count(*) > 1

    union all

    /* 2. MISSING AMOUNT */

    select
        transaction_id,
        'Missing Amount',
        'HIGH',
        'Transaction amount is missing'

    from work.transactions

    where missing(amount)

    union all

    /* 3. NEGATIVE AMOUNT */

    select
        transaction_id,
        'Negative Amount',
        'HIGH',
        'Transaction amount is negative'

    from work.transactions

    where amount < 0

    union all

    /* 4. INVALID SENDER ACCOUNT */

    select
        t.transaction_id,
        'Invalid Sender Account',
        'HIGH',
        'Sender account does not exist'

    from work.transactions as t

    where not exists
    (
        select *
        from work.accounts as a
        where a.account_id = t.sender_account
    )


    union all

    /* 4. INVALID Receiver ACCOUNT */

    select
        t.transaction_id,
        'Invalid Receiver Account',
        'HIGH',
        'Receiver account does not exist'

    from work.transactions as t

    where not exists
    (
        select *
        from work.accounts as a
        where a.account_id = t.receiver_account);



quit;


/* DISPLAY QUALITY ISSUES */

proc print data=work.quality_issues noobs;
run;

/* STEP 4: DATA QUALITY SUMMARY REPORT */

proc sql;

    create table work.quality_summary as

    select
        issue_type,
        severity,
        count(*) as issue_count

    from work.quality_issues

    group by
        issue_type,
        severity

    order by issue_count desc;

quit;


/* DISPLAY SUMMARY */

proc print data=work.quality_summary noobs;
    title "Banking Data Quality Summary";
run;

title;
