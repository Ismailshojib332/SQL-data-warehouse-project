CREATE SCHEMA IF NOT EXISTS silver;

CREATE OR REPLACE TABLE silver.orders AS
SELECT
    order_id,
    customer_id,
    order_status,

    CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_ts,
    CAST(order_approved_at AS TIMESTAMP) AS order_approved_ts,
    CAST(order_delivered_customer_date AS TIMESTAMP) AS delivered_customer_ts,
    CAST(order_estimated_delivery_date AS TIMESTAMP) AS estimated_delivery_ts

FROM bronze.orders
WHERE order_id IS NOT NULL;