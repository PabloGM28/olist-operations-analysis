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

# 3. Geographic Delivery Performance

## Business Question

**Which regions experience the worst delivery performance?**

---

## KPI 1 - Order Volume by State

| State | Total Orders |
|:---|---:|
| SP | 40,495 |
| RJ | 12,353 |
| MG | 11,355 |
| RS | 5,344 |
| PR | 4,923 |
| SC | 3,547 |
| BA | 3,256 |
| DF | 2,080 |
| ES | 1,995 |
| GO | 1,957 |
| PE | 1,593 |
| CE | 1,279 |
| PA | 946 |
| MT | 886 |
| MA | 717 |
| MS | 701 |
| PB | 517 |
| PI | 476 |
| RN | 474 |
| AL | 397 |
| SE | 335 |
| TO | 274 |
| RO | 243 |
| AM | 145 |
| AC | 80 |
| AP | 67 |
| RR | 41 |

---

## KPI 2 & KPI 3 - Delivery Reliability by State

| State | Total Orders | On-Time Orders | Delayed Orders | On-Time Rate | Delayed Rate |
|:---|---:|---:|---:|---:|---:|
| SP | 40,495 | 38,108 | 2,387 | 94.11% | 5.89% |
| RJ | 12,353 | 10,689 | 1,664 | 86.53% | 13.47% |
| MG | 11,355 | 10,717 | 638 | 94.38% | 5.62% |
| RS | 5,344 | 4,962 | 382 | 92.85% | 7.15% |
| PR | 4,923 | 4,677 | 246 | 95.00% | 5.00% |
| SC | 3,547 | 3,201 | 346 | 90.25% | 9.75% |
| BA | 3,256 | 2,799 | 457 | 85.96% | 14.04% |
| DF | 2,080 | 1,933 | 147 | 92.93% | 7.07% |
| ES | 1,995 | 1,751 | 244 | 87.77% | 12.23% |
| GO | 1,957 | 1,797 | 160 | 91.82% | 8.18% |
| PE | 1,593 | 1,421 | 172 | 89.20% | 10.80% |
| CE | 1,279 | 1,083 | 196 | 84.68% | 15.32% |
| PA | 946 | 829 | 117 | 87.63% | 12.37% |
| MT | 886 | 826 | 60 | 93.23% | 6.77% |
| MA | 717 | 576 | 141 | 80.33% | 19.67% |
| MS | 701 | 620 | 81 | 88.45% | 11.55% |
| PB | 517 | 460 | 57 | 88.97% | 11.03% |
| PI | 476 | 400 | 76 | 84.03% | 15.97% |
| RN | 474 | 423 | 51 | 89.24% | 10.76% |
| AL | 397 | 302 | 95 | 76.07% | 23.93% |
| SE | 335 | 284 | 51 | 84.78% | 15.22% |
| TO | 274 | 239 | 35 | 87.23% | 12.77% |
| RO | 243 | 236 | 7 | 97.12% | 2.88% |
| AM | 145 | 139 | 6 | 95.86% | 4.14% |
| AC | 80 | 77 | 3 | 96.25% | 3.75% |
| AP | 67 | 64 | 3 | 95.52% | 4.48% |
| RR | 41 | 36 | 5 | 87.80% | 12.20% |

---

## KPI 4 - Average Delivery Time by State

| State | Total Orders | Average Delivery Time (days) |
|:---|---:|---:|
| SP | 40,495 | 8.70 |
| RJ | 12,353 | 15.24 |
| MG | 11,355 | 11.95 |
| RS | 5,344 | 15.25 |
| PR | 4,923 | 11.94 |
| SC | 3,547 | 14.91 |
| BA | 3,256 | 19.28 |
| DF | 2,080 | 12.90 |
| ES | 1,995 | 15.72 |
| GO | 1,957 | 15.54 |
| PE | 1,593 | 18.40 |
| CE | 1,279 | 21.20 |
| PA | 946 | 23.73 |
| MT | 886 | 18.00 |
| MA | 717 | 21.51 |
| MS | 701 | 15.54 |
| PB | 517 | 20.39 |
| PI | 476 | 19.39 |
| RN | 474 | 19.22 |
| AL | 397 | 24.50 |
| SE | 335 | 21.46 |
| TO | 274 | 17.60 |
| RO | 243 | 19.28 |
| AM | 145 | 26.36 |
| AC | 80 | 21.00 |
| AP | 67 | 27.18 |
| RR | 41 | 29.34 |

---

## KPI 5 - Average Delay Time by State

| State | Total Orders | Average Delay Time (days) |
|:---|---:|---:|
| SP | 40,495 | 6.35 |
| RJ | 12,353 | 12.15 |
| MG | 11,355 | 6.85 |
| RS | 5,344 | 8.71 |
| PR | 4,923 | 6.73 |
| SC | 3,547 | 6.99 |
| BA | 3,256 | 10.42 |
| DF | 2,080 | 5.95 |
| ES | 1,995 | 9.91 |
| GO | 1,957 | 9.09 |
| PE | 1,593 | 10.65 |
| CE | 1,279 | 13.63 |
| PA | 946 | 11.62 |
| MT | 886 | 9.40 |
| MA | 717 | 9.31 |
| MS | 701 | 7.00 |
| PB | 517 | 9.79 |
| PI | 476 | 11.59 |
| RN | 474 | 12.49 |
| AL | 397 | 8.54 |
| SE | 335 | 16.20 |
| TO | 274 | 5.03 |
| RO | 243 | 5.57 |
| AM | 145 | 20.17 |
| AC | 80 | 18.67 |
| AP | 67 | 48.33 |
| RR | 41 | 36.40 |

---

## Key Findings

- Delivery performance varies significantly across Brazilian states.
- São Paulo (SP) is the clear operational benchmark: it has the highest order volume, with **40,495 orders**, while maintaining a strong **94.11% on-time delivery rate** and an average delivery time of only **8.70 days**.
- Rio de Janeiro (RJ) is the most relevant underperforming state from a business perspective. It has the second-highest volume, with **12,353 orders**, but a much weaker **86.53% on-time delivery rate**, a **13.47% delayed delivery rate**, and an average delivery time of **15.24 days**.
- Compared with São Paulo, Rio de Janeiro combines high order volume with slower deliveries, more frequent delays, and more severe delays.
- Bahia (BA), Ceará (CE), Maranhão (MA), Piauí (PI), Alagoas (AL) and Sergipe (SE) show poor reliability metrics, with delayed delivery rates above **14%** in several cases.
- Smaller and remote states such as Amazonas (AM), Amapá (AP), Acre (AC) and Roraima (RR) show severe operational challenges, especially in average delivery time and average delay time.
- Amapá (AP) and Roraima (RR) have very low order volumes, but extremely high average delay times, suggesting that serving remote regions may involve significant logistical complexity.

---

## Insight

Operational inefficiencies are geographically concentrated rather than systemic across the entire business.

From a business impact perspective, Rio de Janeiro emerges as the most relevant underperforming state because it combines high order volume with poor delivery reliability and long delivery times.

From an operational complexity perspective, several smaller and more remote states show much worse service levels, with longer delivery times and severe delays despite lower order volumes.

By contrast, São Paulo represents the operational benchmark, achieving both scale and strong delivery performance.
