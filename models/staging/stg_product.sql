with
    source as (
        select
		/* Primary key */
          	productid

		/* Foreign key */

            , productmodelid
		    , productcategoryid
		    , rowguid

		/* Others information */

		    , name
            , productnumber
            , listprice
            , standardcost
            , size
		    , color
		    , weight
		    , sellstartdate
            , sellenddate
		    , modifieddate
		    , thumbnailphotofilename

		/* Stich column */

		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','product')}}
    )

select * from source