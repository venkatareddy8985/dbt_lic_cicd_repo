{% macro create_sto_inte_stage_mco(database_name,schema_name,storage_integration_name10,stage_name) %}
    {% set create_storainte %}
    create or replace storage integration {{storage_integration_name10}}
    type=external_stage
    enabled=true
    storage_provider=s3
    storage_aws_role_arn='arn:aws:iam::743938722121:role/DBT_CICCD_LIC_INTEGRATION_ROLE'
    storage_allowed_locations=('s3://dbtcicdlics3bucketfulldata/')
    comment='integration with aws s3 and snowflake';
    {% endset %}
    {% do run_query(create_storainte) %}
    
    {% set create_stg %}
    use database {{database_name}};
    use schema {{database_name}}.{{schema_name}};
    create or replace stage {{database_name}}.{{schema_name}}.{{stage_name}}
    storage_integration={{storage_integration_name10}}
    url='s3://dbtcicdlics3bucketfulldata/'
    file_format=DBT_CICD_LICRAW_CSV_FORMAT;
    {% endset %}
    {% do run_query(create_stg) %}

{% endmacro %}

---dbt run-operation create_sto_inte_stage_mco --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','storage_integration_name10':'DBT_CICD_LICRAW_STO_INTE','stage_name':'DBT_CICD_LICRAW_EXT_STG'}"
