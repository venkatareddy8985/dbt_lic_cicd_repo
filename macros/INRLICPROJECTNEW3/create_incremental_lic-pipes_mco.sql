{% macro create_incremental_lic_pipes_mco(database_name,schema_name,pipe_name1,pipe_name2,pipe_name3,pipe_name4,pipe_name5,
   pipe_name6,pipe_name7,pipe_name8,pipe_name9) %}
   {% set create_pipe1 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name1}} auto_ingest=true as 
   copy into STG_CLAIMS from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fivetables_csvfiles/claimsfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe1) %}

   {% set create_pipe2 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name2}} auto_ingest=true as 
   copy into STG_COUNTRIES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fivetables_csvfiles/countriesfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe2) %}

   {% set create_pipe3 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name3}} auto_ingest=true as 
   copy into STG_CURRENCIES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fivetables_csvfiles/currenciesfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe3) %}

   {% set create_pipe4 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name4}} auto_ingest=true as 
   copy into STG_CUSTOMERS from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fivetables_csvfiles/customersfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe4) %}

   {% set create_pipe5 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name5}} auto_ingest=true as 
   copy into STG_INSURANCE_POLICIES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fivetables_csvfiles/insurancepoliciesfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe5) %}

   {% set create_pipe6 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name6}} auto_ingest=true as 
   copy into STG_NOMINEES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fourtables_csvfiles/nomineesfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe6) %}

   {% set create_pipe7 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name7}} auto_ingest=true as 
   copy into STG_POLICY_TYPES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fourtables_csvfiles/policytypesfile/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe7) %}

   {% set create_pipe8 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name8}} auto_ingest=true as 
   copy into STG_PREMIUM_DUE_DATES from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fourtables_csvfiles/premiumduedates_file/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe8) %}

   {% set create_pipe9 %}
   use database {{database_name}};
   use schema {{database_name}}.{{schema_name}};
   create or replace pipe {{database_name}}.{{schema_name}}.{{pipe_name9}} auto_ingest=true as 
   copy into STG_PREMIUM_PAYMENTS from @DBT_INCRE_LICRAW_EXT_STG/dbt_incre_lic_fourtables_csvfiles/premiumpayments_file/ file_format=(format_name=DBT_INCRE_LICRAW_CSV_FORMAT);
   {% endset %}
   {% do run_query(create_pipe9) %}
 
 {% endmacro %} 
---dbt run-operation create_incremental_lic_pipes_mco --args "{'database_name':'DBT_INC_LIC_DB','schema_name':'DBT_INC_LIC_SC','pipe_name1':'INCRE_CLAIMS_PIPE_NAME','pipe_name2':'INCRE_COUNTRIES_PIPE_NAME','pipe_name3':'INCRE_CURRENCIES_PIPE_NAME','pipe_name4':'INCRE_CUSTOMERS_PIPE_NAME','pipe_name5':'INCRE_INSURANCEPOLICIES_PIPE_NAME','pipe_name6':'INCRE_NOMINEES_PIPE_NAME','pipe_name7':'INCRE_POLICYTYPES_PIPE_NAME','pipe_name8':'INCRE_PREMIUMDUEDATES_PIPE_NAME','pipe_name9':'INCRE_PREMIUM_PAYMENTS_PIPE_NAME'}"
