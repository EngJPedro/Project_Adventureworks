with
    selected as (
        select
          	productid
           	, productmodelid
		    , productcategoryid
            , rowguid
            , name
		    , productnumber
		    , listprice
		    , standardcost
		    , size
		    , color
		    , weight

        from {{ ref('stg_product')}}
    )
    , transformed  as (
	select
		row_number () over (order by productid) as product_sk
		, *
	from selected
    )

select * 
from transformed