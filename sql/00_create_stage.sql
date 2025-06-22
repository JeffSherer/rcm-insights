-- Create database and schema
create database if not exists rcm_lab;
use schema rcm_lab.public;

-- Create external stage to read CMS SynPUF data from public S3
create or replace stage synpuf_stage
  url = 's3://synpuf-omop/1k/'
  file_format = (type = csv field_optionally_enclosed_by = '"' skip_header = 1);

-- Optional: preview the files
-- list @synpuf_stage limit 10;
