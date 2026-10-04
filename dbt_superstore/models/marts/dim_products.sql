{{ config(materialized='table') }}

select
    product_id,
    any_value(product_name) as product_name,
    any_value(category) as category,
    any_value(sub_category) as sub_category
from {{ ref('stg_superstore') }}
group by product_id
