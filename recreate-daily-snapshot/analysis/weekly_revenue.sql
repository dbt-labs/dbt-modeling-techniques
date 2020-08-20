with orders as (

    select * from {{ ref('daily_orders') }}
    where as_at_date = dateadd('day', 7, ordered_at::date)

),


final as (

    select
        date_trunc('week', ordered_at) as order_week,
        sum(order_amount) as order_amount,
        sum(refund_amount) as refund_amount, -- this is going to change over time
        sum(net_amount) as net_amount,

        count(*) as n_orders,
        count(case when refunded_at is not null then order_id end) as n_refunds,

        1.0 * n_refunds / nullif(n_orders, 0) as refund_rate

    from orders

    group by 1

)

select * from final
