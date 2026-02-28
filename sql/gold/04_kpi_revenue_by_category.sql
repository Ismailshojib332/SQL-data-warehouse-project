CREATE OR REPLACE TABLE gold.kpi_revenue_by_category AS
SELECT
    dp.product_category_name_english AS category,
    SUM(f.total_amount) AS total_revenue,
    COUNT(*) AS total_items_sold
FROM gold.fact_order_items f
JOIN gold.dim_products dp
ON f.product_id = dp.product_id
GROUP BY dp.product_category_name_english
ORDER BY total_revenue DESC;