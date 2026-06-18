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

| State | Total Orders | % of Total Orders |
|:---|---:|---:|
| SP | 40,495 | 41.97% |
| RJ | 12,353 | 12.80% |
| MG | 11,355 | 11.77% |
| RS | 5,344 | 5.54% |
| PR | 4,923 | 5.10% |
| SC | 3,547 | 3.68% |
| BA | 3,256 | 3.37% |
| DF | 2,080 | 2.16% |
| ES | 1,995 | 2.07% |
| GO | 1,957 | 2.03% |
| PE | 1,593 | 1.65% |
| CE | 1,279 | 1.33% |
| PA | 946 | 0.98% |
| MT | 886 | 0.92% |
| MA | 717 | 0.74% |
| MS | 701 | 0.73% |
| PB | 517 | 0.54% |
| PI | 476 | 0.49% |
| RN | 474 | 0.49% |
| AL | 397 | 0.41% |
| SE | 335 | 0.35% |
| TO | 274 | 0.28% |
| RO | 243 | 0.25% |
| AM | 145 | 0.15% |
| AC | 80 | 0.08% |
| AP | 67 | 0.07% |
| RR | 41 | 0.04% |

---

## KPI 2 & KPI 3 - Delivery Reliability by State

| State | Total Orders | % of Total Orders | On-Time Orders | Delayed Orders | On-Time Rate | Delayed Rate |
|:---|---:|---:|---:|---:|---:|---:|
| SP | 40,495 | 41.97% | 38,108 | 2,387 | 94.11% | 5.89% |
| RJ | 12,353 | 12.80% | 10,689 | 1,664 | 86.53% | 13.47% |
| MG | 11,355 | 11.77% | 10,717 | 638 | 94.38% | 5.62% |
| RS | 5,344 | 5.54% | 4,962 | 382 | 92.85% | 7.15% |
| PR | 4,923 | 5.10% | 4,677 | 246 | 95.00% | 5.00% |
| SC | 3,547 | 3.68% | 3,201 | 346 | 90.25% | 9.75% |
| BA | 3,256 | 3.37% | 2,799 | 457 | 85.96% | 14.04% |
| DF | 2,080 | 2.16% | 1,933 | 147 | 92.93% | 7.07% |
| ES | 1,995 | 2.07% | 1,751 | 244 | 87.77% | 12.23% |
| GO | 1,957 | 2.03% | 1,797 | 160 | 91.82% | 8.18% |
| PE | 1,593 | 1.65% | 1,421 | 172 | 89.20% | 10.80% |
| CE | 1,279 | 1.33% | 1,083 | 196 | 84.68% | 15.32% |
| PA | 946 | 0.98% | 829 | 117 | 87.63% | 12.37% |
| MT | 886 | 0.92% | 826 | 60 | 93.23% | 6.77% |
| MA | 717 | 0.74% | 576 | 141 | 80.33% | 19.67% |
| MS | 701 | 0.73% | 620 | 81 | 88.45% | 11.55% |
| PB | 517 | 0.54% | 460 | 57 | 88.97% | 11.03% |
| PI | 476 | 0.49% | 400 | 76 | 84.03% | 15.97% |
| RN | 474 | 0.49% | 423 | 51 | 89.24% | 10.76% |
| AL | 397 | 0.41% | 302 | 95 | 76.07% | 23.93% |
| SE | 335 | 0.35% | 284 | 51 | 84.78% | 15.22% |
| TO | 274 | 0.28% | 239 | 35 | 87.23% | 12.77% |
| RO | 243 | 0.25% | 236 | 7 | 97.12% | 2.88% |
| AM | 145 | 0.15% | 139 | 6 | 95.86% | 4.14% |
| AC | 80 | 0.08% | 77 | 3 | 96.25% | 3.75% |
| AP | 67 | 0.07% | 64 | 3 | 95.52% | 4.48% |
| RR | 41 | 0.04% | 36 | 5 | 87.80% | 12.20% |

---

## KPI 4 - Average Delivery Time by State

