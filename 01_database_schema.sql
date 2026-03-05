-- =====================================================
-- FILE: 01_database_schema.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: Database creation and table schema setup
-- TOTAL QUERIES: 12
-- =====================================================


-- 1. Create Database
CREATE DATABASE Data_Analytics;


-- 2. Use Database
USE Data_Analytics;


-- 3. Create Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);


-- 4. Create Employees Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT,
    manager_id INT,
    salary BIGINT CHECK (salary > 0),
    hire_date DATE,
    city VARCHAR(50),

    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);


-- 5. Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    signup_date DATE
);


-- 6. Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0)
);


-- 7. Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


-- 8. Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),

    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


-- 9. Alter Employees Table – Add Email Column
ALTER TABLE Employees
ADD email VARCHAR(100);


-- 10. Rename Column emp_name to employee_name
ALTER TABLE Employees
RENAME COLUMN emp_name TO employee_name;


-- 11. Modify Salary Data Type
ALTER TABLE Employees
MODIFY salary BIGINT;


-- 12. Drop Email Column
ALTER TABLE Employees
DROP COLUMN email;
