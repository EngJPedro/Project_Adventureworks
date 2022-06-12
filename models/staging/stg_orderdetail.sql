with
    source as (
        select
		/* Primary key */
          	salesorderdetailid

		/* Foreign key */

            , salesorderid
		    , specialofferid
            , rowguid
            , productid

		/* Others information */

            , unitprice
            , unitpricediscount
            , carriertrackingnumber
            , orderqty
            , modifieddate

		/* Stich column */

		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','salesorderdetail')}}
    )

select * from source