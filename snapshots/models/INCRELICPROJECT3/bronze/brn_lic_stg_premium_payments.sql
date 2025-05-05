with premium_payments_cte as(
    select payment_id,policy_id,payment_date,amount_paid,payment_mode,status
    from {{ source('incre_lic_src', 'STG_PREMIUM_PAYMENTS') }}
)
select*from premium_payments_cte

---dbt run -m brn_lic_stg_premium_payments