## Project Overview

This project connects to CMS DE-SynPUF data in Snowflake and performs exploratory analysis to surface potential automation and AI opportunities in Revenue Cycle Management (RCM).

### Tools
- Python
- Jupyter Notebooks
- Snowflake (Python connector)

### Repository Structure
rcm-insights/
├── data/ # Input files and raw data
│ ├── ai_opportunity_candidates.csv
│ └── raw/
├── notebooks/ # Exploratory and Snowflake notebooks
│ ├── eda_synpuf_ben_summary_2010.ipynb
│ └── snowflake_connection_test.ipynb
├── src/ # Utility functions
│ └── utils.py
├── requirements.txt # Environment dependencies
└── README.md