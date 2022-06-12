with
    source as (
        select
		/* Primary key */
          	salesorderid

		/* Foreign key */

            , shipmethodid
		    , billtoaddressid
            , salespersonid	
		    , rowguid
		    , territoryid
		    , customerid
		    , currencyrateid
		    , creditcardid
		    , shiptoaddressid

		/* Others information */

            , modifieddate
            , purchaseordernumber
            , taxamt
            , status
            , onlineorderflag
		    , orderdate
		    , creditcardapprovalcode
		    , subtotal
		    , revisionnumber
		    , freight
		    , duedate
		    , totaldue
		    , shipdate
		    , accountnumber

		/* Stich column */
		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','salesorderheader')}}
    )

select * from source