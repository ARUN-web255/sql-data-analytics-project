-- =====================================================
-- FILE: 06_join_queries.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: SQL JOIN queries for relational analysis
-- TOTAL QUERIES: 24
-- =====================================================

-- 1. Employee with department name
SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 2. Employee with department location
SELECT e.emp_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 3. Customer orders with order date
SELECT c.customer_name, o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- 4. Order details with product names
SELECT o.order_id, p.product_name, oi.quantity
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
JOIN Orders o ON oi.order_id = o.order_id;

-- 5. Product sales with quantity
SELECT p.product_name, oi.quantity
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id;

-- 6. Customer purchases with products
SELECT c.customer_name, p.product_name, oi.quantity
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 7. Employee and manager names (Self Join)
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- 8. Departments with employee count
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 9. Total salary by department
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 10. Employees and department locations
SELECT e.emp_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 11. Orders with customer city
SELECT o.order_id, c.customer_name, c.city
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

-- 12. Products ordered with order dates
SELECT p.product_name, o.order_date
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
JOIN Orders o ON oi.order_id = o.order_id;

-- 13. Customers with total orders
SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- 14. Total quantity sold per product
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- 15. Employees with department name and location
SELECT e.emp_name, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 16. Orders with product names
SELECT o.order_id, p.product_name
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 17. Customers who ordered electronics products
SELECT c.customer_name, p.product_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.category = 'Electronics';

-- 18. Employee salary with department name
SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 19. Employees and their managers
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- 20. Departments without employees
SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 21. Customers with their orders
SELECT c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- 22. Orders with product quantity
SELECT o.order_id, oi.quantity
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id;

-- 23. Products that were ordered
SELECT DISTINCT p.product_name
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id;

-- 24. Employees with department salary totals
SELECT e.emp_name, SUM(e.salary) OVER(PARTITION BY e.dept_id) AS department_salary_total
FROM Employees e;
