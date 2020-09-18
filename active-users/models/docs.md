{% docs user_active_days_spined %}
One record per user per day since first active.

Sample results:

| date_day   | user_id | is_active_today | is_active_l7_days | is_active_l30_days |
|------------|---------|-----------------|-------------------|--------------------|
| 2020-08-13 | 1       | true            | true              | true               |
| 2020-08-14 | 1       | false           | true              | true               |
| 2020-08-15 | 1       | false           | true              | true               |
| 2020-08-16 | 1       | false           | true              | true               |
| 2020-08-17 | 1       | false           | true              | true               |
| 2020-08-18 | 1       | false           | true              | true               |
| 2020-08-19 | 1       | false           | true              | true               |
| 2020-08-20 | 1       | false           | false             | true               |
| 2020-08-21 | 1       | false           | false             | true               |
| 2020-08-22 | 1       | false           | false             | true               |
| .. | ..       | ..           | ..             | ..               |


{% enddocs %}
