---16.Rank policies by total premium paid per customer

with customers_cte as(
    select*from {{ ref('brn_lic_stg_customers') }}
),
insurancepolicies_cte as(
    select*from {{ ref('brn_lic_stg_insurance_policies') }}
),
Premium_Payments_cte as(
    select*from {{ ref('brn_lic_stg_premium_payments') }}
),
joins_query16_cte as(
    SELECT C.CUSTOMER_NAME,IP.POLICY_NAME,SUM(PP.AMOUNT_PAID) AS TOTAL_PAID,
           RANK() OVER (PARTITION BY C.CUSTOMER_ID ORDER BY SUM(PP.AMOUNT_PAID) DESC) AS POLICY_RANK
    FROM customers_cte C
    JOIN insurancepolicies_cte IP ON C.CUSTOMER_ID = IP.CUSTOMER_ID
    JOIN Premium_Payments_cte PP ON IP.POLICY_ID = PP.POLICY_ID
    WHERE PP.STATUS = 'Paid'
    GROUP BY C.CUSTOMER_NAME, IP.POLICY_NAME, C.CUSTOMER_ID
)
select*from joins_query16_cte

---dbt run -m s_c_l_query16_trans
