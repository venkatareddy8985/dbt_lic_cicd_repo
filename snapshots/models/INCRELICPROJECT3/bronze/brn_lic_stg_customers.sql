with customers_cte as(
    select customer_id,customer_name,date_of_birth,gender,phone_no,email,country_code,city
    from {{ source('incre_lic_src', 'STG_CUSTOMERS') }}
)
select * from customers_cte

---dbt run -m brn_lic_stg_customers