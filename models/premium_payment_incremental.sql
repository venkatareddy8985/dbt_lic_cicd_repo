{{
    config(
        materialized='incremental'
    )
}}

select * from {{ source('incre_lic_src', 'STG_PREMIUM_PAYMENTS') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where PAYMENT_DATE > (select max(PAYMENT_DATE) from {{ this }}) 
{% endif %}

---dbt run -m premium_payment_incremental