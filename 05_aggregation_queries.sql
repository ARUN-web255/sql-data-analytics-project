-- =====================================================
-- FILE: 05_aggregation_queries.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: Aggregation and grouping queries
-- TOTAL QUERIES: 18
-- =====================================================

-- 1. Count total number of employees
SELECT COUNT(emp_id) AS total_employees
FROM Employees;

-- 2. Calculate average employee salary
SELECT AVG(salary) AS average_salary
FROM Employees;

-- 3. Find highest employee salary
SELECT MAX(salary) AS highest_salary
FROM Employees;

-- 4. Find lowest product price
SELECT MIN(price) AS lowest_price
FROM Products;

-- 5. Count total customers
SELECT COUNT(customer_id) AS total_customers
FROM Customers;

-- 6. Count orders by status
SELECT status, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY status;

-- 7. Calculate total salary expense
SELECT SUM(salary) AS total_salary_expense
FROM Employees;

-- 8. Count products in each category
SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category;

-- 9. Count customers in each city
SELECT city, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY city;

-- 10. Departments with more than 5 employees
SELECT dept_id, COUNT(emp_id) AS employee_count
FROM Employees
GROUP BY dept_id
HAVING COUNT(emp_id) > 5;

-- 11. Average salary per department
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id;

-- 12. Total salary per department
SELECT dept_id, SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id;

-- 13. Maximum salary per department
SELECT dept_id, MAX(salary) AS max_salary
FROM Employees
GROUP BY dept_id;

-- 14. Minimum salary per department
SELECT dept_id, MIN(salary) AS min_salary
FROM Employees
GROUP BY dept_id;

-- 15. Departments where average salary > 60000
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;

-- 16. Count total orders placed by each customer
SELECT customer_id, COUNT(order_id) AS order_count
FROM Orders
GROUP BY customer_id;

-- 17. Find total quantity sold per product
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM Order_Items
GROUP BY product_id;

-- 18. Find products sold more than 2 times
SELECT product_id, SUM(quantity) AS total_sold
FROM Order_Items
GROUP BY product_id
HAVING SUM(quantity) > 2;
