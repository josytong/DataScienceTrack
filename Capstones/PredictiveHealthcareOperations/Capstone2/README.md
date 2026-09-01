# Capstone 2: Predictive Healthcare Operations & Capacity Analytics

## Project Overview

This project uses California hospital financial and utilization data from the California Department of Health Care Access and Information (HCAI) to investigate patterns in hospital operations and develop predictive analytics for healthcare capacity and performance.

The dataset covers quarterly hospital information from **2021 Q1 through 2026 Q1**.

## Project Structure

```text
Capstone2/
├── data/
│   ├── raw/
│   │   └── HCAI quarterly CSV files
│   └── processed/
│       └── hcai_hospital_data_clean.csv
├── docs/
├── notebooks/
│   └── 02_data_wrangling.ipynb
├── reports/
└── slides/
```

## Data

The project uses **21 quarterly HCAI datasets** covering 2021 Q1 through 2026 Q1.

After combining the files:

* **9,179 hospital-quarter records**
* **159 variables**
* **21 reporting periods**

The HCAI data structure changed during the study period. Files from 2021 Q1–2023 Q4 contain 133 variables, while files from 2024 Q1–2026 Q1 contain 146 variables.

## Data Wrangling

The Data Wrangling stage included:

* Loading and combining the 21 quarterly datasets
* Reviewing dataset structure and variables
* Checking reporting periods
* Identifying schema changes
* Checking for duplicate records
* Investigating missing values
* Standardizing text and date fields
* Investigating negative financial values
* Checking hospital bed-count consistency
* Identifying potential statistical outliers
* Performing a final data-quality check
* Saving the processed dataset

### Data Quality Results

* Exact duplicate rows: **0**
* Duplicate facility-quarter records: **0**
* Total missing values: **194,694**
* Potentially inconsistent bed-count records: **120**
* Potential outliers were identified but retained because extreme values may represent legitimate differences between hospitals.

Missing values, negative values, and potential outliers were not automatically removed because their validity depends on the HCAI variable definitions and the characteristics of individual hospitals.

## Current Status

**Completed:** Data Acquisition and Data Wrangling

**Next:** Exploratory Data Analysis and preprocessing

## Notebook

The Data Wrangling work is documented in:

`notebooks/02_data_wrangling.ipynb`

The processed dataset is saved as:

`data/processed/hcai_hospital_data_clean.csv`

