with
    source as (
        select
		/* Primary key */
          	salesreasonid

		/* Foreign key */

		/* Others information */

		    , name
            , reasontype
            , modifieddate

		/* Stich column */

		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','salesreason')}}
    )

select * from source
