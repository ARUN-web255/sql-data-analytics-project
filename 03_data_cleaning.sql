-- =====================================================
-- FILE: 03_data_cleaning.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: Data cleaning and modification queries
-- TOTAL QUERIES: 12
-- =====================================================

USE Data_Analytics;

-- 1. Update department for a specific employee
UPDATE Employees
SET dept_id = 1
WHERE emp_id = 18;

-- 2. Update manager for a specific employee
UPDATE Employees
SET manager_id = 4
WHERE emp_id = 18;

-- 3. Increase salary of all employees by 10%
UPDATE Employees
SET salary = salary * 1.10;

-- 4. Standardize city name for employees
UPDATE Employees
SET city = 'Bangalore'
WHERE emp_id = 11;

-- 5. Update order date for a specific order
UPDATE Orders
SET order_date = CURRENT_DATE()
WHERE order_id = 70;

-- 6. Replace NULL city values with 'Unknown'
UPDATE Employees
SET city = 'Unknown'
WHERE city IS NULL;

-- 7. Delete employees with extremely low salary
DELETE FROM Employees
WHERE salary < 20000;

-- 8. Delete orders with status 'Pending'
DELETE FROM Orders
WHERE status = 'Pending';

-- 9. Delete all records from Order_Items table
DELETE FROM Order_Items;

-- 10. Insert completed orders again using SELECT (data duplication test)
INSERT INTO Orders (order_id, customer_id, order_date, status)
SELECT order_id + 100, customer_id, order_date, status
FROM Orders
WHERE status = 'Completed';

-- 11. Remove duplicate employee records
DELETE e1
FROM Employees e1
JOIN Employees e2
ON e1.emp_name = e2.emp_name
AND e1.dept_id = e2.dept_id
AND e1.salary = e2.salary
AND e1.hire_date = e2.hire_date
AND e1.city = e2.city
AND e1.emp_id > e2.emp_id;

-- 12. Transaction example with rollback
START TRANSACTION;

UPDATE Employees
SET city = 'TestCity'
WHERE emp_id = 5;

ROLLBACK;
