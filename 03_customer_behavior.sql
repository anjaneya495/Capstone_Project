-- ==============================================================================
-- CAPSTONE PROJECT: CUSTOMER BEHAVIOR & PAYMENT ANALYSIS
-- File Name: 03_customer_behavior.sql
-- Description: Identifies repeat buyers and maps out payment preferences.
-- ==============================================================================

-- Q1: What percentage of buyers are repeat customers vs. one-time shoppers?
WITH customer_purchase_counts AS (
    SELECT customer_unique_id, COUNT(order_id) AS order_count
    FROM olist_customers c
    JOIN olist_orders o ON c.customer_id = o.customer_id
    GROUP BY customer_unique_id
)
SELECT 
    order_count AS orders_placed,
    COUNT(customer_unique_id) AS total_customers,
    ROUND((COUNT(customer_unique_id) * 100.0 / SUM(COUNT(customer_unique_id)) OVER())::numeric, 2) AS percentage
FROM customer_purchase_counts
GROUP BY order_count
ORDER BY order_count ASC;

-- Q2: Which payment methods are most popular based on total transactions and revenue?
SELECT 
    payment_type, 
    COUNT(*) AS total_transactions, 
    ROUND(SUM(payment_value)::numeric, 2) AS total_revenue
FROM olist_order_payments
GROUP BY payment_type
ORDER BY total_transactions DESC;