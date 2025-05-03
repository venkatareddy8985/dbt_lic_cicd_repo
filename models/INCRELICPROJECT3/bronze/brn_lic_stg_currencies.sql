with currencies_cte as(
    select currency_code,currency_name,exchange_rate_to_inr,last_updated
    from {{ source('incre_lic_src', 'STG_CURRENCIES') }}
)
select * from currencies_cte

--- dbt run -m brn_lic_stg_currencies