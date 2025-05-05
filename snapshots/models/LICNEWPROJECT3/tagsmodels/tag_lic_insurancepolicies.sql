{{
    config(
        tags=["life_insurance"]
    )
}}

{{
    config(
        materialized='table'
    )
}}

select*from {{ ref('b_c_l_insurance_policies') }}