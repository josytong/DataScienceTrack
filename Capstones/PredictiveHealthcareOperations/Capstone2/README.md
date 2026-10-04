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
│   ├── 02_data_wrangling.ipynb
│   └── 03_exploratory_data_analysis.ipynb
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

## Exploratory Data Analysis

The EDA stage examines the distribution and relationships of variables relevant to the project question, with particular attention to **hospital capacity, utilization, and total discharges (`DIS_TOT`)**.

The analysis includes:

* Univariate analysis of numerical and categorical features
* Descriptive statistics and skewness
* Distribution visualizations for selected numerical variables
* Frequency analysis of categorical variables
* Relationship analysis between `DIS_TOT` and selected capacity/utilization variables
* Pearson correlation analysis
* Multicollinearity screening
* Identification of potential outliers and unusual data patterns
* Identification of potential target leakage
* Evaluation of candidate features for subsequent modeling

### Key EDA Findings

The EDA indicates that:

* Hospital capacity varies substantially across facilities.
* `LIC_BEDS`, `AVL_BEDS`, and `STF_BEDS` are relevant measures of hospital capacity.
* Discharge and utilization variables have strong positive relationships with `DIS_TOT`.
* Several operational, utilization, and financial variables are highly correlated and may contain redundant information.
* `DIS_TOT` is right-skewed and includes legitimate observations from high-volume hospitals.
* Missingness varies substantially across attributes and reporting periods.
* Identifier and contact fields are not meaningful predictive features.
* Discharge component variables require careful evaluation because they may introduce target leakage.
* Engineered capacity measures, such as a bed-availability ratio, may be appropriate candidates for further evaluation during feature engineering.

These findings provide the foundation for **preprocessing, feature selection, feature engineering, and predictive modeling**.

## Current Status

**Completed:**

* Data Acquisition
* Data Wrangling
* Exploratory Data Analysis

**Next:**

* Data Preprocessing
* Feature Selection and Engineering
* Predictive Model Development
* Model Evaluation

## Notebooks

### Data Wrangling

`notebooks/02_data_wrangling.ipynb`

Documents the process of combining, cleaning, validating, and preparing the HCAI quarterly datasets.

### Exploratory Data Analysis

`notebooks/03_exploratory_data_analysis.ipynb`

Documents the investigation of feature distributions, categorical variables, relationships with `DIS_TOT`, Pearson correlations, multicollinearity, and key EDA findings.

## Processed Dataset

The processed dataset is saved as:

`data/processed/hcai_hospital_data_clean.csv`
