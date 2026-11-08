/*    STEP 1: DATA ENRICHMENT */

proc sql;

    create table work.transaction_enriched as

    select
        t.*,

        a.customer_id,
        a.account_type,
        a.opening_date,

        c.customer_name,
        c.country,
        c.customer_type,
        c.risk_category

    from work.transactions_final as t

    left join work.accounts as a
        on t.sender_account = a.account_id

    left join work.customers as c
        on a.customer_id = c.customer_id;

quit;


/* CHECK THE RESULT */

proc print data=work.transaction_enriched;
run;


/* STEP 2: CREATE DERIVED VARIABLES */

data work.transaction_transformed;

    set work.transaction_enriched;

    /* Extract Year and Month */

    transaction_year = year(transaction_date);

    transaction_month = month(transaction_date);

    transaction_month_name =
        put(transaction_date, monname.);

    /* Calculate Account Age */

    days_from_opening =
        transaction_date - opening_date;

    /* Classify Transaction Amount */

    length amount_category $15;

    if amount < 1000 then
        amount_category = 'Small';

    else if amount <= 10000 then
        amount_category = 'Medium';

    else
        amount_category = 'Large';

    format transaction_date yymmdd10.
           opening_date yymmdd10.
           amount comma12.2;

run;


/* DISPLAY TRANSFORMED DATA */

proc print data=work.transaction_transformed;
run;

/* STEP 3: MONTHLY TRANSACTION SUMMARY */

proc sql;

    create table work.monthly_transaction_summary as

    select

        transaction_year,
        transaction_month,
        transaction_month_name,
        channel,

        count(*) as total_transactions,

        sum(amount) as total_amount,

        avg(amount) as average_amount,

        max(amount) as maximum_amount

    from work.transaction_transformed

    group by
        transaction_year,
        transaction_month,
        transaction_month_name,
        channel

    order by
        transaction_year,
        transaction_month;

quit;


/* DISPLAY SUMMARY */

proc print data=work.monthly_transaction_summary;
    title "Monthly Transaction Summary";
run;

title;

/* Validation */
proc sql;

    select
        count(*) as total_rows,
        sum(amount) as total_amount,
        count(distinct transaction_id) as unique_transactions

    from work.transaction_transformed;

quit;