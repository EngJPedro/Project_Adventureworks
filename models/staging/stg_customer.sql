with
    source as (
        select *
        from {{ source('project_adventureworks','customer')}}
    )

select * from source