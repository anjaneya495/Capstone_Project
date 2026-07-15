-- ==============================================================================
-- CAPSTONE PROJECT: LOGISTICS & SHIPPING PERFORMANCE
-- File Name: 02_logistics_analysis.sql
-- Description: Tracks shipping times and freight cost variations across states.
-- ==============================================================================

-- Q1: What is the average shipping delivery time vs. the predicted estimate?

SELECT 
    ROUND(AVG(EXTRACT(DAY FROM (order_delivered_customer_date - order_purchase_timestamp)))::numeric, 1) AS average_actual_days,
    ROUND(AVG(EXTRACT(DAY FROM (order_estimated_delivery_date - order_purchase_timestamp)))::numeric, 1) AS average_estimated_days
FROM olist_orders
WHERE order_status = 'delivered' 
AND order_delivered_customer_date IS NOT NULL;

-- Q2: Which 5 states have the highest average freight (shipping) costs?
SELECT 
    c.customer_state,
    ROUND(AVG(oi.freight_value)::numeric, 2) AS average_freight_cost
FROM olist_order_items oi
JOIN olist_orders o ON oi.order_id = o.order_id
JOIN olist_customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY average_freight_cost DESC
LIMIT 5;