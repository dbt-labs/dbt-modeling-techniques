with orders as (

    select * from {{ ref('raw_orders') }}

),

final as (

    select
        id as order_id,
        user_id,

        -- dates
        ordered_at,
        refunded_at,

        -- amounts
        amount as order_amount,

        case
            when refunded_at is not null then amount
            else 0
        end as refund_amount, -- this is going to change over time

        order_amount - refund_amount as net_amount -- as is this


    from orders

)

select * from final
