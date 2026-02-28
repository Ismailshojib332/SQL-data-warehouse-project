CREATE SCHEMA IF NOT EXISTS silver;

CREATE OR REPLACE TABLE silver.order_items AS
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    price,
    freight_value
FROM bronze.order_items
WHERE order_id IS NOT NULL;