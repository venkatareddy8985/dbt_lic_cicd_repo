{% snapshot premium_payments_snapshot %}
    {{
        config(
            target_schema='snp_sc',
            target_database='snp_db',
            unique_key='payment_id',
            strategy='timestamp',
            updated_at='PAYMENT_DATE',
            invalidate_hard_deletes=true,
           )
    }}

    select * from {{ source('cicdlic_src_snf', 'PREMIUM_PAYMENTS') }}
 {% endsnapshot %}

 ---dbt snapshot -m premium_payments_snapshot