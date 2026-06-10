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
-- KPI 2: Delayed Delivery Rate by Seller
-- ============================================================
