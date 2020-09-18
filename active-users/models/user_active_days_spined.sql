with user_active_days as (
    select * from {{ ref('user_active_days') }}
),

all_days as (
    select * from {{ ref('all_days') }}
),

user_first_active_day as (
    select
        user_id,
        min(date_day) as first_active_day
    from user_active_days
    group by 1
),

-- use a date spine to fill in missing days
spined as (
    select
        user_first_active_day.user_id,
        all_days.date_day
    from user_first_active_day
    left join all_days
        -- all days after the user was first active
        on all_days.date_day >= user_first_active_day.first_active_day
),

filled as (
    select
        spined.date_day,
        spined.user_id,

        coalesce(user_active_days.is_active, false) as is_active_today,

        max(is_active_today) over (
            partition by spined.user_id
            order by spined.date_day
            rows between 6 preceding and current row
        ) as is_active_l7_days,

        max(is_active_today) over (
            partition by spined.user_id
            order by spined.date_day
            rows between 29 preceding and current row
        ) as is_active_l30_days

    from spined

    left join user_active_days
        on spined.date_day = user_active_days.date_day
        and spined.user_id = user_active_days.user_id
)

select * from filled
