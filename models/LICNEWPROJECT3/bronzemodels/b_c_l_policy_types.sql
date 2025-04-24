with policy_types_cte as(
    select policy_type,description
    from {{ source('cicdlic_src_snf', 'POLICY_TYPES') }}
)
select*from policy_types_cte

---dbt run -m b_c_l_policy_types
