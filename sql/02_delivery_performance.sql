-- ============================================================
-- 02_delivery_performance.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze the overall efficiency of the delivery process.
--
-- Business Question:
--   How efficient is the delivery process overall?
-- ============================================================
-- KPI 1: Total Valid Delivered Orders
-- ============================================================

-- Definition:
-- Orders with non-null actual and estimated delivery dates.

-- Result obtained during the data understanding phase:
-- Valid delivered orders = 96,476
-- ============================================================
-- KPI 2 & KPI 3: On-Time Delivery Rate
-- ============================================================

-- Definitions:
-- On-Time Order:
-- order_delivered_customer_date <= order_estimated_delivery_date
--
-- Delayed Order:
-- order_delivered_customer_date > order_estimated_delivery_date

SELECT
  COUNT(*) AS total_deliveries,
  COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 END) AS on_time_deliveries,
  COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS delayed_deliveries,
  SAFE_DIVIDE (COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 END),COUNT(*)) AS on_time_delivery_rate,
  SAFE_DIVIDE (COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END),COUNT(*)) AS delayed_deliveries_rate  
FROM `olist-operations-analytics.olist_analysis.clean_orders`
-- ============================================================
-- KPI 4: Average Delivery Time
-- ============================================================

-- Definition:
-- Average number of days between purchase date and
-- actual customer delivery date.

SELECT
    AVG(
        DATE_DIFF(
            DATE(order_delivered_customer_date),
            DATE(order_purchase_timestamp),
            DAY
        )
    ) AS average_delivery_time_days

FROM `olist-operations-analytics.olist_analysis.clean_orders`;
