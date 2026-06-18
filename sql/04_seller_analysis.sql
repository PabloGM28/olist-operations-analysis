-- ============================================================
-- 04_seller_analysis.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze delivery performance by seller.
--
-- Business Question:
--   Which sellers contribute the most to delivery delays?
-- ============================================================


-- ============================================================
-- KPI 1: Number of Orders by Seller
-- ============================================================

-- Definition:
-- Total number of orders handled by each seller.
--
-- Purpose:
-- Before analyzing delivery performance, we first need to
-- understand the order volume associated with each seller.
-- This prevents overinterpreting sellers with very small
-- sample sizes.

SELECT  
  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders_per_seller,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total
  
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders_per_seller DESC


-- ============================================================
-- KPI 2 & KPI 3: On-Time and Delayed Delivery Rate by Seller
-- ============================================================

-- Definition:
-- Percentage of on-time deliveries and delayed deliveries
-- for each seller.
--
-- Purpose:
-- Measure seller reliability and identify sellers with the
-- highest proportion of delayed deliveries.

SELECT  
  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders_per_seller,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END) AS on_time_deliveries,
  COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END) AS delayed_deliveries,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END),COUNT(o.order_id)) AS on_time_delivery_rate,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END),COUNT(o.order_id)) AS delayed_delivery_rate
  
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders_per_seller DESC

-- ============================================================
-- KPI 4: Average Delivery Time by Seller
-- ============================================================

-- Definition:
-- Average number of days between purchase and delivery
-- for each seller.
--
-- Purpose:
-- Identify sellers with longer delivery cycles and evaluate
-- their operational efficiency.

SELECT  

  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  AVG(DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_purchase_timestamp),DAY)) AS average_delivery_time_days
  
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders DESC


-- ============================================================
-- KPI 5: Average Delay Time by Seller
-- ============================================================

-- Definition:
-- Average number of delay days for delayed orders only,
-- grouped by seller.
--
-- Purpose:
-- Evaluate the severity of delays and determine which sellers
-- experience the longest disruptions once a delay occurs.

SELECT  

  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  AVG(CASE WHEN DATE(o.order_delivered_customer_date) > DATE (o.order_estimated_delivery_date) THEN DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_estimated_delivery_date),DAY) END) AS average_delay_time_days

FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders DESC
