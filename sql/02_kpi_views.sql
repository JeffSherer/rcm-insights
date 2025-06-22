-- Create a monthly summary of claims
create or replace view v_claims_kpis as
select
  date_trunc('month', visit_start_date) as claim_month,
  count(*) as total_claims
from visit_occurrence
where visit_start_date is not null
group by 1
order by 1;
