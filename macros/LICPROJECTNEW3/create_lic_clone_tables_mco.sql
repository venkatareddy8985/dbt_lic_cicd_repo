{% macro create_lic_clone_tables_mco(src_db,src_sc,trg_db,trg_sc,clone_tables) %}
    {% set create_db %}
    create or replace database {{trg_db}};
    {% endset %}
    {% do run_query(create_db) %}

    {% set create_sc %}
    create or replace schema {{trg_db}}.{{trg_sc}};
    {% endset %}
    {% do run_query(create_sc) %}

    {% set clone_tables %}
    create or replace table {{trg_db}}.{{trg_sc}}.CLAIMS clone {{src_db}}.{{src_sc}}.CLAIMS;
    create or replace table {{trg_db}}.{{trg_sc}}.COUNTRIES clone {{src_db}}.{{src_sc}}.COUNTRIES;
    create or replace table {{trg_db}}.{{trg_sc}}.CURRENCIES clone {{src_db}}.{{src_sc}}.CURRENCIES;
    create or replace table {{trg_db}}.{{trg_sc}}.CUSTOMERS clone {{src_db}}.{{src_sc}}.CUSTOMERS;
    create or replace table {{trg_db}}.{{trg_sc}}.INSURANCE_POLICIES clone {{src_db}}.{{src_sc}}.INSURANCE_POLICIES;
    create or replace table {{trg_db}}.{{trg_sc}}.NOMINEES clone {{src_db}}.{{src_sc}}.NOMINEES;
    create or replace table {{trg_db}}.{{trg_sc}}.POLICY_TYPES clone {{src_db}}.{{src_sc}}.POLICY_TYPES;
    create or replace table {{trg_db}}.{{trg_sc}}.PREMIUM_DUE_DATES clone {{src_db}}.{{src_sc}}.PREMIUM_DUE_DATES;
    create or replace table {{trg_db}}.{{trg_sc}}.PREMIUM_PAYMENTS clone {{src_db}}.{{src_sc}}.PREMIUM_PAYMENTS;
    {% endset %}
    {% do run_query(clone_tables) %}

{% endmacro %}

---dbt run-operation create_lic_clone_tables_mco --args "{'src_db':'DBT_CICD_LICRAW_DB','src_sc':'DBT_CICD_LICRAW_SC','trg_db':'DBT_NEWLIC_DB','trg_sc':'DBT_NEWLIC_SC'}"