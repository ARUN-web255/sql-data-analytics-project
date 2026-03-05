-- =====================================================
-- FILE: 07_subqueries.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: SQL Subqueries and Nested Queries
-- TOTAL QUERIES: 18
-- =====================================================

-- 1. Employees earning more than the average salary
SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
);

-- 2. Second highest salary in the company
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary) FROM Employees
);

-- 3. Third highest salary
SELECT MAX(salary) AS third_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary) FROM Employees
    )
);

-- 4. Employees who work in the same department as 'Ravi'
SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Employees
    WHERE emp_name = 'Ravi'
);

-- 5. Employees earning more than their department average
SELECT e.emp_name, e.salary
FROM Employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 6. Customers who have placed at least one order
SELECT customer_name
FROM Customers c
WHERE (
    SELECT COUNT(o.order_id)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
) > 0;

-- 7. Customers with more than one order
SELECT customer_name
FROM Customers c
WHERE (
    SELECT COUNT(o.order_id)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
) > 1;

-- 8. Products that were never ordered
SELECT product_name
FROM Products p
WHERE (
    SELECT COUNT(oi.product_id)
    FROM Order_Items oi
    WHERE oi.product_id = p.product_id
) = 0;

-- 9. Departments with average salary greater than 60000
SELECT dept_name
FROM Departments d
WHERE (
    SELECT AVG(salary)
    FROM Employees e
    WHERE e.dept_id = d.dept_id
) > 60000;

-- 10. Employees who earn more than their manager
SELECT e.emp_name
FROM Employees e
JOIN Employees m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- 11. Department with the highest salary expense
SELECT dept_name
FROM Departments d
WHERE (
    SELECT SUM(e.salary)
    FROM Employees e
    WHERE e.dept_id = d.dept_id
) = (
    SELECT MAX(total_salary)
    FROM (
        SELECT SUM(salary) AS total_salary
        FROM Employees
        GROUP BY dept_id
    ) AS dept_totals
);

-- 12. Customers who have not placed any orders
SELECT customer_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);

-- 13. Products whose price is greater than average price
SELECT product_name, price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);

-- 14. Employees hired after the earliest hire date
SELECT emp_name, hire_date
FROM Employees
WHERE hire_date > (
    SELECT MIN(hire_date)
    FROM Employees
);

-- 15. Departments with at least one employee
SELECT dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.dept_id = d.dept_id
);

-- 16. Customers whose city also has employees
SELECT customer_name
FROM Customers
WHERE city IN (
    SELECT city
    FROM Employees
);

-- 17. Products with sales quantity greater than average
SELECT p.product_name
FROM Products p
WHERE (
    SELECT SUM(quantity)
    FROM Order_Items oi
    WHERE oi.product_id = p.product_id
) > (
    SELECT AVG(quantity)
    FROM Order_Items
);

-- 18. Employees earning above company average
SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
