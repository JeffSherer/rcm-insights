create or replace table fact_claims_with_denial as
select
  v.*,
  case when total_paid is null or total_paid = 0 then 1 else 0 end as denial_flag
from visit_occurrence v;
