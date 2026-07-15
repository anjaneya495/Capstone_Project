# 📊 Brazilian E-Commerce (Olist) SQL Capstone Project

Welcome to my Capstone Project analyzing the **Olist Brazilian E-Commerce Dataset**. This project involves building a fully relational database from raw CSV files in PostgreSQL, resolving critical data loading bottlenecks, and conducting an Exploratory Data Analysis (EDA) to solve real-world business problems.

---

## 🛠️ Project Structure

The codebase is organized into modular SQL scripts to ensure clean deployment and readable analysis:

* **`setup.sql`**: Drops old schemas, creates all 9 relational tables with proper data types (including coordinate overflow fixes), and imports raw data.
* **`01_sales_analysis.sql`**: Examines top-earning categories, Average Order Values (AOV), and monthly sales growth.
* **`02_logistics_analysis.sql`**: Measures delivery times against estimates and maps state-by-state shipping costs.
* **`03_customer_behavior.sql`**: Investigates customer loyalty (repeat purchases) and payment type preferences.
* **`04_satisfaction_analysis.sql`**: Analyzes the distribution of customer review scores and how delays impact ratings.

---

## 📈 Core Business Questions Answered

### 1. Sales & Revenue Performance
* **Top Categories:** Identifies which product categories generate the highest total revenue versus total units sold.
* **Average Order Value (AOV):** Calculates how much an average customer spends per order.
* **Monthly Sales Timeline:** Measures order volume changes month-over-month.

### 2. Logistics & Delivery Efficiency
* **Actual vs. Estimated Delivery Times:** Compares expected delivery times with actual customer delivery dates.
* **State-by-State Freight Costs:** pinpoints which Brazilian states are the most expensive to ship to.

### 3. Customer Behavior & Loyalty
* **Repeat Buyers:** Calculates the ratio of one-time shoppers versus loyal, repeat customers.
* **Preferred Payment Methods:** Ranks payment types (Credit Card, Boleto, Voucher, Debit) by popularity and revenue generation.

### 4. Customer Satisfaction Analysis
* **Review Score Distribution:** Shows the overall rating profile of the platform.
* **The "Delay Penalty":** Calculates the direct mathematical relationship between shipping delays (in days) and customer rating drops.

---

## 💻 Setup and Installation

### Prerequisites
* **PostgreSQL** installed locally.
* **VS Code** with the PostgreSQL extension (or any SQL GUI client like pgAdmin).

### Step-by-Step Run Guide

1. **Create the Database**
   Open your database tool and run:
   ```sql
   CREATE DATABASE capstone_sql_olist;