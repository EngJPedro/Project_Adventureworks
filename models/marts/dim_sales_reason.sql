with
    selected as (
        select
          	salesreasonid
           	, name
		    , reasontype
            , modifieddate

        from {{ ref('stg_salesreason')}}
    )
    , transformed  as (
	select
		row_number () over (order by salesreasonid) as salesreason_sk
		, *
	from selected
    )

select * 
from transformed
