CREATE SCHEMA IF NOT EXISTS gold;

CREATE OR REPLACE TABLE gold.dim_products AS
SELECT DISTINCT
    p.product_id,
    p.product_category_name,
    t.product_category_name_english
FROM bronze.products p
LEFT JOIN bronze.category_translation t
ON p.product_category_name = t.product_category_name;

