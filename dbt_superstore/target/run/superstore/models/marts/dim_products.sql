
  
    
    
    create  table
      "dev"."main_dwh"."dim_products__dbt_tmp"
  
    as (
      

select
    product_id,
    any_value(product_name) as product_name,
    any_value(category) as category,
    any_value(sub_category) as sub_category
from "dev"."main_stg"."stg_superstore"
group by product_id
    );
  
    
  