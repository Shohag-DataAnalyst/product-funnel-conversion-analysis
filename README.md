<p align="center">
  <img src="https://img.shields.io/badge/Skills-SQL-blue?style=for-the-badge" alt="SQL">
  <img src="https://img.shields.io/badge/Tool-Power%20BI-yellow?style=for-the-badge" alt="Power BI">
  <img src="https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge" alt="PostgreSQL">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge" alt="Completed">
</p>

---

# Product Funnel & Monetization Analysis Dashboard

End-to-end **Product Funnel, Conversion, and Monetization** analysis built using **PostgreSQL** and **Power BI**, designed to simulate real-world product analytics used by growth, product, and business teams.

---

## 📌 Project Overview

This project analyzes a **full user lifecycle funnel** — from first visit to paid subscription — to understand:

- Where users drop off
- How fast users move through the funnel
- Which stages drive paid conversion
- How revenue and monetization differ by plan
- Behavioral differences between paid and free users

The dashboard is structured to support **product decision-making**, **growth optimization**, and **revenue strategy** in a SaaS-style product environment.

---

## ❓ Business Questions Answered

- How many users reach each funnel stage?
- What is the overall **activation rate** and **paid conversion rate**?
- How long does it take users to move between funnel stages?
- Which stages cause the biggest drop-offs?
- How does funnel speed differ between **paid vs free users**?
- Which subscription plans generate the most revenue?
- What is the churn rate and average subscriber tenure?

---

## 🛠 Tools & Technologies

- **PostgreSQL** – Data modeling, funnel aggregation, conversion metrics
- **Power BI** – Interactive dashboards & storytelling
- **DAX** – Funnel KPIs, conversion rates, time-based metrics
- **Excel** – Initial dataset preparation
- **Figma** – Dashboard layout & visual design planning

---

## 🧱 Dataset & Data Model

The project uses four core tables:

- `users` – User profile and acquisition data
- `events` – User event-level activity (visits, signup, onboarding, activation)
- `subscription` – Subscription, revenue, churn, and tenure data
- `user_funnel` – Flattened funnel table combining all lifecycle stages

These tables are joined using `user_id` and structured for efficient analytical querying.

---

## 📂 Project Structure
```
product-funnel-conversion-analysis/
│
├── sql/
│ └── funnel_analysis.sql
│
├── powerbi/
│ └── product_funnel_analysis.pbix
│
├── screenshots/
│ ├── funnel_overview.png
│ ├── monetization_overview.png
│ ├── user_behavior.png
│ ├── glossary.png
│
└── README.md
```

---

## 📊 Dashboards Included

### 1️⃣ Funnel Overview
- Total Users
- Signup Rate
- Activation Rate
- Paid Conversion Rate
- Median Days to Paid
- User Conversion Funnel
- Conversion Rate by Funnel Stage
- Average Time Between Funnel Stages

---

### 2️⃣ Revenue & Monetization
- Total Revenue (**$359K**)
- Paid Users (**854**)
- ARPU (**$420**)
- Average Monthly Price (**$56**)
- Churn Rate (**40%**)
- Subscriber Distribution by Plan
- Revenue Contribution by Plan
- Average Subscriber Tenure by Plan

---

### 3️⃣ Customer Behavior
- Paid vs Free User Distribution
- Funnel Speed Distribution (Paid vs Free)
- Funnel Conversion Trends Over Time
- Decomposition Tree: What Drives Funnel Conversion?

---

### 4️⃣ Glossary & Business Definitions
- Clear definitions of all funnel metrics
- Revenue & monetization terminology
- Conversion logic explanations
- Recommended business actions based on insights

---

## 🧮 Key DAX Measures

Below are the core measures that power the dashboard.  
The full DAX logic (26+ measures) is implemented inside the Power BI report.

```DAX
Total Users =
DISTINCTCOUNT(user_funnel[user_id])

Paid Users =
CALCULATE(
    DISTINCTCOUNT(user_funnel[user_id]),
    user_funnel[converted_to_paid] = 1
)

Activation Rate =
DIVIDE(
    [Activated Users],
    [Signed Up Users]
)

Paid Conversion Rate =
DIVIDE(
    [Paid Users],
    [Activated Users]
)

Median Days to Paid (Days) =
MEDIAN(user_funnel[days_signup_to_paid])

Total Revenue =
SUM(subscription[total_revenue])

ARPU =
DIVIDE(
    [Total Revenue],
    [Paid Users]
)

Churn Rate =
DIVIDE(
    [Churned Users],
    [Paid Users]
)
```

---

## 🚀 How to Run This Project

### ✅ Option 1 – Open Power BI Dashboard
1. Download `product_funnel_analysis.pbix`
2. Open using **Power BI Desktop**
3. Explore the dashboard using existing data model

---

### ✅ Option 2 – Rebuild Full SQL → Power BI Pipeline
1. Create PostgreSQL database:
  ```sql
CREATE DATABASE product_funnel;
```
2. Import CSV datasets:
  - users.csv
  - events.csv
  - subscription.csv
  - user_funnel.csv
3. Run SQL analysis script:
```sql
funnel_analysis.sql
```
4. Connect Power BI to PostgreSQL
5. Refresh data and explore insights

---

## 🎥 Dashboard Video Walkthrough

A short walkthrough showing how the **Product Funnel & Monetization Dashboard** works, including:
- Funnel overview and drop-off analysis
- Activation and paid conversion metrics
- Revenue & subscription insights
- Customer behavior comparison (Paid vs Free)
- Glossary and metric explanations

▶️ **Watch the dashboard demo video:**  
[Click here to view the video walkthrough](LINK_WILL_GO_HERE)

---

## 📸 Dashboard Screenshots

### Funnel Overview
![Overview](screenshots/overview.png)

### Revenue & Monetization
![Demand Forecast](screenshots/demand_forecast.png)

### Customer Behavior
![SKU Control](screenshots/sku_control.png)

### Glossary & Metric Definitions
![Glossary](screenshots/glossary.png)

---

## 📈 Key Insights & Findings

### 🔹 Funnel Performance
- **5,000 total users** entered the funnel
- **59% activation rate** (2,956 activated users)
- **29% paid conversion rate** (854 paid users)
- Median time to paid conversion is **164 days**

### 🔹 Revenue Insights
- Total revenue reached **$359K**
- **Enterprise plan** contributes the highest revenue
- Average Revenue Per User (ARPU) is **$420**
- Average subscriber tenure is **~7 months**

### 🔹 User Behavior
- Paid users tend to move slightly faster through the funnel
- Biggest drop-off occurs between **Activation → Paid**
- Funnel conversion rates remain relatively stable over time

---

## 📬 Contact

**Author:** Shohag  

If you’d like to discuss this project, collaborate, or talk about data analyst roles:

- 💼 LinkedIn: [NURA ALAM SHOHAG](https://www.linkedin.com/in/dataanalystshohag/)
- 🧑‍💻 GitHub: [Shohag-DataAnalyst](https://github.com/Shohag-DataAnalyst)
