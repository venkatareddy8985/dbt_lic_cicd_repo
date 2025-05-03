with claims_cte as(
    select claim_id,policy_id,claim_date,claim_amount,reason,status
    from {{ source('cicdlic_src_snf', 'CLAIMS') }}
)
select*from claims_cte



---dbt run -m b_c_l_claims
