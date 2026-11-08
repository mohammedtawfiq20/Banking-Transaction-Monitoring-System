
/* ETL Pipeline */

%let project_path=/* set your project path */;

options mprint mlogic symbolgen;

%let syscc=0;


/* STEP 1 */

%put NOTE: STEP 1 - Creating Source Data;

%include "&project_path/1_create_data_source.sas";


/* STEP 2 */

%put NOTE: STEP 2 - Data Quality Assessment;

%include "&project_path/2_data_quality_assessment.sas";


/* STEP 3 */

%put NOTE: STEP 3 - Data Cleaning;

%include "&project_path/3_data_cleaning.sas";


/* STEP 4 */

%put NOTE: STEP 4 - Data Transformation;

%include "&project_path/4_data_transformation.sas";

/* STEP 5 */

%put NOTE: STEP 5 - Transaction Monitoring;

%include "&project_path/5_transaction_monitoring.sas";


/* STEP 6 */

%put NOTE: STEP 6 - Generate KPIS;

%include "&project_path/6_generate_KPIS.sas";


/* STEP 7 */

%put NOTE: STEP 7 - Generate Charts Data;

%include "&project_path/7_generate_charts_data.sas";



/* STEP 7 */

%put NOTE: STEP 8 - load insights into CAS;

%include "&project_path/8_load_insights_into_CAS.sas";

%put NOTE: ETL PIPELINE FINISHED;

/* ETL Output Validation */

proc sql;

select
    count(*) as total_transactions,
    count(distinct transaction_id) as unique_transactions,
    sum(missing(amount)) as missing_amounts

from work.transaction_transformed;

quit;
