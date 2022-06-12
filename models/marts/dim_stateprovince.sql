with
    selected as (
        select
          	stateprovinceid
           	, territoryid
		    , rowguid
            , name
		    , countryregioncode
		    , stateprovincecode
        from {{ ref('stg_stateprovince')}}
    )
    , transformed  as (
	select
		row_number () over (order by stateprovinceid) as stateprovince_sk
		, *
	from selected
    )

select * 
from transformed