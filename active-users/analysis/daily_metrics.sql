with active_users as (
    select * from {{ ref('user_active_days_spined') }}
),

final as (
    select
        date_day,

        sum(is_active_today::integer) as daily_active_users,
        sum(is_active_l7_days::integer) as weekly_active_users,
        sum(is_active_l30_days::integer) as monthly_active_users

    from active_users

    group by 1
)

select * from final
order by date_day