| State | Total Orders | % of Total Orders | Average Delivery Time (days) |
|:---|---:|---:|---:|
| SP | 40,495 | 41.97% | 8.70 |
| RJ | 12,353 | 12.80% | 15.24 |
| MG | 11,355 | 11.77% | 11.95 |
| RS | 5,344 | 5.54% | 15.25 |
| PR | 4,923 | 5.10% | 11.94 |
| SC | 3,547 | 3.68% | 14.91 |
| BA | 3,256 | 3.37% | 19.28 |
| DF | 2,080 | 2.16% | 12.90 |
| ES | 1,995 | 2.07% | 15.72 |
| GO | 1,957 | 2.03% | 15.54 |
| PE | 1,593 | 1.65% | 18.40 |
| CE | 1,279 | 1.33% | 21.20 |
| PA | 946 | 0.98% | 23.73 |
| MT | 886 | 0.92% | 18.00 |
| MA | 717 | 0.74% | 21.51 |
| MS | 701 | 0.73% | 15.54 |
| PB | 517 | 0.54% | 20.39 |
| PI | 476 | 0.49% | 19.39 |
| RN | 474 | 0.49% | 19.22 |
| AL | 397 | 0.41% | 24.50 |
| SE | 335 | 0.35% | 21.46 |
| TO | 274 | 0.28% | 17.60 |
| RO | 243 | 0.25% | 19.28 |
| AM | 145 | 0.15% | 26.36 |
| AC | 80 | 0.08% | 21.00 |
| AP | 67 | 0.07% | 27.18 |
| RR | 41 | 0.04% | 29.34 |

---

## KPI 5 - Average Delay Time by State

| State | Total Orders | % of Total Orders | Average Delay Time (days) |
|:---|---:|---:|---:|
| SP | 40,495 | 41.97% | 6.35 |
| RJ | 12,353 | 12.80% | 12.15 |
| MG | 11,355 | 11.77% | 6.85 |
| RS | 5,344 | 5.54% | 8.71 |
| PR | 4,923 | 5.10% | 6.73 |
| SC | 3,547 | 3.68% | 6.99 |
| BA | 3,256 | 3.37% | 10.42 |
| DF | 2,080 | 2.16% | 5.95 |
| ES | 1,995 | 2.07% | 9.91 |
| GO | 1,957 | 2.03% | 9.09 |
| PE | 1,593 | 1.65% | 10.65 |
| CE | 1,279 | 1.33% | 13.63 |
| PA | 946 | 0.98% | 11.62 |
| MT | 886 | 0.92% | 9.40 |
| MA | 717 | 0.74% | 9.31 |
| MS | 701 | 0.73% | 7.00 |
| PB | 517 | 0.54% | 9.79 |
| PI | 476 | 0.49% | 11.59 |
| RN | 474 | 0.49% | 12.49 |
| AL | 397 | 0.41% | 8.54 |
| SE | 335 | 0.35% | 16.20 |
| TO | 274 | 0.28% | 5.03 |
| RO | 243 | 0.25% | 5.57 |
| AM | 145 | 0.15% | 20.17 |
| AC | 80 | 0.08% | 18.67 |
| AP | 67 | 0.07% | 48.33 |
| RR | 41 | 0.04% | 36.40 |

---

## Key Findings

- Delivery performance varies significantly across Brazilian states.
- São Paulo (SP) is the clear operational benchmark. It represents **41.97% of total orders** with **40,495 orders**, while maintaining a strong **94.11% on-time delivery rate** and an average delivery time of only **8.70 days**.
- Rio de Janeiro (RJ) is the most relevant underperforming state from a business perspective. It represents **12.80% of total orders** with **12,353 orders**, but shows a much weaker **86.53% on-time delivery rate**, a **13.47% delayed delivery rate**, and an average delivery time of **15.24 days**.
- Compared with São Paulo, Rio de Janeiro combines high order volume with slower deliveries, more frequent delays, and more severe delays. Its average delay time reaches **12.15 days**, almost twice São Paulo’s **6.35 days**.
- Minas Gerais (MG), despite representing **11.77% of total orders**, performs much closer to São Paulo than Rio de Janeiro, with a **94.38% on-time delivery rate** and an average delivery time of **11.95 days**.
- Bahia (BA), Ceará (CE), Maranhão (MA), Piauí (PI), Alagoas (AL) and Sergipe (SE) show poor reliability metrics, with delayed delivery rates above **14%** in several cases.
- Smaller and remote states such as Amazonas (AM), Amapá (AP), Acre (AC) and Roraima (RR) represent a very small share of total orders, but show severe operational challenges, especially in average delivery time and average delay time.
- Amapá (AP) and Roraima (RR) are particularly extreme cases. Although they represent only **0.07%** and **0.04%** of total orders respectively, their average delay times reach **48.33 days** and **36.40 days**.

