-- ==============================================================================
-- CAPSTONE PROJECT: CUSTOMER SATISFACTION (REVIEWS) ANALYSIS
-- File Name: 04_satisfaction_analysis.sql
-- Description: Measures rating distributions and impacts of delay on satisfaction.
-- ==============================================================================

-- Q1: What is the distribution of customer review scores?
SELECT 
    review_score, 
    COUNT(*) AS review_count,
    ROUND((COUNT(*) * 100.0 / SUM(COUNT(*)) OVER())::numeric, 2) AS percentage_of_total
FROM olist_order_reviews
GROUP BY review_score
ORDER BY review_score DESC;

-- Q2: Does delivery delay directly impact review ratings?
SELECT 
    review_score,
    ROUND(AVG(EXTRACT(DAY FROM (order_delivered_customer_date - order_estimated_delivery_date)))::numeric, 1) AS average_days_difference
FROM olist_order_reviews r
JOIN olist_orders o ON r.order_id = o.order_id
WHERE o.order_status = 'delivered' 
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY review_score
ORDER BY review_score DESC;
-- Note: A negative number means early delivery, positive means a delay.