with orders as (

    select * from {{ ref('stg_orders') }}

),

util_days as (

    select * from {{ ref('util_days') }}

),

spined as (

    select
        orders.order_id,
        util_days.date_day as as_at_date,

        orders.ordered_at  as ordered_at,
        orders.order_amount,

        case
            when as_at_date >= orders.refunded_at then orders.refunded_at
        end as refunded_at,

        -- nullif(orders.refunded_at, as_at_date <= orders.refunded_at)

        case
            when as_at_date >= orders.refunded_at  then refund_amount
            else 0
        end as refund_amount

    from orders

    left join util_days
        -- all days after order date
        on util_days.date_day >= orders.ordered_at
        -- and before today
        and util_days.date_day <= current_timestamp()

),

final as (

    select
        order_id,
        as_at_date,
        ordered_at,
        order_amount,
        refund_amount,
        order_amount - refund_amount as net_amount


    from spined

)

select * from final
