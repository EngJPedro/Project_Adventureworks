with
    selected as (
        select
          	creditcardid
           	, cardtype
		    , cardnumber
            , expyear
            , expmonth
		    , modifieddate
        from {{ ref('stg_creditcard')}}
    )
    , transformed  as (
	select
		row_number () over (order by creditcardid) as creditcard_sk
		, *
	from selected
    )

select * 
from transformed
