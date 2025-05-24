{{
    config(
        materialized='table'
    )
}}

select*from {{ source('cicdlic_src_snf', 'CLAIMS_DUPLICATE') }}