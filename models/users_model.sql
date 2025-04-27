{{
    config(
        materialized='table'
    )
}}

select * from {{ source('cicdlic_src_snf', 'users_dup') }}