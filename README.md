# RCM Insights: DE-SynPUF Beneficiary Analysis

This project explores the **CMS 2008–2010 Data Entrepreneurs' Synthetic Public Use File (DE-SynPUF)**, focusing on the 2010 beneficiary summary data. The goal is to perform foundational data analysis that supports identifying value-driven opportunities for automation and AI within revenue cycle operations.

---

## 📁 Dataset

- **Source**: [CMS DE-SynPUF](https://www.cms.gov/data-research/synthetic-public-use-file)
- **Subset used**: 2010 Beneficiary Summary File (Sample 1)

---

## 🎯 Objectives

- Explore patient-level reimbursement and chronic condition patterns
- Set up SQL data structures for Snowflake ingestion
- Enable downstream scoring and opportunity assessment for AI-driven RCM improvements

---

## 🗂️ Project Structure

rcm-insights/
├── data/
│ ├── raw/
│ │ └── synpuf_sample1/
├── notebooks/
│ └── eda_synpuf_ben_summary_2010.ipynb
├── sql/
│ ├── 01_create_beneficiary_table.sql
│ ├── 02_copy_into_beneficiary.sql
│ └── 03_ai_opportunity_queries.sql
├── requirements.txt
└── README.md

---

## 📓 Notebooks

### `eda_synpuf_ben_summary_2010.ipynb`

Performs exploratory analysis on 2010 beneficiary data:

- Distribution of total reimbursement
- Count of chronic conditions per patient
- Relationship between cost and condition count
- Sample heuristic to flag potentially interesting segments

---

## 💾 SQL Scripts

- `01_create_beneficiary_table.sql`: Creates Snowflake table for beneficiary data
- `02_copy_into_beneficiary.sql`: Loads CSV data into Snowflake
- `03_ai_opportunity_queries.sql`: Example queries highlighting potential segmentation and targeting

---

## 🛠️ Installation

Install Python dependencies:

```bash
pip install -r requirements.txt
