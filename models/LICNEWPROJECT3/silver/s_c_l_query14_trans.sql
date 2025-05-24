---14.Monthly premium due amount by customer

with customers_cte as(
    select*from {{ ref('brn_lic_stg_customers') }}
),
insurancepolicies_cte as(
    select*from {{ ref('brn_lic_stg_insurance_policies') }}
),
premium_due_dates_cte as(
    select *from {{ ref('brn_lic_stg_premium_due_dates') }}
),
joins_query14_cte as(
    SELECT C.CUSTOMER_NAME, DATE_TRUNC('month', PD.DUE_DATE) AS MONTH, SUM(PD.DUE_AMOUNT) AS TOTAL_DUE
    FROM customers_cte C
    JOIN insurancepolicies_cte IP ON C.CUSTOMER_ID = IP.CUSTOMER_ID
    JOIN premium_due_dates_cte PD ON IP.POLICY_ID = PD.POLICY_ID
    WHERE PD.STATUS = 'Due'
    GROUP BY C.CUSTOMER_NAME, DATE_TRUNC('month', PD.DUE_DATE)
)
select*from joins_query14_cte

---dbt run -m s_c_l_query14_trans
