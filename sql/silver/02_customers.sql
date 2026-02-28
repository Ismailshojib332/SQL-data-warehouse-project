CREATE SCHEMA IF NOT EXISTS silver;

CREATE OR REPLACE TABLE silver.customers AS
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM bronze.customers
WHERE customer_id IS NOT NULL;