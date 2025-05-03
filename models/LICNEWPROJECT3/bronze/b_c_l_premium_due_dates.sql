with premium_due_dates_cte as(
    select due_id,policy_id,due_date,due_amount,status,remarks
    from {{ source('cicdlic_src_snf', 'PREMIUM_DUE_DATES') }}
)
select*from premium_due_dates_cte

---dbt run -m b_c_l_premium_due_dates
