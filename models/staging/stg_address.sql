with
    source as (
        select *
        from {{ source('project_adventureworks','address')}}
    )

select * from source