---3.Count of Claims by Status: 

with claims_cte as(
    select status,count(*) as total_claims
    from {{ ref('b_c_l_claims') }}
    group by status order by status asc
)
select*from claims_cte

--dbt run -m s_c_l_query3_trans
