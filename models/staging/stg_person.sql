with
    source as (
        select
		/* Primary key */
          	businessentityid

		/* Foreign key */

            , rowguid

		/* Others information */

		    , title
            , firstname
            , middlename
            , lastname
            , namestyle
		    , suffix
		    , persontype
		    , emailpromotion
            , modifieddate

		/* Stich column */

		    , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at

        from {{ source('project_adventureworks','person')}}
    )

select * from source