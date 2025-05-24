
with insurance_policies_cte as
(
    select policy_id,customer_id,policy_type,policy_name,sum_assured,premium_amount,policy_term_years,
            start_date,end_date,status
    from {{ ref('b_c_l_insurance_policies') }}
),
customers_cte as
(   
    select customer_id,customer_name,date_of_birth,gender,phone_no,email,country_code,city
    from {{ ref('b_c_l_customers') }}
),
joins_poli_cust_cte as(
    select ip.policy_id,ip.policy_type,ip.policy_name,ip.sum_assured,ip.premium_amount,ip.status,
            cu.customer_name,cu.date_of_birth,cu.gender
    from insurance_policies_cte as ip left outer join customers_cte as cu
         on ip.customer_id  = cu.customer_id
         where ip.status='Active'
)
select*from joins_poli_cust_cte

---dbt run -m s_c_l_query1_slr

