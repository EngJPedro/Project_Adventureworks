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
	)
select * from salesorderheader_with_sk