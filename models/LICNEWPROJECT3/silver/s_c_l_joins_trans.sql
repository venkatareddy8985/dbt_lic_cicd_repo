with insurance_policies_cte as(
    select policy_id,customer_id,policy_type,policy_name,sum_assured,premium_amount,policy_term_years,
            start_date,end_date,status
    from {{ ref('brn_lic_stg_insurance_policies') }}
),
customers_cte as(
    select customer_id,customer_name,date_of_birth,gender,phone_no,email,country_code,city
    from {{ ref('brn_lic_stg_customers') }}
),
policy_types_cte as(
    select policy_type,description
    from {{ ref('brn_lic_stg_policy_types') }}
),
premium_payments_cte as(
    select payment_id,policy_id,payment_date,amount_paid,payment_mode,status
    from {{ ref('brn_lic_stg_premium_payments') }}
),
claims_cte as(
    select claim_id,policy_id,claim_date,claim_amount,reason,status
    from {{ ref('brn_lic_stg_claims') }}
),
nominees_cte as (
    select nominee_id,policy_id,name,relationship,date_of_birth,contact_no
    from {{ ref('brn_lic_stg_nominees') }}
),
premium_due_dates_cte as(
    select due_id,policy_id,due_date,due_amount,status,remarks
    from {{ ref('brn_lic_stg_premium_due_dates') }}
),
countries_cte as(
    select country_code,country_name,currency_code
    from {{ ref('brn_lic_stg_countries') }}
),
currencies_cte as(
    select currency_code,currency_name,exchange_rate_to_inr,last_updated
    from {{ ref('brn_lic_stg_currencies') }}
),
joins1_cte as(
    select 
           ip.policy_name,ip.sum_assured,ip.premium_amount,ip.policy_term_years,ip.start_date,ip.end_date,ip.status,
           cu.customer_name,cu.date_of_birth,cu.gender,cu.phone_no,cu.email,cu.city,
           pt.description,
           pp.payment_id,pp.payment_date,pp.amount_paid,pp.payment_mode,pp.status as statuspp,
           cl.claim_id,cl.claim_date,cl.claim_amount,cl.reason,cl.status as statuscl,
           nm.nominee_id,nm.name,nm.relationship,nm.date_of_birth as dob,nm.contact_no,
           dd.due_id,dd.due_date,dd.due_amount,dd.status as statusdd,dd.remarks,
           co.country_name,
           cr.currency_name,cr.exchange_rate_to_inr,cr.last_updated
    from insurance_policies_cte as ip left outer join customers_cte as cu
         on ip.customer_id = cu.customer_id left outer join policy_types_cte as pt
         on ip.policy_type = pt.policy_type left outer join premium_payments_cte as pp
         on ip.policy_id = pp.policy_id left outer join claims_cte as cl 
         on ip.policy_id = cl.policy_id left outer join nominees_cte as nm
         on ip.policy_id = nm.policy_id left outer join premium_due_dates_cte as dd 
         on ip.policy_id = dd.policy_id left outer join countries_cte as co
         on cu.country_code = co.country_code left outer join currencies_cte as cr
         on co.currency_code = cr.currency_code
)
select*from joins1_cte

---dbt run -m s_joins_trans
