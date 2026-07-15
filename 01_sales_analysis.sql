-- ==============================================================================
-- CAPSTONE PROJECT: SALES & REVENUE ANALYSIS
-- File Name: 01_sales_analysis.sql
-- Description: Analyzes revenue generators, average order value, and timeline trends.
-- ==============================================================================

-- Q1: What are the top 10 product categories generating the highest revenue?
SELECT 
    t.product_category_name_english AS product_category,
    ROUND(SUM(oi.price)::numeric, 2) AS total_revenue,
    COUNT(oi.order_id) AS items_sold
FROM olist_order_items oi
JOIN olist_products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- Q2: What is the Average Order Value (AOV) of an Olist customer?
SELECT 
    ROUND(AVG(total_order_value)::numeric, 2) AS average_order_value_usd
FROM (
    SELECT order_id, SUM(payment_value) AS total_order_value
    FROM olist_order_payments
    GROUP BY order_id
) subquery;

-- Q3: What do monthly sales volumes look like across the entire dataset timeline?
SELECT 
    DATE_TRUNC('month', order_purchase_timestamp) AS order_month, 
    COUNT(order_id) AS total_orders
FROM olist_orders
GROUP BY order_month
ORDER BY order_month;