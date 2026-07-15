-- ==========================================
-- 1. CLEAN SLATE: DROP OLD broken/empty TABLES
-- ==========================================
DROP TABLE IF EXISTS olist_geolocation CASCADE;
DROP TABLE IF EXISTS olist_customers CASCADE;
DROP TABLE IF EXISTS olist_sellers CASCADE;
DROP TABLE IF EXISTS olist_products CASCADE;
DROP TABLE IF EXISTS product_category_name_translation CASCADE;
DROP TABLE IF EXISTS olist_orders CASCADE;
DROP TABLE IF EXISTS olist_order_items CASCADE;
DROP TABLE IF EXISTS olist_order_payments CASCADE;
DROP TABLE IF EXISTS olist_order_reviews CASCADE;

-- ==========================================
-- 2. CREATE TABLES AND IMPORT THE CSV DATA
-- ==========================================

-- Geolocation
CREATE TABLE olist_geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DOUBLE PRECISION,   -- Expanded to prevent numeric overflow
    geolocation_lng DOUBLE PRECISION,   -- Expanded to prevent numeric overflow
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);
COPY olist_geolocation FROM 'E:/brazillian_dataset/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

-- Customers
CREATE TABLE olist_customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);
COPY olist_customers FROM 'E:/brazillian_dataset/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

-- Sellers
CREATE TABLE olist_sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);
COPY olist_sellers FROM 'E:/brazillian_dataset/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

-- Products
CREATE TABLE olist_products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
COPY olist_products FROM 'E:/brazillian_dataset/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

-- Product Translation
CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);
COPY product_category_name_translation FROM 'E:/brazillian_dataset/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;

-- Orders
CREATE TABLE olist_orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);
COPY olist_orders FROM 'E:/brazillian_dataset/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

-- Order Items
CREATE TABLE olist_order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10, 2),
    freight_value NUMERIC(10, 2)
);
COPY olist_order_items FROM 'E:/brazillian_dataset/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

-- Order Payments
CREATE TABLE olist_order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value NUMERIC(10, 2)
);
COPY olist_order_payments FROM 'E:/brazillian_dataset/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

-- Order Reviews
CREATE TABLE olist_order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);
COPY olist_order_reviews FROM 'E:/brazillian_dataset/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

-- ==========================================
-- 3. VERIFICATION COUNTS (See results right away!)
-- ==========================================
SELECT 'Customers' AS Table_Name, COUNT(*) FROM olist_customers
UNION ALL
SELECT 'Orders' AS Table_Name, COUNT(*) FROM olist_orders
UNION ALL
SELECT 'Products' AS Table_Name, COUNT(*) FROM olist_products;