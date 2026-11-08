
/* Rule 1: High Value Transactions*/

data work.transaction_alerts;

    set work.transaction_transformed;

    length alert_flag $3;
    length alert_reason $50;
    length risk_level $10;

    if amount > 10000 then do;

        alert_flag = 'Yes';
        alert_reason = 'High Value Transaction';
        risk_level = 'High';

    end;

    else do;

        alert_flag = 'No';
        alert_reason = 'No Alert';
        risk_level = 'Normal';

    end;

run;


/* Display Alert Transactions */

proc print data=work.transaction_alerts;

    where alert_flag = 'Yes';

    title "High Value Transaction Alerts";

run;


/*---------------------------------------------------------------- */


/* Rule 2: Multiple Transactions */
/* Rule 2: Multiple Transactions per Sender per Day */

proc sql;

    create table work.multiple_transactions as

    select
        sender_account,
        transaction_date,
        count(*) as transaction_count

    from work.transaction_transformed

    group by
        sender_account,
        transaction_date

    having count(*) >= 3;

quit;


/* Display Results */

proc print data=work.multiple_transactions;
    title "Daily Multiple Transactions Alerts";
run;
/*---------------------------------------------------------------- */

/* Rule 3: High-Risk Customer Transactions */

proc sql;
create table work.high_risk_alerts as
select
    t.transaction_id,
    t.sender_account,
    t.amount,
    c.customer_name,
    c.risk_category
from work.transaction_transformed as t
inner join work.accounts as a
    on t.sender_account = a.account_id
inner join work.customers as c
    on a.customer_id = c.customer_id
where upcase(c.risk_category) = 'HIGH';
quit;

/* Display Results */

proc print data=work.high_risk_alerts;
    title "High-Risk Customer Alerts";
run;
/*------------------------------------------------------------------*/

/* Rule 4: Unusual Transaction Amount */

proc sql;
create table work.unusual_amount_alerts as
select *
from work.transaction_transformed
where amount > (
    select avg(amount) * 2
    from work.transaction_transformed
);
quit;

/* Display Results */

proc print data=work.unusual_amount_alerts;
    title "Unusual Transaction Amount Alerts";
run;
/* ---------------------------------------------------------------- */
/* Rule 5: Multiple Senders to Same Receiver per Day */

proc sql;

    create table work.multiple_senders_alerts as

    select
        receiver_account,
        transaction_date,
        count(distinct sender_account) as sender_count,
        count(*) as transaction_count,
        sum(amount) as total_amount

    from work.transaction_transformed

    group by
        receiver_account,
        transaction_date

    having count(distinct sender_account) >= 3;

quit;


/* Display Results */

proc print data=work.multiple_senders_alerts;
    title "Daily Multiple Senders to Same Receiver Alerts";
run;
/*---------------------------------------------------------------------------*/

/* Final Alerts - Combine All Rules */

proc sql;

create table work.final_alerts as

/* Rule 1 - High Value Transactions	 */
select
    'Rule 1 - High Value Transactions' as alert_rule length=50,
    transaction_id,
    sender_account as account_id,
    amount,
    1 as transaction_count
from work.transaction_alerts
where alert_flag = 'Yes'

union all

/* Rule 2 - Daily Transaction Frequency */
select
    'Rule 2 - Daily Transaction Frequency' as alert_rule,
    t.transaction_id,
    t.sender_account as account_id,
    t.amount,
    m.transaction_count
from work.multiple_transactions as m
inner join work.transaction_transformed as t
    on m.sender_account = t.sender_account
   and m.transaction_date = t.transaction_date



union all

/* Rule 3 - High Risk Customer */
select
    'Rule 3 - High Risk Customer' as alert_rule,
    transaction_id,
    sender_account as account_id,
    amount,
    1 as transaction_count
from work.high_risk_alerts

union all

/* Rule 4 - Unusual Transaction Amount	 */
select
    'Rule 4 - Unusual Transaction Amount' as alert_rule,
    transaction_id,
    sender_account as account_id,
    amount,
    1 as transaction_count
from work.unusual_amount_alerts

union all

/* Rule 5 - Multiple Senders to Same Receiver */
select
    'Rule 5 - Multiple Senders to Same Receiver' as alert_rule,
    t.transaction_id,
    t.sender_account as account_id,
    t.amount,
       m.transaction_count

from work.multiple_senders_alerts as m
inner join work.transaction_transformed as t
    on m.receiver_account = t.receiver_account
   and m.transaction_date = t.transaction_date

;

quit;


/* Display Final Alerts */

proc print data=work.final_alerts;
    title "Final Banking Transaction Alerts";
run;


/* Validate Final Alerts */

proc sql;
    select
        count(*) as total_alerts,
        count(distinct transaction_id) as unique_alerted_transactions,
        sum(missing(transaction_id)) as missing_transaction_ids,
        sum(missing(account_id)) as missing_accounts,
        sum(missing(amount)) as missing_amounts,
        sum(missing(transaction_count)) as missing_transaction_counts
    from work.final_alerts;
quit;


/*------------------------------------------------------------- */
/* Final Alert Summary */

proc sql;
create table work.final_alert_summary as
select
    alert_rule,
    count(*) as total_alerts
from work.final_alerts
group by alert_rule
order by alert_rule;
quit;

proc print data=work.final_alert_summary;
    title "Final Alert Summary";
run;
