INSERT INTO silver_srbp_sales_ds.audit_table
(audit_id, source_table, target_table, records_inserted, records_failed, load_status, last_ingestion_timestamp, created_at)
SELECT
    GENERATE_UUID() AS audit_id,
    'raw_srbp_sales_ds.FUND_CASH' AS source_table,
    'silver_srbp_sales_ds.FUND_CASH' AS target_table,
    COUNT(*) AS records_inserted,
    0 AS records_failed,
    'SUCCESS' AS load_status,
    CURRENT_TIMESTAMP() AS last_ingestion_timestamp,
    CURRENT_TIMESTAMP() AS created_at
FROM `silver_srbp_sales_ds.fund_cash`;