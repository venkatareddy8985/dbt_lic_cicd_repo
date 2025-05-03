{{
    config(
        materialized='table'
    )
}}
with joins1_cte as(
    select 
           policy_name,
           sum_assured,
           premium_amount,
           policy_term_years,
           start_date,
           end_date,
           status,
           customer_name,
           date_of_birth,
           gender,
           phone_no,
           email,
           city,
           description,
           payment_id,
           payment_date,
           amount_paid,
           payment_mode,
           status as statuspp,
           claim_id,
           claim_date,
           claim_amount,
           reason,
           status as statuscl,
           nominee_id,
           name,
           relationship,
           date_of_birth as dob,
           contact_no,
           due_id,
           due_date,
           due_amount,
           status as statusdd,
           remarks,
           country_name,
           currency_name,
           exchange_rate_to_inr,
           last_updated
    from {{ ref('sil_lic_trans_leftjoin') }}
)
select*from joins1_cte

---dbt run -m gol_lic_final_consum