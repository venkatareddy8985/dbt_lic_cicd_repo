--2.Total Premium Collected per Policy Type: 

with insurance_policies_cte as(
    select policy_id,customer_id,policy_type,policy_name
    from {{ ref('b_c_l_insurance_policies') }}
),
policy_types_cte as(
    select policy_type,description
    from {{ ref('b_c_l_policy_types') }}
),
premium_payments_cte as(
    select payment_id,policy_id,payment_date,amount_paid,payment_mode,status
    from {{ ref('b_c_l_premium_payments') }}
),
joins_cte as(
    select  ip.policy_type,
            pt.description,
            sum(pp.amount_paid) as TOTAL_PREMIUM_COLLECTED
    from insurance_policies_cte as ip join premium_payments_cte as pp 
         on ip.policy_id = pp.policy_id join policy_types_cte as pt 
         on ip.policy_type = pt.policy_type
         where pp.status='Paid'
         group by ip.policy_type,pt.description
)
select*from joins_cte
   
   ---dbt run -m s_c_l_query2_trans
