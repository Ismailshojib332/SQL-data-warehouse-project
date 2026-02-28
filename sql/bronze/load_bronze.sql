CREATE SCHEMA IF NOT EXISTS bronze;

CREATE OR REPLACE TABLE bronze.orders AS
SELECT * FROM read_csv_auto('data/olist_orders_dataset.csv');

CREATE OR REPLACE TABLE bronze.customers AS
SELECT * FROM read_csv_auto('data/olist_customers_dataset.csv');

CREATE OR REPLACE TABLE bronze.order_items AS
SELECT * FROM read_csv_auto('data/olist_order_items_dataset.csv');

CREATE OR REPLACE TABLE bronze.products AS
SELECT * FROM read_csv_auto('data/olist_products_dataset.csv');

CREATE OR REPLACE TABLE bronze.sellers AS
SELECT * FROM read_csv_auto('data/olist_sellers_dataset.csv');

CREATE OR REPLACE TABLE bronze.payments AS
SELECT * FROM read_csv_auto('data/olist_order_payments_dataset.csv');

CREATE OR REPLACE TABLE bronze.reviews AS
SELECT * FROM read_csv_auto('data/olist_order_reviews_dataset.csv');

CREATE OR REPLACE TABLE bronze.geolocation AS
SELECT * FROM read_csv_auto('data/olist_geolocation_dataset.csv');

CREATE OR REPLACE TABLE bronze.category_translation AS
SELECT * FROM read_csv_auto('data/product_category_name_translation.csv');
