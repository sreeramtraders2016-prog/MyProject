# SRBP Strategic Retail Brokerage Platform – Data Upload

## 📌 Overview

This project contains raw layer datasets including:

* CSV data files
* Schema definitions
* SQL scripts

The data is loaded into Google BigQuery for further processing.

---

## 📂 Project Structure

```
project/
 ├── data/        # CSV files
 ├── schema/      # JSON/AVRO schema files
 ├── sql/         # SQL queries
 ├── scripts/     # BigQuery load commands
 └── README.md
```

---

## ⚙️ Prerequisites

* Google Cloud SDK installed
* Access to BigQuery
* Project ID configured

---

## 🚀 Steps to Upload Data to BigQuery

### 1. Set Project

```
gcloud config set project <your-project-id>
```

### 2. Create Dataset (if not exists)

```
bq mk <dataset_name>
```

### 3. Load CSV Data using Schema

```
bq load \
--source_format=CSV \
--skip_leading_rows=1 \
<dataset_name>.<table_name> \
data/<file_name>.csv \
schema/<schema_file>.json
```

---

## 🧠 Example

```
bq load \
--source_format=CSV \
--skip_leading_rows=1 \
srbp_dataset.customer_data \
data/customer.csv \
schema/customer_schema.json
```

---

## 📊 Notes

* Ensure schema matches CSV structure
* CSV should be UTF-8 encoded
* Header row is skipped using `--skip_leading_rows=1`

---

## 🔐 Security

* No sensitive credentials stored in repository
* Authentication handled via gcloud CLI

---

## ✅ Status

✔ Raw layer data uploaded successfully
✔ Schema files maintained
✔ Ready for transformation layer
