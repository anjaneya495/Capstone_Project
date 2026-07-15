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

## 📈 Core Business Questions Answered & Key Findings

Below are the actual data tables and analytical insights produced directly by the modular SQL analysis scripts:

### 1. Sales & Revenue Performance (`01_sales_analysis.sql`)
* **Top Categories by Revenue:** Identifies which product categories generate the highest total revenue versus total units sold.
* **Average Order Value (AOV):** Calculates how much an average customer spends per order.
* **Monthly Sales Timeline:** Tracks overall orders month-over-month to view seasonal trends.

#### Data Preview: Top 10 Product Categories by Revenue
| Product Category | Total Revenue (BRL) | Items Sold |
| :--- | :---: | :---: |
| health_beauty | $1,258,681.34 | 9,670 |
| watches_gifts | $1,205,005.68 | 5,991 |
| bed_bath_table | $1,036,988.68 | 11,115 |
| sports_leisure | $988,048.97 | 8,641 |
| computers_accessories | $911,954.32 | 7,827 |
| furniture_decor | $729,762.49 | 8,334 |
| cool_stuff | $635,290.85 | 3,796 |
| housewares | $632,248.66 | 6,964 |
| auto | $592,720.11 | 4,235 |
| garden_tools | $485,256.46 | 4,347 |

> **Key Insight:** While `bed_bath_table` sold the most individual units (11,115), `health_beauty` generated the highest overall revenue ($1.25M) due to a higher average unit price.

---

### 2. Logistics & Delivery Efficiency (`02_logistics_analysis.sql`)
* **Actual vs. Estimated Delivery Times:** Compares expected delivery times with actual customer delivery dates.
* **State-by-State Freight Costs:** Pinpoints which Brazilian states have the most expensive average shipping rates.

#### Data Preview: Delivery Timeline Performance
| Metric | Average Days |
| :--- | :---: |
| Actual Shipping Delivery Time | 12.1 Days |
| Predicted Estimated Delivery Time | 23.4 Days |

> **Key Insight:** On average, Olist heavily over-estimates its shipping timelines, delivering orders approximately **11.3 days earlier** than the date promised to customers.

---

### 3. Customer Behavior & Loyalty (`03_customer_behavior.sql`)
* **Repeat Buyers:** Calculates the ratio of one-time shoppers versus loyal, repeat customers.
* **Preferred Payment Methods:** Ranks payment types by transaction popularity and total sales volume.

#### Data Preview: Customer Order Frequency
| Orders Placed | Total Customers | Percentage of Customer Base |
| :---: | :---: | :---: |
| 1 | 93,099 | 96.88% |
| 2 | 2,745 | 2.86% |
| 3 | 203 | 0.21% |
| 4 | 30 | 0.03% |
| 5+ | 19 | 0.02% |

> **Key Insight:** An overwhelming **96.88% of Olist's customer base** are one-time purchasers, showcasing a major strategic opportunity for retention marketing campaigns.

---

### 4. Customer Satisfaction Analysis (`04_satisfaction_analysis.sql`)
* **Review Score Distribution:** Displays the overall satisfaction profile of the marketplace.
* **The "Delay Penalty":** Calculates the direct correlation between shipping delays (in days) and customer ratings.

#### Data Preview: Review Score Distribution
| Review Score | Review Count | Percentage of Total |
| :---: | :---: | :---: |
| ⭐⭐⭐⭐⭐ (5) | 57,328 | 57.78% |
| ⭐⭐⭐⭐ (4) | 19,142 | 19.29% |
| ⭐⭐⭐ (3) | 8,179 | 8.24% |
| ⭐⭐ (2) | 3,151 | 3.18% |
| ⭐ (1) | 11,424 | 11.51% |

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

1.Connect to the Database

Ensure your active connection inside VS Code is pointed to capstone_sql_olist.

2.Run the Setup Script

Execute setup.sql to build the schemas and load the CSV datasets.
(Note: Verify the file paths inside the COPY commands match where your local CSV files are located).

3.Run the Analytical Modules

Open and execute any of the numerical analysis scripts (01_ through 04_) to query the live data!