-- ============================================================
-- 01_data_understanding.sql
-- Project: Olist Operations Analytics
-- Purpose:
--   Understand the structure and quality of the orders dataset
--   before calculating operational performance KPIs.
--
-- Business Question:
--   How do operational inefficiencies impact customer satisfaction
--   and business performance?
--
-- Operational Inefficiency Definition:
--   An order is considered operationally inefficient when the
--   actual delivery date exceeds the estimated delivery date
--   promised to the customer.
-- ============================================================


-- ============================================================
-- 1. Dataset Overview
-- ============================================================

-- Total number of orders in the dataset

SELECT
    COUNT(*) AS total_orders
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`;


-- Date range covered by the orders dataset

SELECT
    MIN(order_purchase_timestamp) AS earliest_order_date,
    MAX(order_purchase_timestamp) AS latest_order_date
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`;


-- ============================================================
-- 2. Missing Values in Delivery Fields
-- ============================================================

-- This query checks missing values in the key delivery fields.
-- order_estimated_delivery_date and order_delivered_customer_date
-- are required to calculate the On-Time Delivery Rate.

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
-- the cleaning criteria defined for the project.

SELECT
    COUNT(*) AS remaining_valid_orders
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`
WHERE
    order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;

-- ============================================================
-- 4. Create Clean Orders Table
-- ============================================================

-- Create a clean orders table to ensure consistency
-- across all subsequent analyses.

CREATE OR REPLACE TABLE `olist-operations-analytics.olist_analysis.clean_orders` AS

SELECT
    *
FROM `olist-operations-analytics.olist_raw.olist_orders_dataset`
WHERE
    order_delivered_customer_date IS NOT NULL
    AND order_estimated_delivery_date IS NOT NULL;
