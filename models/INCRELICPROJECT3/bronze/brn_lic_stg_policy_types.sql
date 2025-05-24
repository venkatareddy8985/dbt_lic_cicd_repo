with policy_types_cte as(
    select policy_type,description,policy_date
    from {{ source('incre_lic_src', 'STG_POLICY_TYPES') }}
)
select * from policy_types_cte

---dbt run -m brn_lic_stg_policy_types