---

## Insight

Operational inefficiencies are geographically concentrated rather than systemic across the entire business.

From a business impact perspective, Rio de Janeiro emerges as the most relevant underperforming state because it combines significant order volume with poor delivery reliability and long delivery times.

From an operational complexity perspective, several smaller and more remote states show much worse service levels, with longer delivery times and severe delays despite representing a very small share of total orders.

By contrast, São Paulo represents the operational benchmark, achieving both scale and strong delivery performance.
# 4. Seller Performance

## Business Question

**Which sellers contribute the most to delivery inefficiencies?**

---

## Scope of Analysis

The dataset contains **2,970 sellers**, so including every seller in the report would reduce readability and make the analysis difficult to interpret.

For this reason, this section focuses on the **Top 20 sellers by order volume**. This criterion was selected because high-volume sellers have the greatest potential business impact.

The same Top 20 sellers are used consistently across all KPIs to ensure comparability between volume, delivery reliability, delivery time and delay severity.

---

## KPI 1 - Order Volume by Seller

| Seller | Total Orders | % of Total Orders |
|:---|---:|---:|
| 6560211a19b47992c3666cc44a7e94c0 | 1,996 | 1.81% |
| 4a3ca9315b744ce9f8e9374361493884 | 1,949 | 1.77% |
| 1f50f920176fa81dab994f9023523100 | 1,926 | 1.75% |
| cc419e0650a3c5ba77189a1882b7556a | 1,719 | 1.56% |
| da8622b14eb17ae2831f4ac5b9dab84a | 1,548 | 1.40% |
| 955fee9216a65b617aa5c0531780ce60 | 1,472 | 1.34% |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 1,420 | 1.29% |
| 7c67e1448b00f6e969d365cea6b010ab | 1,355 | 1.23% |
| ea8482cd71df3c1969d7b9473ff13abc | 1,188 | 1.08% |
| 7a67c85e85bb2ce8582c35f2203ad736 | 1,155 | 1.05% |
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 1,148 | 1.04% |
| 3d871de0142ce09b7081e2b9d1733cb1 | 1,131 | 1.03% |
| 8b321bb669392f5163d04c59e235e066 | 1,005 | 0.91% |
| cca3071e3e9bb7d12640c9fbe2301306 | 817 | 0.74% |
| 620c87c171fb2a6dd6e8bb4dec959fc6 | 781 | 0.71% |
| a1043bafd471dff536d0c462352beb48 | 752 | 0.68% |
| e9779976487b77c6d4ac45f75ec7afe9 | 738 | 0.67% |
| f8db351d8c4c4c22c6835c19a46f01b0 | 714 | 0.65% |
| d2374cbcbb3ca4ab1086534108cc3ab7 | 620 | 0.56% |
| 391fc6631aebcf3004804e51b40bcf1e | 605 | 0.55% |

---

## KPI 2 & KPI 3 - Delivery Reliability by Seller

