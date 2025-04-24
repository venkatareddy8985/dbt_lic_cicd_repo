---9.Policies with failed premium payments: s_query9.sql

with insupoli_cte as(
    select*from {{ ref('b_c_l_insurance_policies') }}
), 
prempay_cte as(
    select*from {{ ref('b_c_l_premium_payments') }}
),
joins_query9_cte as(
    SELECT DISTINCT ip.policy_name
    FROM  insupoli_cte ip join prempay_cte PP
    ON ip.policy_id = pp.policy_id
    WHERE pp.status='Failed'
)
select*from joins_query9_cte

---dbt run -m s_c_l_query9_trans

