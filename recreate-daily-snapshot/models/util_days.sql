with days as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="'2020-01-01'",
        end_date="current_date()"
       )
    }}
)

select * from days
