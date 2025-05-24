-- models/s_c_l_combined_query_11_12_trans.sql

---11.List of approved claims with customer details
---12.Policies with nominees under 18 years


with query11 as (
    select * from {{ ref('s_c_l_query11_trans') }}
),
query12 as (
    select * from {{ ref('s_c_l_query12_trans') }}
)

select
    q11.customer_name,
    q11.policy_type,
    q11.policy_name,
    q11.claim_id,
    q11.claim_amount,
    q12.nominee_id,
    q12.nominee_name,
    q12.date_of_birth
from query11 q11
left join query12 q12
    on q11.policy_name = q12.policy_name

    ---dbt run -m s_c_l_query11_12_slr
