select
    created_at,
    age_category,
    favorite_flavor
from {{ source('poll_results', 'results') }}
