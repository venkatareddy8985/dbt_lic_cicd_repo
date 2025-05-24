---8.Total premium paid by each customer
with custome_cte as(
    select * from {{ ref('brn_lic_stg_customers') }}
),
insurance_cte as(
    select * from {{ ref('brn_lic_stg_insurance_policies') }}
),
premium_cte as(
    select * from {{ ref('brn_lic_stg_premium_payments') }}
),
joins_cte as(
SELECT C.CUSTOMER_NAME, SUM(PP.AMOUNT_PAID) AS TOTAL_PAID
FROM custome_cte C
JOIN insurance_cte IP ON C.CUSTOMER_ID = IP.CUSTOMER_ID
JOIN premium_cte PP ON IP.POLICY_ID = PP.POLICY_ID
WHERE PP.STATUS = 'Paid'
GROUP BY C.CUSTOMER_NAME
)
select * from joins_cte

--dbt run -m s_c_l_query8_trans
