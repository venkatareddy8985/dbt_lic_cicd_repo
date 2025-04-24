{% macro create_lic_pipes_mco(database_name,schema_name,pipe_name1,pipe_name2,pipe_name3,pipe_name4,pipe_name5,
   pipe_name6,pipe_name7,pipe_name8,pipe_name9) %}
   {% set create_pipe1 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name1}} auto_ingest=true as 
   copy into CLAIMS from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fivetables_csvfiles/claimsfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe1) %}

   {% set create_pipe2 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name2}} auto_ingest=true as 
   copy into COUNTRIES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fivetables_csvfiles/countriesfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe2) %}

   {% set create_pipe3 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name3}} auto_ingest=true as 
   copy into CURRENCIES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fivetables_csvfiles/currenciesfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe3) %}

   {% set create_pipe4 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name4}} auto_ingest=true as 
   copy into CUSTOMERS from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fivetables_csvfiles/customersfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe4) %}

   {% set create_pipe5 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name5}} auto_ingest=true as 
   copy into INSURANCE_POLICIES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fivetables_csvfiles/insurancepoliciesfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe5) %}

   {% set create_pipe6 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name6}} auto_ingest=true as 
   copy into NOMINEES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fourtables_csvfiles/nomineesfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe6) %}

   {% set create_pipe7 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name7}} auto_ingest=true as 
   copy into POLICY_TYPES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fourtables_csvfiles/policytypesfile/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe7) %}

   {% set create_pipe8 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name8}} auto_ingest=true as 
   copy into PREMIUM_DUE_DATES from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fourtables_csvfiles/premiumduedates_file/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe8) %}

   {% set create_pipe9 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name9}} auto_ingest=true as 
   copy into PREMIUM_PAYMENTS from @DBT_CICD_LICRAW_EXT_STG/dbt_cicd_lic_fourtables_csvfiles/premiumpayments_file/ file_format=(format_name=DBT_CICD_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe9) %}
 
 {% endmacro %} 
---dbt run-operation create_lic_pipes_mco --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','pipe_name1':'CLAIMS_PIPE_NAME','pipe_name2':'COUNTRIES_PIPE_NAME','pipe_name3':'CURRENCIES_PIPE_NAME','pipe_name4':'CUSTOMERS_PIPE_NAME','pipe_name5':'INSURANCEPOLICIES_PIPE_NAME','pipe_name6':'NOMINEES_PIPE_NAME','pipe_name7':'POLICYTYPES_PIPE_NAME','pipe_name8':'PREMIUMDUEDATES_PIPE_NAME','pipe_name9':'PREMIUM_PAYMENTS_PIPE_NAME'}"
