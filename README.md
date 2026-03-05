## Project Overview
This project demonstrates SQL skills for data analysis including database design, data cleaning, joins, aggregations, and business insights.

## Dataset
The dataset simulates a retail company with:
- 60 Employees
- 60 Customers
- 40 Products
- 70 Orders
- 80 Order Items

## Database Relationships
This project uses a normalized relational database with the following relationships:

- **Departments → Employees**  
  One department can have many employees, but each employee belongs to only one department.

- **Customers → Orders**  
  One customer can place many orders, but each order belongs to only one customer.

- **Orders → Order_Items**  
  One order can contain multiple products, so it can have many order items.

- **Products → Order_Items**  
  One product can appear in many different order items across multiple orders.

This normalized schema enables efficient analytical queries and revenue calculations.

## Skills Demonstrated
- SQL Joins
- Aggregation Functions
- Subqueries
- Business Analytics
- Views and Stored Procedures
- Index Optimization

## Business Questions Solved
This project answers real analytical questions such as:

1. Which products generate the highest revenue?
2. Who are the top spending customers?
3. Which cities generate the most orders?
4. What is the salary distribution across departments?
5. Which product categories drive the most sales?

These insights are generated using SQL joins, aggregations, and subqueries.

## Total Queries
150+ SQL queries across multiple analysis scenarios.
