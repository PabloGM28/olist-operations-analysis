# Olist Operations Analytics

Business Analytics project using SQL and the Brazilian Olist e-commerce dataset to investigate how delivery delays affect customer satisfaction, customer retention and overall business performance.

---

## Business Problem

Operational inefficiencies can damage customer experience and reduce customer loyalty.

This project investigates whether delivery delays negatively affect customer satisfaction and customer retention, and identifies the regions, sellers and product categories that contribute most to those failures.

---

## Business Question

**How do operational inefficiencies impact customer satisfaction and business performance?**

---

## Dataset

**Source:** Olist Brazilian E-Commerce Public Dataset (Kaggle)

The dataset contains approximately 100,000 e-commerce orders placed between 2016 and 2018 across multiple Brazilian states.

Main tables used:

* Orders
* Customers
* Order Items
* Reviews
* Product Categories

---

## Tools Used

* SQL (Google BigQuery)
* GitHub
* Markdown

Future versions:

* Tableau

---

## Project Structure

### 1. Dataset Understanding

Understand the dataset and perform data cleaning.

### 2. Overall Delivery Performance

Evaluate overall delivery efficiency.

### 3. Customer Satisfaction Analysis

Measure the impact of delivery delays on customer reviews.

### 4. Business Impact of Delivery Delays

Analyze whether delays affect customer retention and future purchasing behavior.

### 5. Geographic Analysis

Identify the regions contributing most to delivery failures.

### 6. Seller Analysis

Identify the sellers contributing most to delivery failures.

### 7. Product Category Analysis

Identify the product categories contributing most to delivery failures.

---

## Key Findings

* **91.89%** of orders are delivered on time.

* Delayed orders receive significantly lower review scores (**2.6 vs 4.3**).

* Customers who experience delays rarely place another order after their first delayed purchase.

* Delivery failures are concentrated rather than systemic.

* Rio de Janeiro emerges as the most relevant underperforming region from a business perspective.

* A subset of sellers contributes disproportionately to delivery problems.

* Certain product categories generate a large share of delayed deliveries.

---

## Conclusion

Delivery delays are not a systemic problem across the marketplace, but they have a disproportionate impact on customer satisfaction and customer retention.

Because these failures are concentrated in specific regions, sellers and product categories, targeted operational improvements could significantly improve customer experience without requiring changes across the entire operation.

---

## Repository Structure

```text
sql/
├── 01_data_understanding.sql
├── 02_delivery_performance.sql
├── 03_customer_satisfaction_analysis.sql
├── 04_business_impact_of_delays.sql
├── 05_geographic_analysis.sql
├── 06_seller_analysis.sql
└── 07_product_category_analysis.sql

findings/
└── project_findings.md
```

---

## Next Steps

* Build an interactive Tableau dashboard.
* Create executive visualizations for business stakeholders.
* Add operational recommendations based on the findings.
* Expand the analysis with additional business metrics.
