{% macro create_file_format_mco(database_name,schema_name,file_format_name,type,field_delimiter,skip_header) %}
    {% set create_fileformat %}
    use database {{database_name}};
    use schema {{database_name}}.{{schema_name}};
    create or replace file format {{database_name}}.{{schema_name}}.{{file_format_name}}
    type={{type}}
    field_delimiter='{{field_delimiter}}'
    skip_header={{skip_header}};
    {% endset %}
    {% do run_query(create_fileformat) %}
    
{% endmacro %}

---dbt run-operation create_file_format_mco --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','file_format_name':'DBT_CICD_LICRAW_CSV_FORMAT','type':'CSV','field_delimiter':',','skip_header':'1'}"
