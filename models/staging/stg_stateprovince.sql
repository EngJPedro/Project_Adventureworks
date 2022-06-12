with
    source as (
        select
		/* Primary key */
          	stateprovinceid

		/* Foreign key */

		    , territoryid
		    , rowguid

		/* Others information */

		    , name
            , countryregioncode
		    , stateprovincecode
		    , isonlystateprovinceflag
            , modifieddate

		/* Stich column */

		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','stateprovince')}}
    )

select * from source