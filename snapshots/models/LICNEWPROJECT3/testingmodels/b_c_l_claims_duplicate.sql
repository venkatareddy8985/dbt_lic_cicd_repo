with claims_duplicate_cte as(
    select claim_id,policy_id,claim_date,claim_amount,reason,status
    from {{ source('cicdlic_src_snf', 'CLAIMS_DUPLICATE') }}
)
select*from claims_duplicate_cte



---dbt run -m b_c_l_claims_duplicate
