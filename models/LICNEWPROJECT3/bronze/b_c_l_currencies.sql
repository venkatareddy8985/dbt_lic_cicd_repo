with currencies_cte as(
    select currency_code,currency_name,exchange_rate_to_inr,last_updated
    from {{ source('cicdlic_src_snf', 'CURRENCIES') }}
)
select*from currencies_cte

---dbt run -m b_c_l_currencies
