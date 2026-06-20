-- ============================================================
-- 04_business_impact_of_delays.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Analyze whether delivery delays are associated with
--   customer retention and future purchasing behavior.
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
-- Determine how many customers have experienced delivery delays.

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


-- ============================================================
-- KPI 2: Repurchase Rate After Experiencing a Delay
-- ============================================================

-- Definition:
-- Customers who experienced at least one delayed order are
-- classified into two groups:
--   - RETURNED_AFTER_DELAY: customers whose last order was
--     placed after their first delayed order.
--   - DID_NOT_RETURN_AFTER_DELAY: customers who never placed
--     another order after experiencing their first delay.
--
-- Purpose:
-- Measure whether customers continue purchasing after a poor
-- delivery experience.

WITH orders_categorized_deliveries AS (
  SELECT
    order_id,
    o.customer_id,
    c.customer_unique_id,
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
    FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
    INNER JOIN `olist-operations-analytics.olist_analysis.clean_customers` AS c
      ON o.customer_id=c.customer_id
),

customer_dates AS (
  SELECT
    customer_unique_id,
    MIN(
      CASE
        WHEN delivery_status = "DELAYED"
        THEN order_purchase_timestamp
      END
    ) AS first_delayed_order_date,

    MAX(order_purchase_timestamp) AS last_order_date

  FROM orders_categorized_deliveries

  GROUP BY customer_unique_id
),

repurchase_after_delay AS (
  SELECT
    customer_unique_id,

    CASE
      WHEN last_order_date > first_delayed_order_date
      THEN "RETURNED_AFTER_DELAY"

      ELSE "DID_NOT_RETURN_AFTER_DELAY"

    END AS repurchase_status

  FROM customer_dates

  WHERE first_delayed_order_date IS NOT NULL
)

SELECT
  repurchase_status,
  COUNT(customer_unique_id) AS total_customers,

  ROUND(
    SAFE_DIVIDE(
      COUNT(customer_unique_id),
      SUM(COUNT(customer_unique_id)) OVER()
    ) * 100,
    2
  ) AS percentage_of_delayed_customers

FROM repurchase_after_delay

GROUP BY repurchase_status;


-- ============================================================
-- KPI 3: Average Number of Orders per Customer by Delay Experience
-- ============================================================

-- Definition:
-- Customers are divided into two groups:
--   - NEVER_DELAYED: customers who never experienced a delayed order.
--   - DELAYED_AT_LEAST_ONCE: customers who experienced at least
--     one delayed order.
--
-- For each group, the average number of orders per customer is
-- calculated.
--
-- Purpose:
-- Determine whether customers affected by delivery delays
-- purchase less frequently than customers who never experienced
-- delays.

WITH orders_categorized_deliveries AS (
  SELECT
    order_id,
    o.customer_id,
    c.customer_unique_id,
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
    FROM `olist-operations-analytics.olist_analysis.clean_orders` AS o
    INNER JOIN `olist-operations-analytics.olist_analysis.clean_customers` AS c
      ON o.customer_id=c.customer_id
),

customers_categorized_deliveries AS (
  SELECT
    f.customer_unique_id,
    COUNT(order_id) AS number_of_orders,
    CASE
      WHEN COUNT(CASE WHEN f.delivery_status= "DELAYED" THEN 1 END)>0
      THEN "DELAYED_AT_LEAST_ONCE"
      ELSE "NEVER_DELAYED"
    END AS customer_delay_group

  FROM orders_categorized_deliveries AS f

  GROUP BY f.customer_unique_id
)

SELECT
  g.customer_delay_group,
  COUNT(g.customer_unique_id) AS number_of_users,
  ROUND(
    SAFE_DIVIDE(
      COUNT(g.customer_unique_id),
      SUM(COUNT(g.customer_unique_id)) OVER()
    ),
    2
  ) AS percentage_of_total,
  ROUND(AVG(g.number_of_orders),2) AS average_number_of_orders

FROM customers_categorized_deliveries AS g

GROUP BY g.customer_delay_group;
