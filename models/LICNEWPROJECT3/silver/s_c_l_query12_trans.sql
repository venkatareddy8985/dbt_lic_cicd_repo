---12.Policies with nominees under 18 years

with insurancepolicies_cte as(
    select*from {{ ref('brn_lic_stg_insurance_policies') }}
),
nominees_cte as(
    select*from {{ ref('brn_lic_stg_nominees') }}
),
joins_query12_cte as(
    select ip.policy_name,n.nominee_id,n.name as nominee_name,n.date_of_birth
    from nominees_cte n join insurancepolicies_cte ip
    on n.policy_id=ip.policy_id
    where n.date_of_birth <  '18'
)
select*from joins_query12_cte

---dbt run -m s_c_l_query12_trans
