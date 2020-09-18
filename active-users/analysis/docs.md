{% docs daily_metrics %}

This is stored as an analysis, as we may want to do this rollup in the BI layer,
rather than in dbt.

For each day, we calculate the DAU, WAU and MAU.

Sample results:

| date_day   | daily_active_users | weekly_active_users | monthly_active_users |
|------------|--------------------|---------------------|----------------------|
| ..         | ..                 | ..                  | ..                   |
| 2020-09-01 | 2                  | 2                   | 2                    |
| 2020-09-02 | 0                  | 2                   | 2                    |
| 2020-09-03 | 0                  | 2                   | 2                    |
| 2020-09-04 | 1                  | 2                   | 2                    |
| 2020-09-05 | 1                  | 2                   | 2                    |
| 2020-09-06 | 0                  | 2                   | 2                    |
| 2020-09-07 | 0                  | 2                   | 2                    |
| 2020-09-08 | 0                  | 1                   | 2                    |
| 2020-09-09 | 0                  | 1                   | 2                    |
| 2020-09-10 | 0                  | 1                   | 2                    |
| 2020-09-11 | 0                  | 1                   | 2                    |
| 2020-09-12 | 1                  | 1                   | 2                    |
| 2020-09-13 | 0                  | 1                   | 2                    |
| 2020-09-14 | 0                  | 1                   | 2                    |
| 2020-09-15 | 0                  | 1                   | 2                    |
| 2020-09-16 | 0                  | 1                   | 2                    |
| 2020-09-17 | 1                  | 1                   | 2                    |
| ..         | ..                 | ..                  | ..                   |



{% enddocs %}
