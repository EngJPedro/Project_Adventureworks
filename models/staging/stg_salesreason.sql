with
    source as (
        select *
        from {{ source('project_adventureworks','salesreason')}}
    )

select * from source