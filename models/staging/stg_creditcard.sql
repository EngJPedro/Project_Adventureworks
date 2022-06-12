with
    source as (
        select *
        from {{ source('project_adventureworks','creditcard')}}
    )

select * from source