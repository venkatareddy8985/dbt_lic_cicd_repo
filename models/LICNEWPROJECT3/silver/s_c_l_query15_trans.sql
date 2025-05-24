---15.Countries using currencies stronger than 10 INR

with countries_cte as(
    select*from {{ ref('brn_lic_stg_countries') }}
),
currencies_cte as(
    select*from {{ ref('brn_lic_stg_currencies') }}
),
joins_query15_cte as(
    SELECT CO.COUNTRY_NAME, CU.CURRENCY_NAME, CU.EXCHANGE_RATE_TO_INR
    FROM countries_cte CO
    JOIN currencies_cte CU ON CO.CURRENCY_CODE = CU.CURRENCY_CODE
    WHERE CU.EXCHANGE_RATE_TO_INR > 10
)
select*from joins_query15_cte

--- dbt run -m s_c_l_query15_trans
