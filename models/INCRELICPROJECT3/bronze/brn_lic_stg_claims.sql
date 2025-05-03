with claims_cte as(
    select claim_id,policy_id,claim_date,claim_amount,reason,status
    from {{ source('incre_lic_src', 'STG_CLAIMS') }}
)
select*from claims_cte

--dbt run -m brn_lic_stg_claims