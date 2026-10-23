# Customer Churn Analysis and Retention Dashboard

## Project Overview

This project focuses on preparing and analyzing customer data to understand churn patterns and support data-driven customer-retention decisions. It includes an original messy dataset and a cleaned dataset prepared for further analysis.

The project is designed to demonstrate a practical data-analytics workflow: data inspection, data cleaning, feature preparation, exploratory analysis, SQL analysis, and dashboard reporting.

## Dataset

Two dataset files are part of the project:

| File | Description | Records | Columns |
|---|---|---:|---:|
| `Customer_Churn_Messy_Data.csv` | Original dataset containing inconsistent and messy values | 5,280 | 22 |
| `Customer_Churn_Cleaned_Data.csv` | Processed dataset with standardized column names and additional analysis fields | 5,000 | 25 |

### Main fields

The datasets contain customer and service-related fields such as:

- Customer attributes: age, gender, state, partner, dependents, and senior-citizen status
- Account details: signup date, tenure, contract, and paperless billing
- Service and payment details: internet service, payment method, monthly charges, and total charges
- Customer experience: number of support calls and satisfaction score
- Target field: churn status

The cleaned dataset also includes derived fields such as `agegroup`, `year`, `month`, and `quarter`.

> **Privacy and licensing:** Check the dataset's original source and license before publishing it. The supplied CSV files contain names, phone numbers, and email addresses. Do not upload these files to a public repository in their current form. Use an appropriately anonymized version or provide a link to the permitted source dataset instead.

## Project Objectives

- Inspect the structure and quality of the original dataset.
- Identify and address missing, inconsistent, invalid, and incorrectly formatted values.
- Standardize column names and categorical values for analysis.
- Prepare customer and account attributes for exploratory analysis.
- Analyze churn patterns across tenure, contract, payment method, service type, customer characteristics, and spending.
- Present findings in a clear, business-focused report or dashboard.
- Recommend customer-retention actions based on verified results.

## Tools and Technologies

Update this list to include only the tools actually used in your project.

- **Python** — data inspection, cleaning, and exploratory data analysis
- **Pandas / NumPy** — data manipulation and preparation
- **Matplotlib / Seaborn** — charts and visual analysis, if used
- **PostgreSQL** — SQL-based analysis, if used
- **Power BI** — dashboarding and KPI reporting, if used

## Data Preparation Workflow

1. Load and inspect the original CSV.
2. Review row counts, columns, data types, missing values, and inconsistent entries.
3. Clean and standardize relevant fields.
4. Convert numerical and categorical columns to suitable data types.
5. Create derived fields such as age groups and signup date components where valid.
6. Validate the cleaned output and save the processed dataset.
7. Use the cleaned data for analysis and reporting.

Document the exact cleaning decisions in your notebook or report. The cleaned file should still be validated before analysis: it currently includes `Unknown` values and `00-00-0000` signup-date placeholders, so do not assume every field is fully resolved.

## Repository Structure

A suggested structure for this GitHub repository is:

```text
customer-churn-analysis/
├── data/
│   ├── Customer_Churn_Messy_Data.csv
│   └── Customer_Churn_Cleaned_Data.csv                
├── notebooks/
│   └── data_cleaning.ipynb
├── sql/
│   └── churn_analysis.sql
├── dashboard/
│   ├── Customer_Churn_Analysis.pbix
│   └── screenshots/
│       ├── overview.png
│       ├── customer-behaviour.png
│       └── financial-impact.png
├── README.md
└── .gitignore
```

Include only files that you have actually created. If you publish the datasets, use a privacy-safe, license-compliant version. Otherwise, document how to obtain the dataset from its original source.

## Analysis Areas

Possible analysis areas, depending on the work completed, include:

- Overall churn and retention rates
- Churn by tenure and contract type
- Churn by payment method and internet-service type
- Churn by age group and other customer characteristics
- Monthly charges and total charges by churn status
- Support-call frequency and satisfaction-score patterns

## Dashboard


![Dashboard Overview](dashboard/screenshots/overview.png)

![Customer Behaviour](dashboard/screenshots/customer-behaviour.png)

![Financial Impact](dashboard/screenshots/financial-impact.png)



## Key Findings

- **Overall churn:** 2,772 of 5,000 customers (**55.44%**) churned; 2,228 (44.56%) did not.
- **Spending:** churned customers account for about **63%** of total charges (95.64M vs 55.20M). Their average total spending is about **39% higher** (34,500.69 vs 24,776.61).
- **Timing:** among churned customers, **Quarter 1** carries the highest total spending (about 39.16M), followed by Quarter 3 (about 30.85M). Quarter 4 is the lowest (about 8.40M).
- **Tenure:** average tenure is nearly identical for churned (102.28 months) and non-churned (103.95 months) customers, so tenure alone does not explain churn.
- **Year:** more customers churned than stayed in every signup year from 2015 to 2024, with no clear trend (roughly 240-280 churned customers per year).
- **Internet service:** Fiber Optic is the largest group, and churn is high across all service types (roughly 53-56%), so service type alone is not a strong separator.


## Business Recommendations

- Treat a churn rate above 50% as a priority and investigate causes with additional data (exit reasons, satisfaction, support history).
- Focus retention offers on higher-spending customers, who make up most of the churned revenue.
- Plan retention campaigns ahead of Quarter 1 and Quarter 3.
- Look at other drivers next, such as contract type, payment method, support calls and satisfaction score.


## Assumptions and Limitations

- Missing `Churn` values were filled as **Yes** when `SatisfactionScore` was below 5 and **No** otherwise. This is an assumption and affects the churn rate.
- Missing ages were forward filled; rows with unreadable signup dates were kept and labelled **Unknown** for year, month and quarter.
- This is descriptive analysis only. No predictive model was built, and the findings show association, not cause.

## Author

**Ashok Kumar Jena**

Data Analyst Portfolio Project
