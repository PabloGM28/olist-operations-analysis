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
-- ============================================================
-- KPI 2 & KPI 3: On-Time and Delayed Delivery Rate by State
-- ============================================================

-- Definitions:
-- On-Time Order:
-- order_delivered_customer_date <= order_estimated_delivery_date
--
-- Delayed Order:
-- order_delivered_customer_date > order_estimated_delivery_date
--
-- Purpose:
-- Measure delivery reliability by customer state while keeping
-- order volume visible to avoid overinterpreting low-volume states.

SELECT  
  c.customer_state AS state,
  COUNT(*) AS total_orders_by_state,
  COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END) AS on_time_orders,
  COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END) AS delayed_orders,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END),COUNT(*)) AS on_time_delivery_rate,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END),COUNT(*)) AS delayed_delivery_rate
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_customers` AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders_by_state DESC;
