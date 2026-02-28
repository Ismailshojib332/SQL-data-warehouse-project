-- Check 1: fact table should not be empty
SELECT COUNT(*) AS row_count
FROM gold.fact_order_items;

-- Check 2: no NULL product_id
SELECT COUNT(*) AS null_products
FROM gold.fact_order_items
WHERE product_id IS NULL;

-- Check 3: revenue should never be negative
SELECT COUNT(*) AS negative_revenue
FROM gold.fact_order_items
WHERE total_amount < 0;