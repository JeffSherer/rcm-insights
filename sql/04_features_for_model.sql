create or replace table claim_features as
select
  person_id,
  year(visit_start_date)  as visit_year,
  month(visit_start_date) as visit_month,
  visit_type_concept_id,
  provider_id,
  care_site_id,
  length(visit_source_value) as source_val_len,
  denial_flag
from fact_claims_with_denial
where visit_start_date is not null;
