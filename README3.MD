# 📊 SRBP Sales Data Pipeline (BigQuery)

## 📌 Overview

This project implements a **data transformation pipeline** using **Google BigQuery** to process data from the **Raw (Bronze) layer** into the **Silver layer**.

The pipeline follows the **Medallion Architecture**:

* **Raw Layer (Bronze):** Ingested data (CSV / external sources)
* **Silver Layer:** Cleaned, standardized, structured data
* **Gold Layer (Future Scope):** Business-ready analytics

---

## 🎯 Objective

* Clean and standardize raw data
* Normalize schema (convert fields to STRING where required)
* Handle null values and inconsistencies
* Prepare structured datasets for analytics

---

## 🏗️ Architecture

```
Raw Layer (BigQuery Tables / CSV)
        ↓
SQL Transformations (.sql files)
        ↓
Silver Layer (Cleaned Tables)
```

---

## 📂 Project Structure

```
project/
├── silver_srbp_sales_ds/
│   ├── fund_cash.sql
│   ├── GHSS_ACCT.sql
│   ├── INVESTMENT_DATA.sql
│   ├── INVST_PLAN.sql
│   └── UNINVESTMENT.sql
│
├── scripts/
│   └── run_all.sh
│
└── README.md
```

---

## ⚙️ Prerequisites

* Google Cloud Project
* BigQuery enabled
* Cloud Shell access
* Raw dataset available (e.g., `raw_layer`)
* Target dataset created:

  ```
  silver_srbp_sales_ds
  ```

---

## ☁️ Upload Files to Cloud Shell

1. Open Cloud Shell
2. Upload project folder OR clone from GitHub:

   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

---

## ▶️ Execute SQL Files

Run individual scripts:

```bash
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/fund_cash.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/GHSS_ACCT.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVESTMENT_DATA.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/INVST_PLAN.sql
bq query --use_legacy_sql=false --format=pretty < silver_srbp_sales_ds/UNINVESTMENT.sql
```

---

## 🔁 Automated Execution (Optional)

Create a script:

```bash
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
```

Run:

```bash
chmod +x scripts/run_all.sh
./scripts/run_all.sh
```

---

## 📊 Transformation Details

| File Name           | Description                           |
| ------------------- | ------------------------------------- |
| fund_cash.sql       | Processes fund cash account data      |
| GHSS_ACCT.sql       | Handles account-level transformations |
| INVESTMENT_DATA.sql | Cleans investment transaction data    |
| INVST_PLAN.sql      | Processes investment plan details     |
| UNINVESTMENT.sql    | Handles withdrawal/uninvestment data  |

---

## 🔄 Data Quality Rules

* Standardized data types (STRING normalization)
* Null handling applied
* Deduplication (where required)
* Timestamp column: `LAST_INGESTION_TIMESTAMP`

---

## ✅ Verification

Check created tables:

```bash
bq ls silver_srbp_sales_ds
```

---

## ⚠️ Common Issues

**1. File not found**

```bash
ls silver_srbp_sales_ds/
```

**2. Dataset not found**

```bash
bq mk silver_srbp_sales_ds
```

**3. Wrong SQL mode**
Ensure:

```bash
--use_legacy_sql=false
```

---

## 🚀 Future Enhancements

* Partitioning & clustering in BigQuery
* Gold layer (aggregations, KPIs)
* CI/CD using Cloud Build
* Workflow orchestration using Airflow
* Data validation & monitoring

---

## 👨‍💻 Author

**Data Engineer:** Palika Sreenivasa Rao

---

## ⭐ Notes

* All queries use **Standard SQL (BigQuery)**
* Scripts are idempotent using:

  ```sql
  CREATE OR REPLACE TABLE
  ```
