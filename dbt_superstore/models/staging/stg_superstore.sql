{{ config(materialized='view') }}

with source as (
    select * from {{ source('ods', 'raw_superstore') }}
),

renamed as (
    select
        cast("Row ID" as integer) as row_id,
        trim(cast("Order ID" as varchar)) as order_id,
        cast("Order Date" as date) as order_date,
        cast("Ship Date" as date) as ship_date,
        trim(cast("Ship Mode" as varchar)) as ship_mode,
        trim(cast("Customer ID" as varchar)) as customer_id,
        trim(cast("Customer Name" as varchar)) as customer_name,
        trim(cast("Segment" as varchar)) as segment,
        trim(cast("Country" as varchar)) as country,
        trim(cast("City" as varchar)) as city,
        trim(cast("State" as varchar)) as state,
        lpad(cast(cast("Postal Code" as bigint) as varchar), 5, '0') as postal_code,
        trim(cast("Region" as varchar)) as region,
        trim(cast("Product ID" as varchar)) as product_id,
        trim(cast("Category" as varchar)) as category,
        trim(cast("Sub-Category" as varchar)) as sub_category,
        trim(cast("Product Name" as varchar)) as product_name,
        cast("Sales" as decimal(18, 4)) as sales,
        cast("Quantity" as integer) as quantity,
        cast("Discount" as decimal(10, 4)) as discount,
        cast("Profit" as decimal(18, 4)) as profit
    from source
)

select
    *,
    date_diff('day', order_date, ship_date) as shipping_days,
    case when profit > 0 then true else false end as is_profitable,
    case when sales = 0 then null else round(profit / sales, 4) end as profit_margin
from renamed
