

select distinct
    md5(concat_ws('|', country, state, city, coalesce(postal_code, ''), region)) as location_key,
    country,
    state,
    city,
    postal_code,
    region
from "dev"."main_stg"."stg_superstore"