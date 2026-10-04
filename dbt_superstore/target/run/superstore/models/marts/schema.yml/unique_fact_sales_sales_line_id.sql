
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    sales_line_id as unique_field,
    count(*) as n_records

from "dev"."main_dwh"."fact_sales"
where sales_line_id is not null
group by sales_line_id
having count(*) > 1



  
  
      
    ) dbt_internal_test