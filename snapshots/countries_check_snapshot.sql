{% snapshot countries_check_snapshot %}
    {{
        config(
            target_schema='snp_sc',
            target_database='snp_db',
            unique_key='country_code',
            strategy='check',
            check_cols=['country_name']
        )
    }}

    select * from {{ source('cicdlic_src_snf', 'COUNTRIES') }}
 {% endsnapshot %}

 ---dbt snapshot -m countries_check_snapshot