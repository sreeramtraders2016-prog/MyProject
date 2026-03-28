CREATE OR REPLACE TABLE raw_srbp_sales_ds.audit_table (
    audit_id STRING,
    source_file STRING,           -- e.g., CSV file name or source system
    target_table STRING,          -- raw table name
    records_ingested INT64,       -- number of rows ingested
    records_failed INT64,         -- optional: rows rejected due to errors
    load_status STRING,           -- SUCCESS / FAILED
    ingestion_timestamp TIMESTAMP,
    created_at TIMESTAMP
);