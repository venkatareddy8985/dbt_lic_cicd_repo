with nominees_cte as(
    select nominee_id,policy_id,name,relationship,date_of_birth,contact_no
    from {{ source('cicdlic_src_snf', 'NOMINEES') }}
)
select*from nominees_cte

---dbt run -m b_c_l_nominees
