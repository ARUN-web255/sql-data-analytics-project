-- =====================================================
-- FILE: 04_basic_queries.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: Basic SQL SELECT queries
-- TOTAL QUERIES: 20
-- =====================================================

-- 1. Display all employees
SELECT * FROM Employees;

-- 2. Display all customers
SELECT * FROM Customers;

-- 3. Display all products
SELECT * FROM Products;

-- 4. Show employee names and cities
SELECT emp_name, city
FROM Employees;

-- 5. Show customers from Mumbai
SELECT customer_name, city
FROM Customers
WHERE city = 'Mumbai';

-- 6. Show completed orders
SELECT order_id, status
FROM Orders
WHERE status = 'Completed';

-- 7. Employees with salary greater than 60000
SELECT emp_name, salary
FROM Employees
WHERE salary > 60000;

-- 8. Products cheaper than 5000
SELECT product_name, price
FROM Products
WHERE price < 5000;

-- 9. Customers who signed up after 20 Jan 2024
SELECT customer_name, signup_date
FROM Customers
WHERE signup_date > '2024-01-20';

-- 10. Departments located in Chennai
SELECT dept_name, location
FROM Departments
WHERE location = 'Chennai';

-- 11. Orders placed on a specific date
SELECT order_id, order_date, status
FROM Orders
WHERE order_date = '2025-02-10';

-- 12. Employees sorted by salary (highest first)
SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC;

-- 13. Top 5 highest paid employees
SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- 14. List all customers alphabetically
SELECT customer_name
FROM Customers
ORDER BY customer_name ASC;

-- 15. Employees hired in the year 2023
SELECT emp_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 16. Orders that are Pending or Shipped
SELECT order_id, status
FROM Orders
WHERE status IN ('Pending','Shipped');

-- 17. Employees whose name starts with 'A'
SELECT emp_name
FROM Employees
WHERE emp_name LIKE 'A%';

-- 18. Customers from Chennai or Coimbatore
SELECT customer_name, city
FROM Customers
WHERE city IN ('Chennai','Coimbatore')
ORDER BY customer_name;

-- 19. Products sorted by price (highest first)
SELECT product_name, price
FROM Products
ORDER BY price DESC;

-- 20. Display 5 employees after skipping first 5
SELECT emp_name
FROM Employees
LIMIT 5 OFFSET 5;
