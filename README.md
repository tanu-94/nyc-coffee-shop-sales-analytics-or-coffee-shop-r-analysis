# ☕ NYC Coffee Shop Sales Analytics: Retail Analytics & Predictive Modeling in R

[![R](https://img.shields.io/badge/R-4.6%2B-276DC3?logo=r&logoColor=white)](https://www.r-project.org/)
[![Analytics](https://img.shields.io/badge/Focus-Retail%20Analytics-orange)]()
[![Statistics](https://img.shields.io/badge/Statistics-Hypothesis%20Testing-blue)]()
[![Modeling](https://img.shields.io/badge/Modeling-Linear%20Regression-success)]()

## 📌 Project Overview

This project presents an **end-to-end retail sales analytics and predictive modeling workflow in R**, using **149,116 coffee shop transactions** collected across three New York City locations:

- 📍 Astoria
- 📍 Hell's Kitchen
- 📍 Lower Manhattan

The dataset covers **January–June 2023** and is analyzed from both a **business intelligence** and **statistical modeling** perspective.

The project follows:

> **Data Cleaning → Exploratory Data Analysis → Business Insights → Hypothesis Testing → Predictive Modeling → Executive Reporting**

---

## 🎯 Business Objectives

The analysis answers the following business questions:

1. Which store locations generate the strongest sales performance?
2. When are the busiest ordering periods?
3. How does revenue change over time?
4. Which product categories contribute most to sales?
5. Are transaction values significantly different across store locations?
6. Does transaction value differ between weekdays and weekends?
7. Which factors help explain transaction value?
8. Can transaction value be predicted using available sales and customer/order characteristics?

---

## 📊 Dataset

The dataset contains **149,116 retail transactions** from three NYC coffee shop branches between January and June 2023.

### Key Variables

| Variable | Description |
|---|---|
| `transaction_id` | Unique transaction identifier |
| `transaction_date` | Date of the transaction |
| `transaction_time` | Time of the transaction |
| `transaction_qty` | Number of items purchased |
| `store_id` | Unique store identifier |
| `store_location` | NYC store location |
| `product_id` | Unique product identifier |
| `unit_price` | Price per unit |
| `product_category` | Broad product category |
| `product_type` | Product type |
| `product_detail` | Detailed product description |

---

# 🔄 Analytical Workflow

## Week 1 — Data Cleaning & Preprocessing

The first stage focused on preparing the transaction data for statistical analysis.

### Data Quality

- Performed a missingness audit.
- Confirmed **100% data completeness**.
- Reviewed variable types and distributions.
- Identified potential outliers in pricing variables.

### Outlier Treatment

Extreme values were treated using **Tukey's IQR-based Winsorization**.

The `unit_price` variable was capped at approximately **$5.63** to reduce the influence of extreme observations while retaining the underlying transaction information.

### Feature Engineering

The preprocessing workflow included:

- Z-score standardization for numerical variables.
- Categorical variable preparation.
- One-hot encoding using a **k − 1 dummy-variable approach**.
- Creation of analysis-ready variables for statistical modeling.

---

# 📈 Week 2 — Exploratory Data Analysis

The exploratory analysis focused on identifying patterns in sales volume, revenue, product categories, locations, and time.

## ⏰ Peak Ordering Period

The analysis identified a strong morning ordering pattern.

The **7:00 AM–10:00 AM period accounted for approximately 42.6% of transaction volume**.

### Business Implication

Coffee shop managers could use this insight to:

- Optimize staffing during morning hours.
- Ensure sufficient inventory before the morning rush.
- Improve queue and order-processing efficiency.
- Promote breakfast and coffee bundles during high-traffic periods.

---

## 📅 Revenue Trend

Revenue increased substantially during the six-month period.

The analysis identified approximately **103.8% growth in top-line revenue** from the beginning to the end of the study period.

This suggests a strong upward sales trajectory and highlights the importance of understanding the factors driving month-over-month growth.

---

## ☕ Product Category Performance

Coffee and Tea were the dominant contributors to sales.

Together, these categories accounted for approximately **66.7% of gross sales**.

### Business Implication

Core beverage products represent a major revenue driver and should receive particular attention when making decisions around:

- Inventory planning
- Product promotions
- Pricing
- Upselling
- Seasonal campaigns

---

# 📊 Week 3 — Statistical Hypothesis Testing

The project applies statistical testing to determine whether observed differences in sales behavior are statistically meaningful.

## 1. One-Way ANOVA — Store Price Differences

### Research Question

> Does average transaction pricing differ significantly across store locations?

A **One-Way ANOVA** was conducted to compare transaction-level pricing across the three NYC locations.

### Result

- **F-statistic = 121.81**
- **p-value < 0.001**

The result indicates a **statistically significant difference** in transaction pricing across locations.

### Business Interpretation

Location appears to be associated with differences in transaction value.

The analysis indicates that **Lower Manhattan commands a higher transaction-value premium**, suggesting that location-specific customer behavior and pricing dynamics may influence sales performance.

---

## 2. Welch Two-Sample t-Test — Weekday vs Weekend

### Research Question

> Is transaction value significantly different between weekdays and weekends?

A **Welch Two-Sample t-Test** was used to compare transaction values between weekday and weekend transactions.

### Result

**p-value = 0.7025**

Since the p-value is greater than 0.05, there is insufficient statistical evidence to conclude that average transaction value differs between weekdays and weekends.

### Business Interpretation

Although sales volume may vary by day, the **average transaction value appears relatively stable across weekday and weekend periods**.

---

# 🤖 Predictive Modeling

## Multiple Linear Regression

A **Multiple Linear Regression (OLS)** model was developed to investigate which factors help explain transaction value.

### Model Setup

- **80% of observations:** Training data
- **20% of observations:** Testing data

### Model Performance

| Metric | Result |
|---|---:|
| R² | **0.5091** |
| RMSE | **$1.49** |

The model explains approximately **50.9% of the variation in transaction value**.

The out-of-sample RMSE of approximately **$1.49** indicates the typical magnitude of prediction error on the transaction-value scale.

### Interpretation

The model demonstrates meaningful predictive capability while also showing that transaction-level spending is influenced by factors not fully captured by the available variables.

---

# 💡 Key Business Insights

### 1. Morning hours are critical

The **7 AM–10 AM period represents approximately 42.6% of transaction volume**.

**Recommendation:** Align staffing, inventory, and operational capacity with morning demand.

### 2. Revenue shows strong growth

Revenue increased approximately **103.8%** over the six-month period.

**Recommendation:** Investigate the operational and product factors contributing to this growth and determine whether the trend can be sustained.

### 3. Coffee and Tea dominate sales

Together, Coffee and Tea represent approximately **66.7% of gross sales**.

**Recommendation:** Prioritize these categories for inventory planning, promotions, and cross-selling strategies.

### 4. Store location matters

The ANOVA results show statistically significant pricing differences across locations.

**Recommendation:** Consider location-specific pricing, promotions, and customer segmentation rather than applying identical strategies across all branches.

### 5. Weekday and weekend transaction values are similar

The Welch t-test produced a **p-value of 0.7025**, providing no statistically significant evidence of a difference in average transaction value.

**Recommendation:** Focus weekend strategies on increasing **traffic or transaction frequency**, rather than assuming customers necessarily spend less per transaction.

---

# 🛠️ Tools & Technologies

### Programming Language

- **R 4.6+**

### R Packages

- `tidyverse` — Data manipulation and analysis
- `ggplot2` — Data visualization
- `lubridate` — Date and time manipulation
- `caret` — Machine learning and model evaluation
- `fastDummies` — Dummy-variable creation
- `scales` — Visualization formatting
- `car` — Statistical testing and regression diagnostics
- `rmarkdown` — Reproducible reporting

### Deliverables

- 📁 R analysis scripts
- 📊 Exploratory analysis
- 📄 Statistical analysis report
- 📑 Executive Word report
- 📽️ PowerPoint presentation

---

# 📂 Repository Structure

```text
nyc-coffee-shop-sales-analytics-or-coffee-shop-r-analysis/
│
├── Dataset/
│   └── Coffee Shop Sales dataset
│
├── R/
│   └── R analysis scripts
│
├── Images/
│   └── Analysis visualizations
│
├── PPT/
│   └── Executive presentation
│
├── Word/
│   └── Analytical reports
│
└── README.md