| Seller | Total Orders | % of Total Orders | On-Time Orders | Delayed Orders | On-Time Rate | Delayed Rate |
|:---|---:|---:|---:|---:|---:|---:|
| 6560211a19b47992c3666cc44a7e94c0 | 1,996 | 1.81% | 1,872 | 124 | 93.79% | 6.21% |
| 4a3ca9315b744ce9f8e9374361493884 | 1,949 | 1.77% | 1,735 | 214 | 89.02% | 10.98% |
| 1f50f920176fa81dab994f9023523100 | 1,926 | 1.75% | 1,744 | 182 | 90.55% | 9.45% |
| cc419e0650a3c5ba77189a1882b7556a | 1,719 | 1.56% | 1,616 | 103 | 94.01% | 5.99% |
| da8622b14eb17ae2831f4ac5b9dab84a | 1,548 | 1.40% | 1,435 | 113 | 92.70% | 7.30% |
| 955fee9216a65b617aa5c0531780ce60 | 1,472 | 1.34% | 1,353 | 119 | 91.92% | 8.08% |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 1,420 | 1.29% | 1,289 | 131 | 90.77% | 9.23% |
| 7c67e1448b00f6e969d365cea6b010ab | 1,355 | 1.23% | 1,225 | 130 | 90.41% | 9.59% |
| ea8482cd71df3c1969d7b9473ff13abc | 1,188 | 1.08% | 1,065 | 123 | 89.65% | 10.35% |
| 7a67c85e85bb2ce8582c35f2203ad736 | 1,155 | 1.05% | 1,087 | 68 | 94.11% | 5.89% |
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 1,148 | 1.04% | 1,015 | 133 | 88.41% | 11.59% |
| 3d871de0142ce09b7081e2b9d1733cb1 | 1,131 | 1.03% | 1,064 | 67 | 94.08% | 5.92% |
| 8b321bb669392f5163d04c59e235e066 | 1,005 | 0.91% | 902 | 103 | 89.75% | 10.25% |
| cca3071e3e9bb7d12640c9fbe2301306 | 817 | 0.74% | 773 | 44 | 94.61% | 5.39% |
| 620c87c171fb2a6dd6e8bb4dec959fc6 | 781 | 0.71% | 707 | 74 | 90.52% | 9.48% |
| a1043bafd471dff536d0c462352beb48 | 752 | 0.68% | 710 | 42 | 94.41% | 5.59% |
| e9779976487b77c6d4ac45f75ec7afe9 | 738 | 0.67% | 683 | 55 | 92.55% | 7.45% |
| f8db351d8c4c4c22c6835c19a46f01b0 | 714 | 0.65% | 672 | 42 | 94.12% | 5.88% |
| d2374cbcbb3ca4ab1086534108cc3ab7 | 620 | 0.56% | 587 | 33 | 94.68% | 5.32% |
| 391fc6631aebcf3004804e51b40bcf1e | 605 | 0.55% | 547 | 58 | 90.41% | 9.59% |

---

## KPI 4 - Average Delivery Time by Seller

| Seller | Total Orders | % of Total Orders | Average Delivery Time (days) |
|:---|---:|---:|---:|
| 6560211a19b47992c3666cc44a7e94c0 | 1,996 | 1.81% | 9.47 |
| 4a3ca9315b744ce9f8e9374361493884 | 1,949 | 1.77% | 14.37 |
| 1f50f920176fa81dab994f9023523100 | 1,926 | 1.75% | 15.48 |
| cc419e0650a3c5ba77189a1882b7556a | 1,719 | 1.56% | 11.49 |
| da8622b14eb17ae2831f4ac5b9dab84a | 1,548 | 1.40% | 11.11 |
| 955fee9216a65b617aa5c0531780ce60 | 1,472 | 1.34% | 10.67 |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 1,420 | 1.29% | 12.00 |
| 7c67e1448b00f6e969d365cea6b010ab | 1,355 | 1.23% | 22.33 |
| ea8482cd71df3c1969d7b9473ff13abc | 1,188 | 1.08% | 13.22 |
| 7a67c85e85bb2ce8582c35f2203ad736 | 1,155 | 1.05% | 11.14 |
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 1,148 | 1.04% | 14.94 |
| 3d871de0142ce09b7081e2b9d1733cb1 | 1,131 | 1.03% | 13.35 |
| 8b321bb669392f5163d04c59e235e066 | 1,005 | 0.91% | 12.54 |
| cca3071e3e9bb7d12640c9fbe2301306 | 817 | 0.74% | 14.25 |
| 620c87c171fb2a6dd6e8bb4dec959fc6 | 781 | 0.71% | 12.84 |
| a1043bafd471dff536d0c462352beb48 | 752 | 0.68% | 13.55 |
| e9779976487b77c6d4ac45f75ec7afe9 | 738 | 0.67% | 9.77 |
| f8db351d8c4c4c22c6835c19a46f01b0 | 714 | 0.65% | 9.89 |
| d2374cbcbb3ca4ab1086534108cc3ab7 | 620 | 0.56% | 14.25 |
| 391fc6631aebcf3004804e51b40bcf1e | 605 | 0.55% | 14.23 |

---

## KPI 5 - Average Delay Time by Seller

