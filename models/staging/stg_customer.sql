with
    source as (
        select
		/* Primary key */
          	customerid

		/* Foreign key */

            , rowguid
		    , territoryid
            , personid	
            , storeid

            , modifieddate

		/* Stich column */
		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','customer')}}
    )

select * from source