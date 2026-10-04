{{ config(materialized='table') }}

select
    customer_id,
    any_value(customer_name) as customer_name,
    any_value(segment) as segment,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(distinct order_id) as number_of_orders,
    round(sum(sales), 2) as lifetime_sales,
    round(sum(profit), 2) as lifetime_profit
from {{ ref('stg_superstore') }}
group by customer_id
