
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sales
from "dev"."main_stg"."stg_superstore"
where sales is null



  
  
      
    ) dbt_internal_test