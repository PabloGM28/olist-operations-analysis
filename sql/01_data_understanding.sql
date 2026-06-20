-- ============================================================
-- 1. Dataset Overview
-- ============================================================

-- Total number of orders available in the raw dataset.

SELECT
    COUNT(*) AS total_orders
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`;


-- Date range covered by the dataset.

SELECT
    MIN(order_purchase_timestamp) AS earliest_order_date,
    MAX(order_purchase_timestamp) AS latest_order_date
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`;


-- ============================================================
-- 2. Missing Values in Delivery Fields
-- ============================================================

-- Check missing values in the delivery-related fields required
-- for the operational performance analysis.

SELECT
    COUNT(*) AS total_orders,
    COUNT(*) - COUNT(order_delivered_customer_date) AS delivered_customer_date_nulls,
    COUNT(*) - COUNT(order_estimated_delivery_date) AS estimated_delivery_date_nulls,
    COUNT(*) - COUNT(order_delivered_carrier_date) AS delivered_carrier_date_nulls
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`;


-- ============================================================
-- 3. Valid Orders After Data Cleaning
-- ============================================================

-- Count the number of orders remaining after applying
-- the data cleaning criteria.

SELECT
    COUNT(*) AS remaining_valid_orders
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`
WHERE
    order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;


-- ============================================================
-- 4. Create Clean Orders Table
-- ============================================================

-- Create the clean_orders table to ensure consistency
-- across all subsequent analyses.

CREATE OR REPLACE TABLE `olist-operations-analytics.olist_analysis.clean_orders` AS

SELECT
    *
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`
WHERE
    order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;
