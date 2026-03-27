Create a file: scripts/bq_load.sh

#!/bin/bash

PROJECT_ID="your-project-id"
DATASET="srbp_dataset"

gcloud config set project $PROJECT_ID

# Load Customer Data
bq load --source_format=CSV --skip_leading_rows=1 \
$DATASET.customer_data \
data/customer.csv \
schema/customer_schema.json

# Load Account Data
bq load --source_format=CSV --skip_leading_rows=1 \
$DATASET.account_data \
data/account.csv \
schema/account_schema.json