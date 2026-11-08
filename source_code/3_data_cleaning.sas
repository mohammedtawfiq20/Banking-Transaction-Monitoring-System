 /* remove duplicated transactions  */
proc sort
    data=work.transactions
    out=work.transactions_dedup
    nodupkey;

    by transaction_id;

run;
 /* handle missing and negative amount at Transactions */
data work.transactions_valid

     work.transactions_rejected;

    set work.transactions_dedup;

    length rejection_reason $40;

    if missing(amount) then do;
        rejection_reason = 'Missing Amount';
        output work.transactions_rejected;
    end;

    else if amount < 0 then do;
        rejection_reason = 'Negative Amount';
        output work.transactions_rejected;
    end;

    else do;
        output work.transactions_valid;
    end;

run;
 /* Validate Sender and Receiver Accounts */

proc sql;

    create table work.transactions_final as

    select t.*

    from work.transactions_valid(drop=rejection_reason) as t

    where exists (
        select 1
        from work.accounts as s
        where t.sender_account = s.account_id
    )

    and exists (
        select 1
        from work.accounts as r
        where t.receiver_account = r.account_id
    );

quit;


/* Validate Final Transactions */

proc sql;

    select
        count(*) as total_valid_transactions
    from work.transactions_final;

quit;