| Seller | Total Orders | % of Total Orders | Average Delay Time (days) |
|:---|---:|---:|---:|
| 6560211a19b47992c3666cc44a7e94c0 | 1,996 | 1.81% | 7.55 |
| 4a3ca9315b744ce9f8e9374361493884 | 1,949 | 1.77% | 11.05 |
| 1f50f920176fa81dab994f9023523100 | 1,926 | 1.75% | 10.47 |
| cc419e0650a3c5ba77189a1882b7556a | 1,719 | 1.56% | 7.85 |
| da8622b14eb17ae2831f4ac5b9dab84a | 1,548 | 1.40% | 10.85 |
| 955fee9216a65b617aa5c0531780ce60 | 1,472 | 1.34% | 7.92 |
| 1025f0e2d44d7041d6cf58b6550e0bfa | 1,420 | 1.29% | 7.06 |
| 7c67e1448b00f6e969d365cea6b010ab | 1,355 | 1.23% | 10.90 |
| ea8482cd71df3c1969d7b9473ff13abc | 1,188 | 1.08% | 8.10 |
| 7a67c85e85bb2ce8582c35f2203ad736 | 1,155 | 1.05% | 12.70 |
| 4869f7a5dfa277a7dca6462dcf3b52b2 | 1,148 | 1.04% | 9.24 |
| 3d871de0142ce09b7081e2b9d1733cb1 | 1,131 | 1.03% | 9.73 |
| 8b321bb669392f5163d04c59e235e066 | 1,005 | 0.91% | 9.36 |
| cca3071e3e9bb7d12640c9fbe2301306 | 817 | 0.74% | 18.62 |
| 620c87c171fb2a6dd6e8bb4dec959fc6 | 781 | 0.71% | 10.68 |
| a1043bafd471dff536d0c462352beb48 | 752 | 0.68% | 9.70 |
| e9779976487b77c6d4ac45f75ec7afe9 | 738 | 0.67% | 12.76 |
| f8db351d8c4c4c22c6835c19a46f01b0 | 714 | 0.65% | 6.94 |
| d2374cbcbb3ca4ab1086534108cc3ab7 | 620 | 0.56% | 7.37 |
| 391fc6631aebcf3004804e51b40bcf1e | 605 | 0.55% | 9.12 |

---

## Key Findings

- Seller performance varies meaningfully among the highest-volume sellers.
- The largest seller, `6560211a19b47992c3666cc44a7e94c0`, handles **1,996 orders**, representing **1.81% of total orders**, while maintaining a strong **93.79% on-time delivery rate** and an average delivery time of **9.47 days**.
- Seller `4a3ca9315b744ce9f8e9374361493884` is one of the most relevant underperformers from a business impact perspective. It handles **1,949 orders**, represents **1.77% of total orders**, and shows a **10.98% delayed delivery rate**.
- Seller `1f50f920176fa81dab994f9023523100` also combines high order volume with weaker operational performance, handling **1,926 orders** with an average delivery time of **15.48 days** and a **9.45% delayed delivery rate**.
- Seller `4869f7a5dfa277a7dca6462dcf3b52b2` has the highest delayed delivery rate among the Top 20 sellers, at **11.59%**, while representing **1.04% of total orders**.
- Seller `7c67e1448b00f6e969d365cea6b010ab` stands out for its very long average delivery time of **22.33 days**, despite representing only **1.23% of total orders**.
- Seller `cca3071e3e9bb7d12640c9fbe2301306` has a relatively low delayed delivery rate of **5.39%**, but when delays occur, they are severe, with an average delay time of **18.62 days**.
- Several high-volume sellers maintain strong reliability, suggesting that seller-level delivery problems are concentrated in a subset of sellers rather than being evenly distributed across the marketplace.

---

## Insight

Delivery inefficiencies are not evenly distributed across sellers.

From a business impact perspective, sellers such as `4a3ca9315b744ce9f8e9374361493884`, `1f50f920176fa81dab994f9023523100`, and `4869f7a5dfa277a7dca6462dcf3b52b2` deserve particular attention because they combine relatively high order volume with weaker delivery reliability.

From an operational severity perspective, sellers such as `7c67e1448b00f6e969d365cea6b010ab` and `cca3071e3e9bb7d12640c9fbe2301306` show especially long delivery or delay durations, suggesting deeper logistical bottlenecks.

Overall, seller-level performance monitoring could help prioritize operational improvements among the sellers with the greatest business impact.
# 5. Product Category Performance

## Business Question

**Which product categories experience the worst operational performance?**

---

## Scope of Analysis

This section includes all product categories available in the query results.

The analysis evaluates both business impact and operational performance. For this reason, each KPI includes the total number of orders and the percentage of total orders represented by each category.

---

## KPI 1 - Order Volume by Product Category

