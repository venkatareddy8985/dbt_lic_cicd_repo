with countries_cte as(
    select country_code,country_name,currency_code,country_date
    from {{ source('incre_lic_src', 'STG_COUNTRIES') }}
)
select * from countries_cte

---dbt run -m brn_lic_stg_countries