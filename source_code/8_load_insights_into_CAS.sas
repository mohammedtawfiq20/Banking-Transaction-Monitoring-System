
cas mySession;

proc casutil;
    droptable incaslib="CASUSER" casdata="DASHBOARD_KPIS" quiet;
    droptable incaslib="CASUSER" casdata="FINAL_ALERTS" quiet;
    droptable incaslib="CASUSER" casdata="ALERTS_BY_RULE" quiet;
    droptable incaslib="CASUSER" casdata="TRANSACTIONS_BY_CHANNEL" quiet;
    droptable incaslib="CASUSER" casdata="TRANSACTIONS_OVER_TIME" quiet;
    droptable incaslib="CASUSER" casdata="TRANSACTION_TRANSFORMED" quiet;

    load data=work.dashboard_kpis outcaslib="CASUSER" casout="DASHBOARD_KPIS" promote;
    load data=work.final_alerts outcaslib="CASUSER" casout="FINAL_ALERTS" promote;
    load data=work.alerts_by_rule outcaslib="CASUSER" casout="ALERTS_BY_RULE" promote;
    load data=work.transactions_by_channel outcaslib="CASUSER" casout="TRANSACTIONS_BY_CHANNEL" promote;
    load data=work.transactions_over_time outcaslib="CASUSER" casout="TRANSACTIONS_OVER_TIME" promote;
    load data=work.transaction_transformed outcaslib="CASUSER" casout="TRANSACTION_TRANSFORMED" promote;
quit;

proc casutil;
    list tables incaslib="CASUSER";
quit;
