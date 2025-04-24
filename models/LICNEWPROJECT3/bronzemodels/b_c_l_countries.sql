with countries_cte as(
    select country_code,country_name,currency_code
    from {{ source('cicdlic_src_snf', 'COUNTRIES') }}
)
select*from countries_cte


---dbt run -m b_c_l_countries
