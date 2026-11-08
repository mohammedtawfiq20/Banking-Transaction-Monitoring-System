

/* Dashboard Chart Data */

/* Dashboard Chart 1: Alert by Rule */

proc sql;
create table work.alerts_by_rule as
select
    alert_rule,
    count(*) as total_alerts
from work.final_alerts
group by alert_rule
order by total_alerts desc;
quit;

/* Display Chart Data */

proc print data=work.alerts_by_rule;
    title "Alerts by Rule - Dashboard Chart";
run;

/* Dashboard Chart 2: Transactions by Channel */

proc sql;
create table work.transactions_by_channel as
select
    channel,
    count(*) as total_transactions,
    sum(amount) as total_amount
from work.transaction_transformed
group by channel
order by total_transactions desc;
quit;

/* Display Results */

proc print data=work.transactions_by_channel;
    title "Transactions by Channel";
run;

/* Dashboard Chart 3: Transactions Over Time */

proc sql;
create table work.transactions_over_time as
select
    transaction_date,
    count(*) as total_transactions,
    sum(amount) as total_amount
from work.transaction_transformed
group by transaction_date
order by transaction_date;
quit;

/* Display Results */

proc print data=work.transactions_over_time;
    format transaction_date date9.;
    title "Transactions Over Time";
run;