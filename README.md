# 📦 Supply Chain Analytics Dashboard (Snowflake + Sigma)

## 📊 Project Overview
This project analyzes supply chain performance using Snowflake for data storage and Sigma for visualization.

The dashboard provides insights into delivery delays, supplier performance, and fulfillment efficiency.

---

## ⚙️ Tech Stack
- Snowflake (Data Warehouse)
- Sigma Computing (Visualization)
- SQL (Data Modeling)

---

## 📈 Key Metrics
- Average Fulfillment Time
- Average Delivery Delay
- Supplier Performance Analysis
- Delivery Status Distribution

---

## 📸 Dashboard Preview
![Dashboard](screenshots/dashboard.png)

---

## 🧊 Snowflake SQL Transformations

Key SQL operations performed:

- Created fulfillment and delay metrics
- Built reusable analytics view (`SUPPLY_CHAIN_METRICS`)
- Performed supplier performance analysis

👉 [View SQL Queries](sql/supply_chain_queries.sql)

---

## 🚀 How to Run
1. Upload dataset to Snowflake
2. Run SQL script to create view
3. Connect Snowflake to Sigma
4. Build dashboard using metrics

---
