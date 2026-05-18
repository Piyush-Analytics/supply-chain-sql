# 📦 Supply Chain & Inventory Optimization (PostgreSQL)

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue)
![SQL](https://img.shields.io/badge/SQL-Advanced-orange)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Queries](https://img.shields.io/badge/Queries-42+-green)

## 📌 Overview
End-to-end Supply Chain & Inventory Optimization system built in PostgreSQL —
analysing stock levels, supplier performance, reorder alerts and order trends
using 42+ SQL queries across 6 complexity levels on a multi-table database
(suppliers, products, inventory, orders).

## 🔍 Key Findings
- Filing Cabinet and Standing Desk are critically low on stock
- TechSupply Co. is top supplier by spend with 4.5 rating
- Electronics category holds highest inventory value
- Several products flagged for immediate reorder
- Single source dependency risk identified for key products
- MegaSupplier has highest risk rating due to 21-day lead time

## 📊 Query Categories (42+ Queries)
| Section | Queries | Concepts |
|---------|---------|---------|
| Basic Exploration | 1-8 | SELECT, JOINs, GROUP BY, DATE functions |
| Inventory Analysis | 9-16 | Reorder alerts, turnover, overstock, days of stock |
| Supplier Performance | 17-24 | Scorecard, delivery performance, risk analysis |
| Window Functions | 25-32 | LAG, LEAD, RANK, NTILE, ROW_NUMBER, moving avg |
| Advanced CTEs | 33-40 | ABC analysis, reorder forecast, EXISTS, correlated |
| Export | 41-42 | COPY TO CSV |

## 🚨 Business Features Built
- **Reorder Alert System** — flags products below reorder point
- **ABC Analysis** — classifies products by value (A/B/C)
- **Supplier Scorecard** — rates suppliers by delivery, spend, rating
- **Stockout Forecast** — predicts when products will run out
- **Single Source Risk** — flags products with only one supplier
- **Supply Chain Health Report** — complete summary dashboard

## 🗄️ Database Schema


## 🛠️ SQL Concepts Covered
| Concept | Details |
|---------|---------|
| Joins | INNER, LEFT, self-referencing |
| Window Functions | ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, NTILE |
| CTEs | Simple, Multi-level, Correlated |
| Subqueries | EXISTS, NOT EXISTS, Correlated, Scalar |
| Aggregations | SUM, AVG, COUNT, MIN, MAX, STRING_AGG |
| Date Functions | DATE_TRUNC, INTERVAL, CURRENT_DATE |
| Export | COPY TO CSV |

## 📁 Project Structure


## 🚀 How to Run
1. Install PostgreSQL and pgAdmin
2. Create database: `supply_chain_db`
3. Run schema.sql to create tables and insert data
4. Run supply_chain_queries.sql section by section

## 💼 Resume Bullet Point
> "Built a Supply Chain & Inventory Optimization system in PostgreSQL —
> designed 4-table schema, wrote 42+ queries covering reorder alerts,
> ABC analysis, supplier scorecards, stockout forecasting and
> single-source dependency risk detection."
