
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select location_key
from "dev"."main_dwh"."dim_locations"
where location_key is null



  
  
      
    ) dbt_internal_test