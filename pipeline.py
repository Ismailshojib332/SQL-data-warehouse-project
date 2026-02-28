import duckdb

con = duckdb.connect("warehouse.duckdb")

with open("sql/bronze/load_bronze.sql") as f:
    con.execute(f.read())
print("bronze layer loaded successfully!")
    
# Silver
with open("sql/silver/01_orders.sql") as f:
    con.execute(f.read())
    print("Silver layer loaded successfully!")
    # Silver - customers
with open("sql/silver/02_customers.sql") as f:
    con.execute(f.read())
print("Silver customers loaded successfully!")

# Silver - order_items
with open("sql/silver/03_order_items.sql") as f:
    con.execute(f.read())
print("Silver order_items loaded successfully!")

# Gold - fact table
with open("sql/gold/01_fact_order_items.sql") as f:
    con.execute(f.read())
print("Gold fact_order_items loaded successfully!")

# Gold - dim_customers
with open("sql/gold/02_dim_customers.sql") as f:
    con.execute(f.read())
print("Gold dim_customers loaded successfully!")

# Gold - dim_customers
with open("sql/gold/02_dim_customers.sql") as f:
    con.execute(f.read())


# Gold - dim_products
with open("sql/gold/03_dim_products.sql") as f:
    con.execute(f.read())
print("Gold dim_products loaded successfully!")

# Gold - KPI revenue by category
with open("sql/gold/04_kpi_revenue_by_category.sql") as f:
    con.execute(f.read())
print("Gold KPI revenue_by_category loaded successfully!")


# Data quality checks
print("Running data quality checks...")

with open("sql/test/01_data_quality_checks.sql") as f:
    con.sql(f.read()).show()


con.sql("SHOW TABLES FROM bronze").show()

con.sql("SHOW TABLES FROM silver").show()

con.sql("SHOW TABLES FROM gold").show()




con.sql("DESCRIBE silver.orders").show()
con.sql("DESCRIBE silver.customers").show()
con.sql("DESCRIBE silver.order_items").show()
con.sql("DESCRIBE gold.fact_order_items").show()
con.sql("describe gold.dim_customers").show()

con.sql("describe gold.kpi_revenue_by_category").show()


