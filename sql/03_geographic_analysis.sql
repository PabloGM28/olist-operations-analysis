-- ============================================================
-- 03_geographic_analysis.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze delivery performance by customer location.
--
-- Business Question:
--   Which regions experience the worst delivery performance?
-- ============================================================


-- ============================================================
-- KPI 1: Number of Orders by State
-- ============================================================

-- Definition:
-- Total number of valid delivered orders by customer state.
--
-- Purpose:
-- Before analyzing delay rates by state, we first need to
-- understand order volume. This prevents overinterpreting states
-- with very small sample sizes.

SELECT  
    c.customer_state AS state,
    COUNT(o.order_id) AS total_orders

FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o

INNER JOIN `olist-operations-analytics.olist_analysis.clean_customers` AS c
    ON o.customer_id = c.customer_id

GROUP BY c.customer_state

ORDER BY total_orders DESC;
