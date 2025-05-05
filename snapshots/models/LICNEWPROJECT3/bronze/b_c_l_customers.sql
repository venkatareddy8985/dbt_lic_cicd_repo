with customers_cte as(
    select customer_id,customer_name,date_of_birth,gender,phone_no,email,country_code,city
    from {{ source('cicdlic_src_snf', 'CUSTOMERS') }}
)
select*from customers_cte

---dbt run -m b_c_l_customers
