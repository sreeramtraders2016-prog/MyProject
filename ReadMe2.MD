BigQuery Data Pipeline Documentation
Raw → Silver Layer (SRBP Sales Domain)
 Overview

This project implements a data transformation pipeline in Google BigQuery following the Medallion Architecture:

Raw Layer (Bronze) → Ingested data (CSV, external sources)
Silver Layer → Cleaned, standardized, structured data
Gold Layer (optional) → Business-ready aggregates

This documentation covers Raw → Silver transformations.

2.  Objective
Clean and standardize raw ingested data
Apply schema consistency (all fields → STRING where required)
Handle nulls and basic transformations
Prepare data for analytics and downstream consumption
3.  Architecture Flow
Raw Layer (BQ Tables / CSV)
        ↓
SQL Transformations (.sql files)
        ↓
Silver Layer Tables (Cleaned Data)
4. 📂 Project Structure
project-root/
│
├── silver_srbp_sales_ds/
│   ├── fund_cash.sql
│   ├── GHSS_ACCT.sql
│   ├── INVESTMENT_DATA.sql
│   ├── INVST_PLAN.sql
│   └── UNINVESTMENT.sql
│
└── README.md
5. ⚙️ Execution Commands

Run each SQL file using BigQuery CLI:

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/fund_cash.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/GHSS_ACCT.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVESTMENT_DATA.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVST_PLAN.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/UNINVESTMENT.sql
6. 📊 Transformation Details
6.1 fund_cash.sql

Purpose:
Transforms raw fund cash account data into structured format.

Source Table:
raw_layer.fund_cash

Target Table:
silver_srbp_sales_ds.fund_cash

Key Transformations:

Convert numeric fields to STRING
Standardize column names
Add ingestion timestamp
Filter invalid/null records
6.2 GHSS_ACCT.sql

Purpose:
Processes account-level data for investment accounts.

Source:
raw_layer.ghss_acct

Target:
silver_srbp_sales_ds.ghss_acct

Transformations:

Normalize account identifiers
Handle missing values
Apply country and entity filters
6.3 INVESTMENT_DATA.sql

Purpose:
Stores detailed investment transactions.

Source:
raw_layer.investment_data

Target:
silver_srbp_sales_ds.investment_data

Transformations:

Data type normalization
Remove duplicates
Standardize currency codes
6.4 INVST_PLAN.sql

Purpose:
Captures investment plan details.

Source:
raw_layer.invst_plan

Target:
silver_srbp_sales_ds.invst_plan

Transformations:

Clean plan identifiers
Normalize plan attributes
Apply filters
6.5 UNINVESTMENT.sql

Purpose:
Tracks uninvestment / withdrawal data.

Source:
raw_layer.uninvestment

Target:
silver_srbp_sales_ds.uninvestment

Transformations:

Handle null values
Standardize structure
Ensure referential consistency
7. 🔄 Data Quality Rules
No NULLs in primary keys
Consistent data types (STRING standardization)
Deduplication applied
Timestamp column added: LAST_INGESTION_TIMESTAMP
8. 🚀 Future Enhancements
Add partitioning & clustering in BigQuery
Build Gold layer aggregates (KPIs, reporting)
Automate using:
Airflow DAGs
Cloud Build CI/CD pipelines
Add data validation checks
9. 📌 Notes
All queries use Standard SQL (--use_legacy_sql=false)
Scripts are idempotent using:
CREATE OR REPLACE TABLE

we have to upload these file to through cloud shell

Got it 👍 — you want documentation for uploading and running your SQL files via Cloud Shell. Here’s a clean, step-by-step guide you can put in GitHub README.

📄 Upload & Execute SQL Files using Cloud Shell (BigQuery)
1. 📌 Overview

This guide explains how to:

Upload SQL files to Google Cloud Shell
Execute them in Google BigQuery
Load data from Raw → Silver layer
2. 📂 Prerequisites
Google Cloud Project created
BigQuery datasets:
raw_layer
silver_srbp_sales_ds
SQL files ready locally:
fund_cash.sql
GHSS_ACCT.sql
INVESTMENT_DATA.sql
INVST_PLAN.sql
UNINVESTMENT.sql
3. ☁️ Open Cloud Shell
Go to Google Cloud Console
Click Activate Cloud Shell (top-right terminal icon)
4. 📤 Upload SQL Files to Cloud Shell
Option 1: Upload Folder (Recommended)
In Cloud Shell, click ⋮ (More) → Upload
Upload your folder:
silver_srbp_sales_ds/
Option 2: Use GitHub (Best Practice)
git clone https://github.com/your-repo/project.git
cd project
5. 📁 Verify Files
ls silver_srbp_sales_ds/

Expected:

fund_cash.sql
GHSS_ACCT.sql
INVESTMENT_DATA.sql
INVST_PLAN.sql
UNINVESTMENT.sql
6. ▶️ Run SQL Files in BigQuery

Execute each file:

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/fund_cash.sql

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/GHSS_ACCT.sql

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVESTMENT_DATA.sql

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVST_PLAN.sql

bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/UNINVESTMENT.sql
7. 🔁 Automate Execution (Recommended)

Create a script:

nano run_all.sh

Paste:

#!/bin/bash

FILES=(
"fund_cash.sql"
"GHSS_ACCT.sql"
"INVESTMENT_DATA.sql"
"INVST_PLAN.sql"
"UNINVESTMENT.sql"
)

for file in "${FILES[@]}"
do
  echo "Running $file..."
  bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/$file
done

Run:

chmod +x run_all.sh
./run_all.sh
8. ✅ Verify Tables in BigQuery

Check tables:

bq ls silver_srbp_sales_ds
9. ⚠️ Common Issues & Fixes
❌ File not found
No such file or directory

✔ Fix:

ls silver_srbp_sales_ds/
❌ Dataset not found

✔ Fix:

bq mk silver_srbp_sales_ds
❌ Permission error

✔ Fix:

gcloud config set project YOUR_PROJECT_ID
10. 🏁 Final Flow
Local SQL Files
     ↓ (Upload)
Cloud Shell
     ↓ (bq query)
BigQuery Raw Tables
     ↓ (Transform)
BigQuery Silver Tables

 👨‍💻 Author
Data Engineer: PALIKA SREENIVASA RAO
Project: Strategic Retail Brokerage Platform Sales Data Pipeline
