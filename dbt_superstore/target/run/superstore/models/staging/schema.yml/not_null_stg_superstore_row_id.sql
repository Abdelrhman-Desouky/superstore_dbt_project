
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select row_id
from "dev"."main_stg"."stg_superstore"
where row_id is null



  
  
      
    ) dbt_internal_test