with
    source as (
        select
		/* Primary key */
          	addressid

		/* Foreign key */
                , rowguid
		/* Others informations */
                , city
		, countryregion
                , stateprovince	
                , postalcode

                , addressline1
                , addressline2
                , modifieddate

		/* Stich column */
		, _sdc_table_version
                , _sdc_received_at
                , _sdc_sequence
                , _sdc_batched_at

        from {{ source('project_adventureworks','address')}}
    )

select * from source