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
| Earliest Order Date | *(add query result)* |
| Latest Order Date   | *(add query result)* |

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
| Valid Orders After Cleaning | *(add query result)* |
