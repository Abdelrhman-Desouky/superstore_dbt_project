
  
    
    
    create  table
      "dev"."main_dwh"."dim_dates__dbt_tmp"
  
    as (
      

with bounds as (
    select min(order_date) as min_date, max(ship_date) as max_date
    from "dev"."main_stg"."stg_superstore"
),
calendar as (
    select cast(d as date) as date_day
    from bounds,
    unnest(generate_series(min_date, max_date, interval 1 day)) as t(d)
)
select
    cast(strftime(date_day, '%Y%m%d') as integer) as date_key,
    date_day,
    year(date_day) as year,
    quarter(date_day) as quarter,
    month(date_day) as month,
    monthname(date_day) as month_name,
    day(date_day) as day_of_month,
    dayofweek(date_day) as day_of_week,
    weekofyear(date_day) as week_of_year
from calendar
    );
  
    
  