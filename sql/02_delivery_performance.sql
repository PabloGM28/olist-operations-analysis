-- ============================================================
-- 02_delivery_performance.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Establish the baseline performance of the delivery process
--   before analyzing its impact on customers and the business.
--
-- Business Question:
--   How reliable is Olist's delivery operation?
-- ============================================================


-- ============================================================
-- KPI 1: Total Valid Delivered Orders
-- ============================================================

-- Definition:
-- Orders with non-null actual and estimated delivery dates.
--
-- Purpose:
-- Establish the total number of valid orders used as the basis
-- for all delivery performance analyses.
--
-- Result obtained during the data understanding phase:
-- Valid delivered orders = 96,476


-- ============================================================
-- KPI 2 & KPI 3: On-Time and Delayed Delivery Rate
-- ============================================================

-- Definitions:
-- On-Time Order:
-- order_delivered_customer_date <= order_estimated_delivery_date
--
-- Delayed Order:
-- order_delivered_customer_date > order_estimated_delivery_date
--
-- Purpose:
-- Measure the overall reliability of the delivery process.

SELECT
  COUNT(*) AS total_deliveries,
  COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 END) AS on_time_deliveries,
  COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS delayed_deliveries,
  SAFE_DIVIDE (COUNT(CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 1 END),COUNT(*)) AS on_time_delivery_rate,
  SAFE_DIVIDE (COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END),COUNT(*)) AS delayed_deliveries_rate  
FROM `olist-operations-analytics.olist_analysis.clean_orders`;


-- ============================================================
-- KPI 4: Average Delivery Time
-- ============================================================

-- Definition:
-- Average number of days between purchase date and
-- actual customer delivery date.
--
-- Purpose:
-- Measure how long customers typically wait to receive an order.

SELECT
    AVG(
        DATE_DIFF(
            DATE(order_delivered_customer_date),
            DATE(order_purchase_timestamp),
            DAY
        )
    ) AS average_delivery_time_days

FROM `olist-operations-analytics.olist_analysis.clean_orders`;


-- ============================================================
-- KPI 5: Average Delay Time
-- ============================================================

-- Definition:
-- Average number of days late among delayed orders only.
--
-- Purpose:
-- Measure the severity of delays when the delivery promise is missed.

WITH only_delays AS (
    SELECT *
    FROM `olist-operations-analytics.olist_analysis.clean_orders`

    WHERE DATE(order_delivered_customer_date)
          > DATE(order_estimated_delivery_date)
)

SELECT
    AVG(
        DATE_DIFF(
            DATE(order_delivered_customer_date),
            DATE(order_estimated_delivery_date),
            DAY
        )
    ) AS average_delay_time_days

FROM only_delays;
