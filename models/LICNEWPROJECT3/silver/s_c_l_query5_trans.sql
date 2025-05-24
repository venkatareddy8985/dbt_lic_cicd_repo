---5.Find Policies with More Than One Nominee: 

with nominees_cte as(
    select policy_id,count(nominee_id) as num_nom
    from {{ ref('brn_lic_stg_nominees') }}
    group by policy_id having count(nominee_id)>1
)
select*from nominees_cte

---dbt run -m s_c_l_query5_trans
