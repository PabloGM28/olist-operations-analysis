# Olist Operations Analytics

## Project Overview

This project analyzes the Brazilian E-Commerce Public Dataset by Olist to understand how operational inefficiencies impact customer satisfaction and business performance.

The analysis is performed using SQL in Google BigQuery and Tableau, following a structured business analytics approach.

---

## Business Question

**How do operational inefficiencies impact customer satisfaction and business performance?**

---

## Project Objective

Identify whether delivery inefficiencies negatively affect customer experience and determine which regions, sellers and product categories are associated with poor operational performance.

---

## Dataset

Brazilian E-Commerce Public Dataset by Olist

Source:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## Business Definition

### Operational Inefficiency

An order is considered operationally inefficient when the actual delivery date exceeds the estimated delivery date promised to the customer.

```text
actual_delivery_date > estimated_delivery_date
```

This definition focuses on the customer-facing delivery promise rather than internal logistics responsibility.

---

## Data Cleaning & Inclusion Criteria

To ensure consistency throughout the analysis, only delivered orders containing the information required to evaluate delivery performance will be included.

### Excluded Orders

Orders will be excluded if:

* `order_estimated_delivery_date` is NULL.
* `order_delivered_customer_date` is NULL.

These fields are required to determine whether an order was delivered on time.

### Included Orders

Orders with missing values in other fields will remain in the dataset unless those fields are required for a specific analysis.

This approach ensures that all business metrics are calculated using only the information necessary to answer the original business question.

---

## Methodology

The project follows a business-first approach:

1. Define the business question.
2. Define business concepts and inclusion criteria.
3. Identify the required tables and relationships.
4. Answer each business question individually using SQL.
5. Interpret each result before moving to the next question.
6. Build Tableau dashboards to communicate the findings.

The analysis will be conducted sequentially, question by question and KPI by KPI.

---

## Main Business Questions

### 1. Delivery Performance

**How efficient is the delivery process overall?**

### 2. Geographic Analysis

**Which regions experience the worst delivery performance?**

### 3. Seller Analysis

**Which sellers contribute most to delivery inefficiencies?**

### 4. Product Category Analysis

**Which product categories experience the worst operational performance?**

### 5. Customer Satisfaction

**Do delivery delays negatively impact customer review scores?**

### 6. Business Impact

**How do operational inefficiencies affect overall business performance?**

---

## Main KPIs

### Delivery KPIs

* Average Delivery Time
* Average Delay Time
* Delayed Orders (%)
* On-Time Delivery Rate

### Customer KPIs

* Average Review Score
* Percentage of Low Reviews (1–2 stars)

### Business KPIs

* Total Orders
* Revenue
* Orders by Region
* Revenue by Seller

---

## Tools Used

* Google BigQuery
* SQL
* Tableau
* GitHub

---

## Repository Structure

```text
data/

sql/
01_data_understanding.sql
02_delivery_performance.sql
03_geographic_analysis.sql
04_seller_analysis.sql
05_product_analysis.sql
06_customer_satisfaction.sql
07_business_impact.sql

tableau/

outputs/

README.md
```

---

## Project Status

In progress.

Current stage:

```text
Dataset loaded into BigQuery and project methodology defined.
```
