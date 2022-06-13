with
    validation as (
        select sum (orderqty) as sum_val
        from {{ref ('fact_order_details')}}
    )

select * from validation where sum_val != 274914
