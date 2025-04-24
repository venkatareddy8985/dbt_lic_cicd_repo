with premium_payments_cte as(
    select payment_id,policy_id,payment_date,amount_paid,payment_mode,status
    from {{ source('cicdlic_src_snf', 'PREMIUM_PAYMENTS') }}
)
select*from premium_payments_cte

---dbt run -m b_c_l_premium_payments
