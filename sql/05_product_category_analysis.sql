-- ============================================================
-- KPI 1: Number of Orders by Seller
-- ============================================================
SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC
-- ============================================================
-- KPI 2 & 3: On time & Delayed Delivery Rate by Product Category
-- ============================================================
SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
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
SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
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
SELECT  
  p.product_category_name_english AS product_category_name,
  COUNT(o.order_id) AS total_orders,
  AVG(CASE WHEN o.order_delivered_customer_date>o.order_estimated_delivery_date THEN DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_estimated_delivery_date), DAY) END) AS average_delay_time
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN
  `olist-operations-analytics.olist_analysis.clean_product_categories` AS p
ON o.order_id=p.order_id

GROUP BY p.product_category_name_english
ORDER BY total_orders DESC

