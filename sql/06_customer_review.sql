-- ============================================================
-- KPI 1: Average Review Score by Delivery Status
-- ============================================================
SELECT  
  ROUND(AVG(CASE WHEN o.order_delivered_customer_date<=o.order_estimated_delivery_date THEN r.review_score END),1) AS average_on_time_review,
  ROUND(AVG(CASE WHEN o.order_delivered_customer_date>o.order_estimated_delivery_date THEN r.review_score END),1) AS average_delayed_review  

FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_reviews` AS r
  ON o.order_id=r.order_id
-- ============================================================
-- KPI 2: Review Score Distriburion by Delivery Status
-- ============================================================
WITH categorized_deliveries AS (

  SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    CASE
      WHEN order_delivered_customer_date<=order_estimated_delivery_date THEN "ON_TIME"
      ELSE "DELAYED"
    END AS delivery_status
    FROM `olist-operations-analytics.olist_analysis.clean_orders`
)

SELECT
  c.delivery_status,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN r.review_score=1 THEN 1 END),COUNT(*))*100,2) AS one_star_reviews_percentage,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN r.review_score=2 THEN 1 END),COUNT(*))*100,2) AS two_star_reviews_percentage,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN r.review_score=3 THEN 1 END),COUNT(*))*100,2) AS three_star_reviews_percentage,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN r.review_score=4 THEN 1 END),COUNT(*))*100,2) AS four_star_reviews_percentage,
  ROUND(SAFE_DIVIDE(COUNT(CASE WHEN r.review_score=5 THEN 1 END),COUNT(*))*100,2) AS five_star_reviews_percentage
FROM `categorized_deliveries` AS c
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_reviews` AS r
  ON c.order_id=r.order_id
GROUP BY delivery_status
-- ============================================================
-- KPI 3: Average Review Score by Delay Severity Group
-- ============================================================
