-- ============================================================
-- 06_customer_satisfaction.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze how delivery performance affects customer satisfaction.
--
-- Business Question:
--   How do delivery delays affect customer satisfaction?
-- ============================================================


-- ============================================================
-- KPI 1: Average Review Score by Delivery Status
-- ============================================================

-- Definition:
-- Average customer review score for on-time deliveries and
-- delayed deliveries.
--
-- Purpose:
-- Compare customer satisfaction between orders delivered on time
-- and orders delivered after the promised delivery date.

SELECT  
  ROUND(AVG(CASE WHEN o.order_delivered_customer_date<=o.order_estimated_delivery_date THEN r.review_score END),1) AS average_on_time_review,
  ROUND(AVG(CASE WHEN o.order_delivered_customer_date>o.order_estimated_delivery_date THEN r.review_score END),1) AS average_delayed_review  

FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_reviews` AS r
  ON o.order_id=r.order_id


-- ============================================================
-- KPI 2: Review Score Distriburion by Delivery Status
-- ============================================================

-- Definition:
-- Percentage distribution of review scores from 1 to 5 stars,
-- split by delivery status.
--
-- Purpose:
-- Understand whether delayed deliveries change the pattern of
-- customer ratings compared with on-time deliveries.

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

-- Definition:
-- Average review score by delay severity group.
--
-- Purpose:
-- Evaluate whether customer satisfaction decreases progressively
-- as delivery delays become more severe.

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
    WHEN order_delivered_customer_date<=order_estimated_delivery_date THEN 'ON_TIME'
    WHEN DATE_DIFF(DATE(order_delivered_customer_date),DATE(order_estimated_delivery_date),DAY) BETWEEN 1 AND 3 THEN '1-3_DAYS'
    WHEN DATE_DIFF(DATE(order_delivered_customer_date),DATE(order_estimated_delivery_date),DAY) BETWEEN 4 AND 7 THEN '4-7_DAYS'
    WHEN DATE_DIFF(DATE(order_delivered_customer_date),DATE(order_estimated_delivery_date),DAY) BETWEEN 8 AND 14 THEN '8-14_DAYS'
    ELSE '>14_DAYS'
END AS delay_group
    FROM `olist-operations-analytics.olist_analysis.clean_orders`
)

SELECT
  c.delay_group,
  AVG(r.review_score) AS average_review_score,
  COUNT(c.order_id) AS total_orders,
  SAFE_DIVIDE(COUNT(c.order_id),SUM(COUNT(c.order_id)) OVER())*100 AS percentage_of_total
FROM categorized_deliveries AS c
INNER JOIN `olist-operations-analytics.olist_analysis.clean_order_reviews` AS r
  ON c.order_id=r.order_id
GROUP BY delay_group
ORDER BY
  CASE c.delay_group
    WHEN 'ON_TIME' THEN 1
    WHEN '1-3_DAYS' THEN 2
    WHEN '4-7_DAYS' THEN 3
    WHEN '8-14_DAYS' THEN 4
    WHEN '>14_DAYS' THEN 5
  END;


-- ============================================================
-- KPI 4: Review Response Rate by Delivery Status
-- ============================================================

-- Definition:
-- Percentage of orders with a customer review, split by delivery
-- status.
--
-- Purpose:
-- Analyze whether customers with delayed deliveries are more likely
-- to leave a review.

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
  COUNT(c.order_id) AS total_orders,
  ROUND(SAFE_DIVIDE(COUNT(r.review_id),COUNT(c.order_id))*100,2) AS response_rate
FROM categorized_deliveries AS c
LEFT JOIN `olist-operations-analytics.olist_analysis.clean_order_reviews` AS r
  ON c.order_id=r.order_id
GROUP BY delivery_status
