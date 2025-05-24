with nominees_cte as(
    select nominee_id,policy_id,name,relationship,date_of_birth,contact_no
    from {{ source('incre_lic_src', 'STG_NOMINEES') }}
)
select * from nominees_cte

---dbt run -m brn_lic_stg_nominees