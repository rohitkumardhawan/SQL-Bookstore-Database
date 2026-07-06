

# 📚 Online Book Store SQL Project

A complete SQL-based database project that simulates an online bookstore. This project demonstrates database design, data analysis, schema creation, joins, aggregation, filtering, sorting, and business reporting using **PostgreSQL**.

---

## 📌 Project Overview

This project was built to practice real-world SQL concepts by creating and analyzing an Online Book Store database.

The database stores information about:

* 📖 **Books**: Details of available titles, authors, genres, pricing, publish year and stock.
* 👥 **Customers**: Customer profiles including contact information and location.
* 🛒 **Orders**: Transaction records linking customers to books with timestamps and purchase details.

Using targeted SQL queries, the project answers common business questions such as best-selling genres, customer purchasing behavior, revenue analysis, and inventory insights.

---

## 🗂️ Database Schema

### 📚 Books Table

| Column | Type | Description |
| --- | --- | --- |
| `Book_ID` | INT (PK) | Unique Book ID |
| `Title` | VARCHAR(100) | Book Title |
| `Author` | VARCHAR(100) | Author Name |
| `Genre` | VARCHAR(100) | Book Category |
| `Published_Year` | INT | Year Published |
| `Price` | NUMERIC(10,2) | Book Price |
| `Stock` | INT | Available Stock |

### 👥 Customers Table

| Column | Type | Description |
| --- | --- | --- |
| `Customer_ID` | INT | Unique Customer ID |
| `Name` | VARCHAR(100) | Customer Name |
| `Email` | VARCHAR(100) | Email Address |
| `Phone` | INT / VARCHAR | Contact Number |
| `City` | VARCHAR(100) | Customer City |
| `Country` | VARCHAR(100) | Customer Country |

### 🛒 Orders Table

| Column | Type | Description |
| --- | --- | --- |
| `Order_ID` | INT | Unique Order ID |
| `Customer_ID` | INT | Customer Reference ID |
| `Book_ID` | INT | Book Reference ID |
| `Order_Date` | DATE | Purchase Date |
| `Quantity` | INT | Quantity Purchased |
| `Total_Amount` | NUMERIC(10,2) | Total Order Value |

---

## 🛠️ Technologies Used

* **Database Management System:** PostgreSQL
* **Language:** SQL
* **Data Format:** CSV Dataset (for population)
* **Version Control:** Git & GitHub

## 📂 Project Structure

```text
Online-Book-Store-SQL/
│
├── Online Book Store.sql   # SQL scripts for database creation & business analysis
├── Books.csv               # Book records dataset
├── Customers.csv           # Customer profiles dataset
├── Orders.csv              # Order transaction logs dataset
└── README.md               # Project documentation

```

---

## 📊 SQL Concepts Covered

* **Data Definition Language (DDL):** `CREATE TABLE`, `DROP TABLE`
* **Basic Retrieval:** `SELECT`, `WHERE` clause, `ORDER BY`, `LIMIT`
* **Data Aggregation:** `GROUP BY`, `HAVING`, `SUM()`, `AVG()`, `COUNT()`, `COALESCE()`
* **Advanced Joins:** `JOINS` `INNER JOIN`, `LEFT JOIN`,
* **Data Filtering & Filtering Ranges:** `BETWEEN`, Subqueries

---

## 📈 Business Questions Solved

### 🔹 Core Analytical Queries Included:

1. **Genre Sales Analysis:** Retrieve the total number of books sold per genre.
2. **Pricing Insights:** Calculate the average book price in the 'Fantasy' genre.
3. **Customer Retention:** List customers who have placed at least 2 orders.
4. **Order Patterns:** Show orders placed specifically in November 2023.
5. **Inventory Check:** Retrieve the total stock of books available across the store.
6. **Premium Books:** Find the details of the most expensive book.
7. **Stock Reconciliation:** Calculate remaining stock after fulfilling all orders.
8. **Geographical Targeting:** List all customers located in Canada.
9. **Historical Data:** Find all books published after the year 1950.

---

## 🎯 Learning Outcomes

Through this project, I strengthened my understanding of:

* Relational Database Design & Setup.
* Formulating optimized SQL queries to address specific business operational problems.
* Harnessing Aggregate Functions to create structural insights out of row-level transaction logs.
* Joining disparate transaction data tables together seamlessly.

---

## 📌 Future Improvements

* Add strict `FOREIGN KEY` constraints to explicitly maintain referential integrity.
* Create standard business `VIEWS` for frequently evaluated reports.
* Develop `Stored Procedures` and `Triggers` to automatically handle transaction stock updates.
* Integrate advanced `Window Functions` for running totals and rankings.
* Build a dashboard integration using Power BI or Tableau.

---

## 👤 About This Project

This project is a core piece of my SQL portfolio demonstrating practical database skills applicable for Data Analytics, Business Intelligence, and Data Analyst roles.

If you find this project helpful or interesting, please consider giving it a ⭐ on GitHub!

---
