-- ============================================================
-- 07_business_impact_of_delays.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze whether delivery delays affect customer retention
--   and future purchasing behavior.
--
-- Business Question:
--   Do delivery delays negatively affect customer retention?
-- ============================================================


-- ============================================================
-- KPI 1: Customer Distribution by Delay Experience
-- ============================================================

-- Definition:
-- Customers are classified into two groups:
--   - NEVER_DELAYED: customers who never experienced a delayed order.
--   - DELAYED_AT_LEAST_ONCE: customers who experienced at least
--     one delayed order.
--
-- Purpose:
-- Measure the size of the customer base affected by delivery delays.

WITH orders_categorized_deliveries AS (
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
),

customers_delay_experience AS (
  SELECT
    c.customer_unique_id,

    CASE
      WHEN COUNT(CASE WHEN o.delivery_status = "DELAYED" THEN 1 END) > 0
      THEN "DELAYED_AT_LEAST_ONCE"
      ELSE "NEVER_DELAYED"
    END AS customer_delay_group

  FROM orders_categorized_deliveries AS o
  INNER JOIN 
    `olist-operations-analytics.olist_analysis.clean_customers` AS c 
    ON o.customer_id=c.customer_id

  GROUP BY c.customer_unique_id
)

SELECT
  customer_delay_group,
  COUNT(customer_unique_id) AS total_customers,
  ROUND(
    SAFE_DIVIDE(
      COUNT(customer_unique_id),
      SUM(COUNT(customer_unique_id)) OVER()
    ) * 100,
    2
  ) AS percentage_of_total_customers

FROM customers_delay_experience

GROUP BY customer_delay_group;
