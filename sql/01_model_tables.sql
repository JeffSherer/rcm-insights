-- Create internal table from the visit_occurrence external file
create or replace table visit_occurrence as
select
  $1::number as visit_occurrence_id,
  $2::number as person_id,
  $3::string as visit_concept_id,
  $4::date as visit_start_date,
  $5::date as visit_end_date,
  $6::string as visit_type_concept_id,
  $7::string as provider_id,
  $8::string as care_site_id,
  $9::string as visit_source_value,
  $10::string as admitting_source_value
from @synpuf_stage
  (file_format => (type = csv field_optionally_enclosed_by = '"' skip_header = 1))
where metadata$filename ilike '%visit_occurrence%';
