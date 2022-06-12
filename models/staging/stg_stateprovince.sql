with
    source as (
        select *
        from {{ source('project_adventureworks','stateprovince')}}
    )

select * from source