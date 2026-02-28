CREATE SCHEMA IF NOT EXISTS gold;

CREATE OR REPLACE TABLE gold.fact_order_items AS
SELECT
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    o.order_purchase_ts,
    o.delivered_customer_ts,

    oi.product_id,
    oi.seller_id,

    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) AS total_amount

FROM silver.order_items oi
JOIN silver.orders o
ON oi.order_id = o.order_id;