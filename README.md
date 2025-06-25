# RCM Insights: Medicare Claims Analysis

This repo explores the CMS DE-SynPUF Medicare claims dataset (2008–2010). We begin with Python-based exploratory analysis, then transition into Snowflake for scalable, production-ready data workflows.

## Structure

- `data/raw/synpuf_sample1`: Synthetic Medicare claims data (not included in repo)
- `notebooks/`: Jupyter notebooks for EDA
- `sql/`: Snowflake SQL scripts for table creation and transformation
- `src/`: Python utility functions

## Current Progress

- Initial beneficiary-level EDA (demographics, age, mortality)
- Ready to migrate structured insights to Snowflake

## Coming Soon

- Snowflake staging and load scripts
- Notebook-to-SQL transitions
- Power analysis and downstream ML tasks (TBD)
