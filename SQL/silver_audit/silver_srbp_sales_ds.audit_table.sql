CREATE OR REPLACE TABLE silver_srbp_sales_ds.audit_table (
    audit_id STRING,
    source_table STRING,
    target_table STRING,
    records_inserted INT64,
    records_failed INT64,
    load_status STRING,
    last_ingestion_timestamp TIMESTAMP,
    created_at TIMESTAMP
);