| Product Category | Total Orders | % of Total Orders |
|:---|---:|---:|
| bed_bath_table | 10,953 | 9.94% |
| health_beauty | 9,467 | 8.59% |
| sports_leisure | 8,431 | 7.65% |
| furniture_decor | 8,160 | 7.40% |
| computers_accessories | 7,643 | 6.94% |
| housewares | 6,795 | 6.17% |
| watches_gifts | 5,857 | 5.32% |
| telephony | 4,430 | 4.02% |
| garden_tools | 4,268 | 3.87% |
| auto | 4,139 | 3.76% |
| toys | 4,030 | 3.66% |
| cool_stuff | 3,718 | 3.37% |
| perfumery | 3,342 | 3.03% |
| baby | 2,982 | 2.71% |
| electronics | 2,729 | 2.48% |
| stationery | 2,466 | 2.24% |
| fashion_bags_accessories | 1,986 | 1.80% |
| pet_shop | 1,924 | 1.75% |
| office_furniture | 1,668 | 1.51% |
| nan | 1,559 | 1.41% |
| consoles_games | 1,089 | 0.99% |
| luggage_accessories | 1,077 | 0.98% |
| construction_tools_construction | 916 | 0.83% |
| home_appliances | 754 | 0.68% |
| small_appliances | 658 | 0.60% |
| musical_instruments | 651 | 0.59% |
| home_construction | 596 | 0.54% |
| books_general_interest | 536 | 0.49% |
| food | 499 | 0.45% |
| furniture_living_room | 495 | 0.45% |
| home_confort | 429 | 0.39% |
| audio | 362 | 0.33% |
| drinks | 361 | 0.33% |
| market_place | 305 | 0.28% |
| construction_tools_lights | 301 | 0.27% |
| air_conditioning | 289 | 0.26% |
| kitchen_dining_laundry_garden_furniture | 274 | 0.25% |
| food_drink | 269 | 0.24% |
| industry_commerce_and_business | 264 | 0.24% |
| books_technical | 263 | 0.24% |
| fashion_shoes | 257 | 0.23% |
| fixed_telephony | 255 | 0.23% |
| costruction_tools_garden | 232 | 0.21% |
| home_appliances_2 | 231 | 0.21% |
| agro_industry_and_commerce | 206 | 0.19% |
| computers | 199 | 0.18% |
| art | 197 | 0.18% |
| signaling_and_security | 197 | 0.18% |
| construction_tools_safety | 183 | 0.17% |
| christmas_supplies | 150 | 0.14% |
| fashion_underwear_beach | 127 | 0.12% |
| fashion_male_clothing | 125 | 0.11% |
| costruction_tools_tools | 103 | 0.09% |
| furniture_bedroom | 103 | 0.09% |
| tablets_printing_image | 83 | 0.08% |
| small_appliances_home_oven_and_coffee | 73 | 0.07% |
| cine_photo | 70 | 0.06% |
| dvds_blu_ray | 61 | 0.06% |
| books_imported | 57 | 0.05% |
| fashio_female_clothing | 45 | 0.04% |
| party_supplies | 42 | 0.04% |
| music | 38 | 0.03% |
| furniture_mattress_and_upholstery | 37 | 0.03% |
| diapers_and_hygiene | 37 | 0.03% |
| flowers | 33 | 0.03% |
| home_comfort_2 | 30 | 0.03% |
| fashion_sport | 29 | 0.03% |
| arts_and_craftmanship | 24 | 0.02% |
| la_cuisine | 14 | 0.01% |
| cds_dvds_musicals | 14 | 0.01% |
| fashion_childrens_clothes | 7 | 0.01% |
| security_and_services | 2 | 0.00% |

---

## KPI 2 & KPI 3 - Delivery Reliability by Product Category

