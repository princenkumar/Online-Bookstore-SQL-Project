# Online Bookstore (SQL Project)

📚 **Overview**  
This project demonstrates a simple relational database design for an online bookstore. It includes SQL table creation, CSV import commands, and analytical queries to explore book inventory, customer orders, and sales metrics.

---

## 🧩 Schema
**Tables created:**
- `Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)`
- `Customers(Customer_ID, Name, Email, Phone, City, Country)`
- `Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)`

---

## ⚙️ How to run
1. Create database (e.g., `CREATE DATABASE OnlineBookstore;`)  
2. Run `Online_Book_Store.sql` in your SQL client (PostgreSQL / MySQL).  
3. Use the `COPY` commands (or `LOAD DATA INFILE` for MySQL) to import `Books.csv`, `Customers.csv`, and `Orders.csv`.  
4. Execute the provided SELECT and analytical queries.

---

## 🔎 Queries included
- Retrieve books by genre, books published after a year  
- Customer filters by country  
- Orders in a date range (e.g., Nov 2023)  
- Total stock, most expensive book, books ordered >1 quantity  
- Revenue calculation, top books by orders, author sales, customer spend analysis  
- Stock remaining after fulfilling orders

---

## 🗂 Files
| File Name | Description |
|-----------|-------------|
| `Online_Book_Store.sql` | SQL code: create tables, COPY commands, and queries |
| `Books.csv` | Sample books dataset |
| `Customers.csv` | Sample customers dataset |
| `Orders.csv` | Sample orders dataset |
| `Online-Bookstore-Report.pdf` | Short project report (optional) |

---

## 👨‍💻 About
**Created by:** Prince Kumar  
_Data Analyst | SQL | Excel_  
📧 princeyadav841412@gmail.com
