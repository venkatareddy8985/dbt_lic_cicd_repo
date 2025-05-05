----4.Premium Collection Trend (Monthly): s_query4_trans

with premium_payments_cte as(
    select date_trunc(month,payment_date) as month,
           sum(amount_paid) as total_collected 
    from {{ ref('b_c_l_premium_payments') }}
    group by month 
) 
select*from premium_payments_cte

---dbt run -m s_c_l_query4_trans
