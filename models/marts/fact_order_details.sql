with
    address as (
	    select *
	    from {{ ref('dim_address') }}
    )
    , creditcard as (
	    select *
	    from {{ ref('dim_creditcard') }}
    )
    , customer as (
	    select *
	    from {{ ref('dim_customer') }}
    )
    , product as (
	    select *
	    from {{ ref('dim_product') }}
    )
    , sales_reason as (
	    select *
	    from {{ ref('dim_sales_reason') }}
    )
    , stateprovince as (
	    select *
	    from {{ ref('dim_stateprovince') }}
    )
    , salesorderheader_with_sk as (
	    select
	        salesorderheader.salesorderid
            , salesorderheader.salespersonid	
		    , salesorderheader.rowguid
		    , salesorderheader.territoryid
		    , customer.customer_sk as customer_fk
		    , creditcard.creditcard_sk as creditcard_fk
            , salesorderheader.purchaseordernumber
            , salesorderheader.taxamt
            , salesorderheader.status
		    , salesorderheader.orderdate
		    , salesorderheader.creditcardapprovalcode
		    , salesorderheader.subtotal
		    , salesorderheader.revisionnumber
		    , salesorderheader.freight
		    , salesorderheader.duedate
		    , salesorderheader.totaldue
		    , salesorderheader.shipdate
		    , salesorderheader.accountnumber
	  from {{ ref ('stg_order')}} as salesorderheader
	  left join customer on salesorderheader.customerid = customer.customerid
      left join creditcard on salesorderheader.creditcardid = creditcard.creditcardid
	)
    , salesorderdetail_with_sk as (
        select
            salesorderdetail.salesorderdetailid
            , salesorderdetail.salesorderid
		    , salesorderdetail.specialofferid
            , salesorderdetail.rowguid
            , product.product_sk as product_fk
            , salesorderdetail.unitprice
            , salesorderdetail.unitpricediscount
            , salesorderdetail.carriertrackingnumber
            , salesorderdetail.orderqty
            , salesorderdetail.modifieddate
            from {{ref('stg_orderdetail')}} as salesorderdetail
            left join product on salesorderdetail.productid = product.productid
    )
    , final as (
        select 
            salesorderheader_with_sk.salesorderid
            , salesorderheader_with_sk.salespersonid	
		    , salesorderheader_with_sk.rowguid
		    , salesorderheader_with_sk.territoryid
		    , salesorderheader_with_sk.customer_fk
		    , salesorderheader_with_sk.creditcard_fk
            , salesorderheader_with_sk.purchaseordernumber
            , salesorderheader_with_sk.taxamt
            , salesorderheader_with_sk.status
		    , salesorderheader_with_sk.orderdate
		    , salesorderheader_with_sk.creditcardapprovalcode
		    , salesorderheader_with_sk.subtotal
		    , salesorderheader_with_sk.revisionnumber
		    , salesorderheader_with_sk.freight
		    , salesorderheader_with_sk.duedate
		    , salesorderheader_with_sk.totaldue
		    , salesorderheader_with_sk.shipdate
		    , salesorderheader_with_sk.accountnumber
            , salesorderdetail_with_sk.salesorderdetailid
		    , salesorderdetail_with_sk.specialofferid
            , salesorderdetail_with_sk.product_fk
            , salesorderdetail_with_sk.unitprice
            , salesorderdetail_with_sk.unitpricediscount
            , salesorderdetail_with_sk.carriertrackingnumber
            , salesorderdetail_with_sk.orderqty
            , salesorderdetail_with_sk.modifieddate
        from salesorderheader_with_sk
        left join salesorderdetail_with_sk on salesorderheader_with_sk.salesorderid = salesorderdetail_with_sk.salesorderid
    )
select * from final