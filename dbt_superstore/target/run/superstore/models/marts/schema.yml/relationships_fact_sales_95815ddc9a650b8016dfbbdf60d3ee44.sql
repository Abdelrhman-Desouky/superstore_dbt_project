
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select location_key as from_field
    from "dev"."main_dwh"."fact_sales"
    where location_key is not null
),

parent as (
    select location_key as to_field
    from "dev"."main_dwh"."dim_locations"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test