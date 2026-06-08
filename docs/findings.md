# Project Findings

## 1. Dataset Understanding

### Total Orders

| Metric       |  Value |
| ------------ | -----: |
| Total Orders | 99,441 |

---

### Dataset Time Range

| Metric              | Value                |
| ------------------- | -------------------- |
| Earliest Order Date | 2016-09-04 21:15:19 UTC |
| Latest Order Date   | 2018-10-17 17:30:18 UTC |

---

### Missing Values in Delivery Fields

| Field                         | Missing Records |
| ----------------------------- | --------------: |
| order_delivered_customer_date |           2,965 |
| order_estimated_delivery_date |               0 |
| order_delivered_carrier_date  |           1,783 |

---

### Data Cleaning Decision

Orders with NULL values in:

* `order_delivered_customer_date`
* `order_estimated_delivery_date`

were excluded from the delivery performance analysis.

Orders with NULL values in:

* `order_delivered_carrier_date`

were retained because this field is not required to evaluate whether the customer delivery promise was fulfilled.

---

### Remaining Valid Orders

| Metric                      |                Value |
| --------------------------- | -------------------: |
| Valid Orders After Cleaning | 96476 |
# 2. Overall Delivery Performance

## Business Question

**How efficient is the delivery process overall?**

---

## KPIs

| KPI                   |     Result |
| --------------------- | ---------: |
| Valid Deliveries      |     96,476 |
| On-Time Deliveries    |     88,649 |
| Delayed Deliveries    |      7,827 |
| On-Time Delivery Rate |     91.89% |
| Delayed Delivery Rate |      8.11% |
| Average Delivery Time | 12.50 days |
| Average Delay Time    | 10.62 days |

---

## Key Findings

* Most orders are delivered successfully and on time.
* Nearly 92% of deliveries meet the promised delivery date.
* Only 8.1% of orders experience delays.
* The average delivery process takes approximately 12.5 days.
* When delays occur, customers wait an additional 10.6 days on average.

---

## Insight

Overall delivery performance appears strong, suggesting that operational inefficiencies are not a systemic issue across the entire business.

However, the relatively long average delay time indicates that when delivery failures occur, their impact on customer experience can be substantial.

This suggests that potential inefficiencies may be concentrated in specific regions, sellers or customer segments rather than affecting the operation as a whole.
