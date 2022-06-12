with
    selected as (
        select
          	customerid
           	, rowguid
		    , territoryid
            , personid	
            , storeid
		    , modifieddate
        from {{ ref('stg_customer')}}
    )
    , transformed  as (
	select
		row_number () over (order by customerid) as customer_sk
		, *
	from selected
    )

select * 
from transformed
