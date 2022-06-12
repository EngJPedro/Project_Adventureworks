with
    source as (
        select *
        from {{ source('project_adventureworks','person')}}
    )

select * from source