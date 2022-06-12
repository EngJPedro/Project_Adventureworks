with
    source as (
        select *
        from {{ source('project_adventureworks','salesorderheader')}}
    )

select * from source