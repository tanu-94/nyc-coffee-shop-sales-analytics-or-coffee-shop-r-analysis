# NYC Coffee Shop Sales: Retail Analytics & Predictive Modeling

An end-to-end data analytics and predictive modeling project built using **R**, analyzing **149,116 retail transactions** across three New York City branches (Astoria, Hell's Kitchen, and Lower Manhattan) from January to June 2023.

---

## 📌 Project Architecture & Weekly Deliverables

* **Week 1: Data Cleaning & Preprocessing**
  * Missingness audit ($100\%$ data completeness).
  * Outlier treatment via **Tukey's IQR Winsorization** (capped unit price at $\$5.63$).
  * Feature scaling ($z$-score standardization) and $k-1$ one-hot dummy encoding.
* **Week 2: Exploratory Data Visualization & Footfall Analysis**
  * Discovered the **7:00 AM – 10:00 AM** peak ordering rush ($42.6\%$ volume share).
  * Evaluated 6-month revenue trajectory showing **$+103.8\%$** top-line growth.
  * Category revenue decomposition confirming Coffee and Tea capture **$66.7\%$** of gross sales.
* **Week 3: Statistical Hypothesis Testing & Predictive Modeling**
  * **One-Way ANOVA:** Verified significant location price disparities ($F = 121.81, p < 0.001$), with Lower Manhattan capturing a ticket premium.
  * **Two-Sample Welch $t$-Test:** Confirmed transaction value invariance across weekdays vs. weekends ($p = 0.7025$).
  * **Multiple Linear Regression (OLS):** Trained on 80% partition; achieved **$R^2 = 0.5091$** and **$\text{RMSE} = \$1.49$** out-of-sample.
* **Week 4: Executive Reporting & Presentation**
  * Consolidated technical documentation and editable executive PowerPoint deck (`.pptx`).

---

## 🛠️ Tech Stack & Packages
* **Language:** R (v4.6+)
* **Libraries:** `tidyverse`, `ggplot2`, `lubridate`, `caret`, `fastDummies`, `scales`, `car`, `rmarkdown`
* **Deliverables:** R Scripts, Word Reports (`.docx`), Presentation (`.pptx`)

---
