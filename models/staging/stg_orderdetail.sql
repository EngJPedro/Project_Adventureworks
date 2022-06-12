with
    source as (
        select *
        from {{ source('project_adventureworks','salesorderdetail')}}
    )

select * from source