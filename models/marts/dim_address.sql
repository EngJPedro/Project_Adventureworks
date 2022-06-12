with
    selected as (
        select
          	addressid
           	, rowguid
		    , city
            , countryregion
            , stateprovince
		    , postalcode
		, modifieddate
        from {{ ref('stg_address')}}
    )
    , transformed  as (
	select
		row_number () over (order by addressid) as address_sk
		, *
	from selected
    )

select * 
from transformed