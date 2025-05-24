---7.Count of policies per policy type

with policies_cte as(
select policy_type ,count(*) as total_policies 
from {{ ref('brn_lic_stg_insurance_policies') }}
group by policy_type
)
select*from policies_cte

--dbt run -m s_c_l_query7_trans
