---13.Overdue premiums by policy

with premium_due_dates as(
    select policy_id,due_date,DUE_AMOUNT
    from {{ ref('b_c_l_premium_due_dates') }}
    where status='Overdue'
)
select*from premium_due_dates

---dbt run -m s_c_l_query13_trans