| Product Category | Total Orders | % of Total Orders | On-Time Orders | Delayed Orders | On-Time Rate | Delayed Rate |
|:---|---:|---:|---:|---:|---:|---:|
| bed_bath_table | 10,953 | 9.94% | 10,033 | 920 | 91.60% | 8.40% |
| health_beauty | 9,467 | 8.59% | 8,609 | 858 | 90.94% | 9.06% |
| sports_leisure | 8,431 | 7.65% | 7,806 | 625 | 92.59% | 7.41% |
| furniture_decor | 8,160 | 7.40% | 7,472 | 688 | 91.57% | 8.43% |
| computers_accessories | 7,643 | 6.94% | 7,049 | 594 | 92.23% | 7.77% |
| housewares | 6,795 | 6.17% | 6,354 | 441 | 93.51% | 6.49% |
| watches_gifts | 5,857 | 5.32% | 5,372 | 485 | 91.72% | 8.28% |
| telephony | 4,430 | 4.02% | 4,061 | 369 | 91.67% | 8.33% |
| garden_tools | 4,268 | 3.87% | 3,928 | 340 | 92.03% | 7.97% |
| auto | 4,139 | 3.76% | 3,796 | 343 | 91.71% | 8.29% |
| toys | 4,030 | 3.66% | 3,731 | 299 | 92.58% | 7.42% |
| cool_stuff | 3,718 | 3.37% | 3,467 | 251 | 93.25% | 6.75% |
| perfumery | 3,342 | 3.03% | 3,097 | 245 | 92.67% | 7.33% |
| baby | 2,982 | 2.71% | 2,720 | 262 | 91.21% | 8.79% |
| electronics | 2,729 | 2.48% | 2,463 | 266 | 90.25% | 9.75% |
| stationery | 2,466 | 2.24% | 2,268 | 198 | 91.97% | 8.03% |
| fashion_bags_accessories | 1,986 | 1.80% | 1,862 | 124 | 93.76% | 6.24% |
| pet_shop | 1,924 | 1.75% | 1,806 | 118 | 93.87% | 6.13% |
| office_furniture | 1,668 | 1.51% | 1,519 | 149 | 91.07% | 8.93% |
| nan | 1,559 | 1.41% | 1,414 | 145 | 90.70% | 9.30% |
| consoles_games | 1,089 | 0.99% | 1,004 | 85 | 92.19% | 7.81% |
| luggage_accessories | 1,077 | 0.98% | 1,019 | 58 | 94.61% | 5.39% |
| construction_tools_construction | 916 | 0.83% | 842 | 74 | 91.92% | 8.08% |
| home_appliances | 754 | 0.68% | 703 | 51 | 93.24% | 6.76% |
| small_appliances | 658 | 0.60% | 619 | 39 | 94.07% | 5.93% |
| musical_instruments | 651 | 0.59% | 595 | 56 | 91.40% | 8.60% |
| home_construction | 596 | 0.54% | 547 | 49 | 91.78% | 8.22% |
| books_general_interest | 536 | 0.49% | 501 | 35 | 93.47% | 6.53% |
| food | 499 | 0.45% | 450 | 49 | 90.18% | 9.82% |
| furniture_living_room | 495 | 0.45% | 456 | 39 | 92.12% | 7.88% |
| home_confort | 429 | 0.39% | 385 | 44 | 89.74% | 10.26% |
| audio | 362 | 0.33% | 316 | 46 | 87.29% | 12.71% |
| drinks | 361 | 0.33% | 341 | 20 | 94.46% | 5.54% |
| market_place | 305 | 0.28% | 292 | 13 | 95.74% | 4.26% |
| construction_tools_lights | 301 | 0.27% | 271 | 30 | 90.03% | 9.97% |
| air_conditioning | 289 | 0.26% | 278 | 11 | 96.19% | 3.81% |
| kitchen_dining_laundry_garden_furniture | 274 | 0.25% | 262 | 12 | 95.62% | 4.38% |
| food_drink | 269 | 0.24% | 252 | 17 | 93.68% | 6.32% |
| industry_commerce_and_business | 264 | 0.24% | 244 | 20 | 92.42% | 7.58% |
| books_technical | 263 | 0.24% | 234 | 29 | 88.97% | 11.03% |
| fashion_shoes | 257 | 0.23% | 242 | 15 | 94.16% | 5.84% |
| fixed_telephony | 255 | 0.23% | 244 | 11 | 95.69% | 4.31% |
| costruction_tools_garden | 232 | 0.21% | 215 | 17 | 92.67% | 7.33% |
| home_appliances_2 | 231 | 0.21% | 215 | 16 | 93.07% | 6.93% |
| agro_industry_and_commerce | 206 | 0.19% | 197 | 9 | 95.63% | 4.37% |
| computers | 199 | 0.18% | 186 | 13 | 93.47% | 6.53% |
| art | 197 | 0.18% | 182 | 15 | 92.39% | 7.61% |
| signaling_and_security | 197 | 0.18% | 186 | 11 | 94.42% | 5.58% |
| construction_tools_safety | 183 | 0.17% | 173 | 10 | 94.54% | 5.46% |
| christmas_supplies | 150 | 0.14% | 132 | 18 | 88.00% | 12.00% |
| fashion_underwear_beach | 127 | 0.12% | 111 | 16 | 87.40% | 12.60% |
| fashion_male_clothing | 125 | 0.11% | 118 | 7 | 94.40% | 5.60% |
| costruction_tools_tools | 103 | 0.09% | 97 | 6 | 94.17% | 5.83% |
| furniture_bedroom | 103 | 0.09% | 95 | 8 | 92.23% | 7.77% |
| tablets_printing_image | 83 | 0.08% | 77 | 6 | 92.77% | 7.23% |
| small_appliances_home_oven_and_coffee | 73 | 0.07% | 68 | 5 | 93.15% | 6.85% |
| cine_photo | 70 | 0.06% | 65 | 5 | 92.86% | 7.14% |
| dvds_blu_ray | 61 | 0.06% | 57 | 4 | 93.44% | 6.56% |
| books_imported | 57 | 0.05% | 55 | 2 | 96.49% | 3.51% |
| fashio_female_clothing | 45 | 0.04% | 42 | 3 | 93.33% | 6.67% |
| party_supplies | 42 | 0.04% | 40 | 2 | 95.24% | 4.76% |
| music | 38 | 0.03% | 35 | 3 | 92.11% | 7.89% |
| furniture_mattress_and_upholstery | 37 | 0.03% | 32 | 5 | 86.49% | 13.51% |
| diapers_and_hygiene | 37 | 0.03% | 36 | 1 | 97.30% | 2.70% |
| flowers | 33 | 0.03% | 32 | 1 | 96.97% | 3.03% |
| home_comfort_2 | 30 | 0.03% | 25 | 5 | 83.33% | 16.67% |
| fashion_sport | 29 | 0.03% | 27 | 2 | 93.10% | 6.90% |
| arts_and_craftmanship | 24 | 0.02% | 22 | 2 | 91.67% | 8.33% |
| la_cuisine | 14 | 0.01% | 14 | 0 | 100.00% | 0.00% |
| cds_dvds_musicals | 14 | 0.01% | 14 | 0 | 100.00% | 0.00% |
| fashion_childrens_clothes | 7 | 0.01% | 7 | 0 | 100.00% | 0.00% |
| security_and_services | 2 | 0.00% | 2 | 0 | 100.00% | 0.00% |

