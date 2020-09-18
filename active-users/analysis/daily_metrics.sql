with active_users as (
    select * from {{ ref('user_active_days_spined') }}
),

final as (
    select
        date_day,

        count(distinct case when is_active_today then user_id end) as daily_active_users,
        count(distinct case when is_active_l7_days then user_id end) as weekly_active_users,
        count(distinct case when is_active_l30_days then user_id end) as monthly_active_users

    from active_users

    group by 1
)

select * from final
order by date_day
