# E-commerce Analytics Dashboard (SQL + Power BI)

## Overview

This project simulates an e-commerce business environment and focuses on analyzing sales performance, customer behavior, and product performance using SQL and Power BI.

The goal of this project is to demonstrate how raw transactional data can be transformed into meaningful insights that support business decision-making.

---

## Objectives

* Analyze overall sales performance
* Identify top-performing products
* Understand customer purchasing behavior
* Track revenue trends over time

---

## Tools Used

* SQL (PostgreSQL-style schema and queries)
* Microsoft Power BI (data visualization and dashboard creation)

---

## Data Model

The database is designed using a relational structure:

* **customers** → stores customer information
* **orders** → each order belongs to a customer
* **order_items** → bridge table linking orders and products
* **products** → product catalog with pricing

### Relationships:

* One customer → many orders
* One order → many order items
* One product → many order items

This design allows for flexible analysis of revenue, product sales, and customer activity.

---

## Key Metrics

* **Total Orders** → number of completed orders
* **Total Revenue** → total sales value (quantity × price)
* **Total Products Sold** → total units sold
* **Average Order Value (AOV)** → revenue per order

---

## Dashboard Features

* KPI cards for quick performance overview
* Daily revenue trend to identify peaks and patterns
* Units sold by product to track demand
* Revenue by product to evaluate profitability
* Top customers by revenue
* Interactive filters (customer and product slicers)

---

## Dashboard Preview

![Dashboard Preview](dashboard-preview.png)

---

## Key Insights

* Revenue peaks mid-month, indicating higher customer activity during that period
* A small number of customers contribute a significant portion of total revenue
* Headphones are the top-selling product by units sold

---

## Project Structure

* `schema.sql` → database schema and table relationships
* `data.sql` → sample data used for analysis
* `queries.sql` → SQL queries for analysis and validation
* `dashboard-preview.png` → Power BI dashboard screenshot
* `ecommerce-dashboard.pbit` / `.pbix` → Power BI project file

---

## What I Learned

* Designing a relational database with proper relationships
* Using SQL to transform and analyze transactional data
* Building clean, structured dashboards in Power BI
* Improving dashboard layout and readability for better user experience

---

## Future Improvements

* Add customer segmentation (high vs low value customers)
* Expand dataset to include multiple months for deeper trend analysis
* Include product categories for more advanced insights

---

## Author

Ernesto Villa
Aspiring Data Analyst focused on SQL, Power BI, and data-driven insights