---

## KPI 4 - Average Delivery Time by Product Category

[Use the full table from your CSV here.]

---

## KPI 5 - Average Delay Time by Product Category

[Use the full table from your CSV here.]

---

## Key Findings

- Product category performance varies meaningfully across the marketplace.
- **Bed Bath Table** is the largest product category, with **10,953 orders**, representing **9.94% of total orders**.
- The five largest categories — **Bed Bath Table**, **Health Beauty**, **Sports Leisure**, **Furniture Decor** and **Computers Accessories** — jointly represent approximately **40.52%** of all orders.
- **Bed Bath Table** generates the highest number of delayed orders, with **920 delayed deliveries**, making it highly relevant from a business impact perspective.
- **Health Beauty** is the second-largest category and also shows a relatively high delayed delivery rate of **9.06%**.
- **Electronics**, **Audio**, **Books Technical**, **Christmas Supplies**, **Fashion Underwear Beach**, **Furniture Mattress and Upholstery**, and **Home Comfort 2** show weaker delivery reliability, but several of these categories represent a small share of total orders.
- **Housewares** stands out as a strong benchmark category, combining scale with a relatively high **93.51% on-time delivery rate** and a low average delivery time of **10.87 days**.
- Categories with very small order volumes can show extreme reliability rates, so their percentages should be interpreted carefully.

---

## Insight

Operational inefficiencies are not evenly distributed across product categories.

From a business impact perspective, categories such as **Bed Bath Table**, **Health Beauty**, **Furniture Decor**, and **Computers Accessories** deserve particular attention because they combine high order volume with a significant number of delayed deliveries.

From an operational efficiency perspective, categories such as **Housewares** perform comparatively well despite substantial order volume.

Overall, category-level monitoring can help prioritize improvement efforts toward the product categories with the greatest impact on customer experience and marketplace performance.
