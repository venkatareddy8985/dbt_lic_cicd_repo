---6.Convert Claim Amounts to INR Using Latest Exchange Rate from the Currencies
with claims_cte as(
    select * from {{ ref('b_c_l_claims') }}
),
insurancepolicies_cte as(
    select*from {{ ref('b_c_l_insurance_policies') }}
),
customers_cte as(
    select*from {{ ref('b_c_l_customers') }}
),
countries_cte as(
    select*from {{ ref('b_c_l_countries') }}
),
currencies_cte as(
    select*from {{ ref('b_c_l_currencies') }}
),
joins_query6_cte as(
    SELECT 
    CL.CLAIM_ID,CL.CLAIM_AMOUNT,CL.STATUS,CL.CLAIM_DATE,
    C.CUSTOMER_NAME,
    CO.COUNTRY_NAME,
    CUR.CURRENCY_NAME,CUR.EXCHANGE_RATE_TO_INR,ROUND(CL.CLAIM_AMOUNT * CUR.EXCHANGE_RATE_TO_INR, 2) AS CLAIM_AMOUNT_INR
FROM claims_cte CL
JOIN insurancepolicies_cte IP ON CL.POLICY_ID = IP.POLICY_ID
JOIN customers_cte C ON IP.CUSTOMER_ID = C.CUSTOMER_ID
JOIN countries_cte CO ON C.COUNTRY_CODE = CO.COUNTRY_CODE
JOIN currencies_cte CUR ON CO.CURRENCY_CODE = CUR.CURRENCY_CODE
WHERE CUR.LAST_UPDATED = (
    SELECT MAX(LAST_UPDATED)
    FROM currencies_cte 
    WHERE CURRENCY_CODE = CUR.CURRENCY_CODE
) )
select*from joins_query6_cte

---dbt run -m s_c_l_query6_trans
