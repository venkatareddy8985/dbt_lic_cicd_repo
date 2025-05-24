---s_c_l_query1_trans provides active policy and customer details.

---s_c_l_query4_trans provides premium collection by month.

---Then finally analyze how much premium is collected monthly per active_policies.

{{
    config(
        materialized='table',
        transient = false
    )
}}

with active_policies as (
    select *
    from {{ ref('s_c_l_query1_trans') }}
),
monthly_premiums as (
    select *
    from {{ ref('s_c_l_query4_trans') }}
)
select 
    ap.policy_id,
    ap.customer_name,
    ap.policy_name,
    ap.status,
    mp.month,
    mp.total_collected
from active_policies ap
left join monthly_premiums mp 
    on ap.policy_id = mp.policy_id


---dbt run -m s_c_l_query1_4_slr