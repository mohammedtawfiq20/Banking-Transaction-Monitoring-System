/* Dashboard KPI 1: Total Alerts */

proc sql;
create table work.final_alert_kpis as
select
    count(*) as total_alerts
from work.final_alerts;
quit;

proc print data=work.final_alert_kpis;
    title "Dashboard KPIs";
run;
/*-------------------------------------------------------- */
/* Dashboard KPI 2: Total Transactions */

proc sql;
create table work.total_transactions_kpi as
select
    count(*) as total_transactions
from work.transaction_transformed;
quit;

proc print data=work.total_transactions_kpi;
    title "Total Transactions KPI";
run;
/*-----------------------------------------------------------------------*/
/* Dashboard KPI 3: Unique Alerted Transactions */

proc sql;
create table work.unique_alerted_transactions_kpi as
select
    count(distinct transaction_id) as unique_alerted_transactions
from work.final_alerts
where not missing(transaction_id);
quit;

proc print data=work.unique_alerted_transactions_kpi;
    title "Unique Alerted Transactions KPI";
run;
/*----------------------------------------------------------------------- */
/* Dashboard KPI 4: High Value Alerts */

proc sql;
create table work.high_value_kpi as
select
    count(*) as high_value_alerts
from work.final_alerts
where alert_rule = 'Rule 1 - High Value Transactions';
quit;

proc print data=work.high_value_kpi;
    title "High Value Alerts KPI";
run;
/*----------------------------------------------------------------------- */
/* Dashboard KPI 5: High-Risk Customer Alerts */

proc sql;
create table work.high_risk_kpi as
select
    count(*) as high_risk_alerts
from work.final_alerts
where alert_rule = 'Rule 3 - High Risk Customer';
quit;

proc print data=work.high_risk_kpi;
    title "High-Risk Customer Alerts KPI";
run;
/* ------------------------------------------------------------------------*/
/* Combine All Dashboard KPIs */

proc sql noprint;

select count(*)
into :total_alerts
from work.final_alerts;

select count(*)
into :total_transactions
from work.transaction_transformed;

select count(distinct transaction_id)
into :unique_alerted
from work.final_alerts
where not missing(transaction_id);

select count(*)
into :high_value
from work.final_alerts
where alert_rule = 'Rule 1 - High Value Transactions';

select count(*)
into :high_risk
from work.final_alerts
where alert_rule = 'Rule 3 - High Risk Customer';

quit;

/* Create Final KPI Table */

data work.dashboard_kpis;

    total_alerts = &total_alerts;
    total_transactions = &total_transactions;
    unique_alerted_transactions = &unique_alerted;
    high_value_alerts = &high_value;
    high_risk_alerts = &high_risk;

run;

/* Display Results */

proc print data=work.dashboard_kpis;
    title "Banking Transaction Monitoring Dashboard KPIs";
run;

