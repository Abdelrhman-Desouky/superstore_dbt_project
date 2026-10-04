
  
    
    
    create  table
      "dev"."main_dwh"."agg_monthly_sales__dbt_tmp"
  
    as (
      

select
    date_trunc('month', order_date) as month,
    region,
    category,
    count(distinct order_id) as orders,
    sum(quantity) as units_sold,
    round(sum(sales), 2) as sales,
    round(sum(profit), 2) as profit,
    round(sum(profit) / nullif(sum(sales), 0), 4) as profit_margin
from "dev"."main_stg"."stg_superstore"
group by 1, 2, 3
    );
  
    
  