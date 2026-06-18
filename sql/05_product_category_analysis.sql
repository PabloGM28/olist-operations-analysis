-- ============================================================
-- 05_product_category_analysis.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze delivery performance by product category.
--
-- Business Question:
--   Which product categories experience the worst operational performance?
-- ============================================================


-- ============================================================
-- KPI 1: Number of Orders by Product Category
-- ============================================================

-- Definition:
-- Total number of orders by product category.
--
-- Purpose:
-- Before analyzing delivery performance, we first need to
-- understand the order volume associated with each category.
-- This prevents overinterpreting categories with very small
-- sample sizes.

SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC


-- ============================================================
-- KPI 2 & 3: On-Time & Delayed Delivery Rate by Product Category
-- ============================================================

-- Definition:
-- Percentage of orders delivered on time and delayed orders
-- for each product category.
--
-- Purpose:
-- Measure delivery reliability and identify categories that
-- experience the highest proportion of delays.

SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  COUNT(CASE WHEN o.order_delivered_customer_date<= o.order_estimated_delivery_date THEN 1 END) AS on_time_deliveries,
  COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END) AS delayed_deliveries,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date<= o.order_estimated_delivery_date THEN 1 END), COUNT(o.order_id)) AS on_time_delivery_rate,
  SAFE_DIVIDE(COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END), COUNT(o.order_id)) AS delayed_delivery_rate
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC


-- ============================================================
-- KPI 4: Average Delivery Time by Product Category
-- ============================================================

-- Definition:
-- Average number of days between purchase and customer delivery
-- for each product category.
--
-- Purpose:
-- Identify categories that require longer delivery times and
-- evaluate operational efficiency across product types.

SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  AVG(DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_purchase_timestamp), DAY)) AS average_delivery_time
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC


-- ============================================================
-- KPI 5: Average Delay Time by Product Category
-- ============================================================

-- Definition:
-- Average number of delay days for delayed orders only,
-- grouped by product category.
--
-- Purpose:
-- Evaluate the severity of delays and determine which categories
-- suffer the longest disruptions once a delay occurs.

SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(o.order_id),SUM(COUNT(o.order_id)) OVER()) AS percentage_of_total,
  AVG(CASE WHEN o.order_delivered_customer_date>o.order_estimated_delivery_date THEN DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_estimated_delivery_date), DAY) END) AS average_delay_time
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC
