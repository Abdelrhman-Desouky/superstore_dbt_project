
  
    
    
    create  table
      "dev"."main_dwh"."fact_sales__dbt_tmp"
  
    as (
      

select
    s.row_id as sales_line_id,
    s.order_id,
    cast(strftime(s.order_date, '%Y%m%d') as integer) as order_date_key,
    cast(strftime(s.ship_date, '%Y%m%d') as integer) as ship_date_key,
    s.customer_id,
    s.product_id,
    md5(concat_ws('|', s.country, s.state, s.city, coalesce(s.postal_code, ''), s.region)) as location_key,
    s.ship_mode,
    s.quantity,
    s.discount,
    s.sales,
    s.profit,
    s.profit_margin,
    s.shipping_days,
    s.is_profitable
from "dev"."main_stg"."stg_superstore" s
    );
  
    
  