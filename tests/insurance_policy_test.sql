with insurance_policies_cte as(
    select policy_id,customer_id,policy_type,policy_name,sum_assured,premium_amount,policy_term_years,
            start_date,end_date,status
    from {{ source('cicdlic_src_snf', 'INSURANCE_POLICIES') }}
)
select*from insurance_policies_cte where policy_term_years<5


