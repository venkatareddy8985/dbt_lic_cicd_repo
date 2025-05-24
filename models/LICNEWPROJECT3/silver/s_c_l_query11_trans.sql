---11.List of approved claims with customer details

with insurancepolicies_cte as(
    select*from {{ ref('brn_lic_stg_insurance_policies') }}
),
customers_cte as(
    select*from {{ ref('brn_lic_stg_customers') }}
),
claims_cte as(
    select*from {{ ref('brn_lic_stg_claims') }}
),
joints_query11_cte as(
    select c.customer_name,ip.policy_type,ip.policy_name,cl.claim_id,cl.claim_amount
    from customers_cte c join insurancepolicies_cte ip
    on c.customer_id=ip.customer_id join claims_cte cl
    on ip.policy_id=cl.policy_id
    where cl.status='Approved'
)
select*from joints_query11_cte

---dbt run -m s_c_l_query11_trans
