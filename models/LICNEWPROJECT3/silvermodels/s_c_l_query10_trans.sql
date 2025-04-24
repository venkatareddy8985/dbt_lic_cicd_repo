---10.Total claim amount per policy

with claim_cte as(
    select policy_id,sum(claim_amount) as total_amount
    from {{ ref('b_c_l_claims') }}
    group by policy_id
)
select*from claim_cte

---dbt run -m s_c_l_query10_trans
