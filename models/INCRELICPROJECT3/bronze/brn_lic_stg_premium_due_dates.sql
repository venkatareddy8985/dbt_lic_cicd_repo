with premium_due_dates_cte as(
    select due_id,policy_id,due_date,due_amount,status,remarks
    from {{ source('incre_lic_src', 'STG_PREMIUM_DUE_DATES') }}
)
select * from premium_due_dates_cte

---dbt run -m brn_lic_stg_premium_due_dates