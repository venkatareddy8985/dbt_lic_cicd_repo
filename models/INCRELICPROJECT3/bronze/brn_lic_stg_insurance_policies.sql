with insurance_policies_cte as(
    select policy_id,customer_id,policy_type,policy_name,sum_assured,premium_amount,policy_term_years,start_date,end_date,status
    from {{ source('incre_lic_src', 'STG_INSURANCE_POLICIES') }}
)
select*from insurance_policies_cte

---dbt run -m brn_lic_stg_insurance_policies
