{% macro create_tables_lic_mco(database_name,schema_name,table_name1,table_name2,table_name3,table_name4,table_name5,
   table_name6,table_name7,table_name8,table_name9) %}
   {% set create_db %}
   create or replace database {{database_name}};
   {% endset %}
   {% do run_query(create_db) %}

   {% set create_sc %}
   create or replace schema {{database_name}}.{{schema_name}};
   {% endset %}
   {% do run_query(create_sc) %}

   {% set create_tbl1 %}
   create or replace table {{database_name}}.{{schema_name}}.{{table_name1}}
   (
    POLICY_ID VARCHAR(100),
    CUSTOMER_ID VARCHAR(100),
    POLICY_TYPE VARCHAR(50),  
    POLICY_NAME VARCHAR(100),
    SUM_ASSURED DECIMAL(20,2),
    PREMIUM_AMOUNT DECIMAL(20,2),
    POLICY_TERM_YEARS INT,
    START_DATE DATE,
    END_DATE DATE,
    STATUS VARCHAR(20)
    );
    {% endset %}
    {% do run_query(create_tbl1) %}

    {% set create_tbl2 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name2}}
    (
    CUSTOMER_ID VARCHAR(100),
    CUSTOMER_NAME VARCHAR(100),
    DATE_OF_BIRTH DATE,
    GENDER VARCHAR(10),
    PHONE_NO VARCHAR(15),
    EMAIL VARCHAR(100),
    COUNTRY_CODE VARCHAR(10),
    CITY VARCHAR(50)
    );
    {% endset %}
    {% do run_query(create_tbl2) %}

    {% set create_tbl3 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name3}}
    (
    POLICY_TYPE VARCHAR(50),
    DESCRIPTION TEXT
    );
    {% endset %}
    {% do run_query(create_tbl3) %}

    {% set create_tbl4 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name4}}
    (
    PAYMENT_ID VARCHAR(100),
    POLICY_ID VARCHAR(100),
    PAYMENT_DATE DATE,
    AMOUNT_PAID DECIMAL(20,2),
    PAYMENT_MODE VARCHAR(50),
    STATUS VARCHAR(20) 
    );
    {% endset %}
    {% do run_query(create_tbl4) %}

    {% set create_tbl5 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name5}}
    (
    CLAIM_ID VARCHAR(100),
    POLICY_ID VARCHAR(100),
    CLAIM_DATE DATE,
    CLAIM_AMOUNT DECIMAL(20,2),
    REASON TEXT,
    STATUS VARCHAR(20)
    );
    {% endset %}
    {% do run_query(create_tbl5) %}

    {% set create_tbl6 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name6}}
    (
    NOMINEE_ID VARCHAR(100),
    POLICY_ID VARCHAR(100),
    NAME VARCHAR(100),
    RELATIONSHIP VARCHAR(50),
    DATE_OF_BIRTH DATE,
    CONTACT_NO VARCHAR(15)
    );
    {% endset %}
    {% do run_query(create_tbl6) %}

    {% set create_tbl7 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name7}}
    (
    DUE_ID VARCHAR(100),
    POLICY_ID VARCHAR(100),
    DUE_DATE DATE,
    DUE_AMOUNT DECIMAL(20,2),
    STATUS VARCHAR(20),
    REMARKS TEXT
    );
    {% endset %}
    {% do run_query(create_tbl7) %}

    {% set create_tbl8 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name8}}
    (
    COUNTRY_CODE VARCHAR(10),
    COUNTRY_NAME VARCHAR(100),
    CURRENCY_CODE VARCHAR(10)
    );
    {% endset %}
    {% do run_query(create_tbl8) %}

    {% set create_tbl9 %}
    create or replace table {{database_name}}.{{schema_name}}.{{table_name9}}
    (
    CURRENCY_CODE VARCHAR(10),
    CURRENCY_NAME VARCHAR(50),
    EXCHANGE_RATE_TO_INR DECIMAL(10,4),
    LAST_UPDATED DATE
    );
    {% endset %}
    {% do run_query(create_tbl9) %}
    
{% endmacro %}

---dbt run-operation create_tables_lic_mco --args "{'database_name':'DBT_CICD_LICRAW_DB','schema_name':'DBT_CICD_LICRAW_SC','table_name1':'INSURANCE_POLICIES','table_name2':'CUSTOMERS','table_name3':'POLICY_TYPES','table_name4':'PREMIUM_PAYMENTS','table_name5':'CLAIMS','table_name6':'NOMINEES','table_name7':'PREMIUM_DUE_DATES','table_name8':'COUNTRIES','table_name9':'CURRENCIES'}"
