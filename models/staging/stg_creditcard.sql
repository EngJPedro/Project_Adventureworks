with
    source as (
        select
		/* Primary key */
          	creditcardid

		/* Foreign key */

            , cardtype
		    , cardnumber
            , expyear	
            , expmonth
            , modifieddate

		/* Stich column */
		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','creditcard')}}
    )

select * from source
