
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales_line_id
from "dev"."main_dwh"."fact_sales"
where sales_line_id is null



  
  
      
    ) dbt_internal_test