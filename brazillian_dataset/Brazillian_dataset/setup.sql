CREATE TABLE olist_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

COPY olist_customers
FROM './olist_customers_dataset.csv'
WITH (FORMAT CSV, HEADER true, DELIMITER ',');