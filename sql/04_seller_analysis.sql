-- ============================================================
-- KPI 1: Number of Orders by Seller
-- ============================================================
SELECT  
  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders_per_seller
  
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders_per_seller DESC
-- ============================================================
-- KPI 2 & KPI 3: On-Time and Delayed Delivery Rate by Seller
-- ============================================================
SELECT  
  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders_per_seller,
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
-- KPI 4: Average Delivey Time by Seller
-- ============================================================
  SELECT  

  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders,
  AVG(DATE_DIFF(DATE(o.order_delivered_customer_date),DATE(o.order_purchase_timestamp),DAY)) AS average_delivery_time
  
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY total_orders DESC
-- ============================================================
-- KPI 6: Delayed Orders by Seller
-- ============================================================
SELECT  
  s.seller_id AS seller,
  COUNT(o.order_id) AS total_orders_per_seller,
  COUNT(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 END) AS on_time_deliveries,
  COUNT(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 END) AS delayed_deliveries
FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_items` AS s
ON o.order_id=s.order_id

GROUP BY s.seller_id
ORDER BY delayed_deliveries DESC
