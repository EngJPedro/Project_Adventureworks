with
    source as (
        select *
        from {{ source('project_adventureworks','product')}}
    )

select * from source