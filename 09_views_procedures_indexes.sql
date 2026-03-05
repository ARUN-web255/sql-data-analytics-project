-- =====================================================
-- FILE: 09_views_procedures_indexes.sql
-- PROJECT: SQL Data Analytics Project
-- DESCRIPTION: Views, Indexes, Stored Procedures, Functions
-- TOTAL QUERIES: 10
-- =====================================================

-- 1. Create a view to show employees with their departments
CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Departments d 
ON e.dept_id = d.dept_id;


-- 2. Create a view showing total purchase amount per customer
CREATE VIEW customer_total_purchase AS
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_purchase
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id
JOIN Order_Items oi 
ON o.order_id = oi.order_id
JOIN Products p 
ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;


-- 3. Query the employee_department_view
SELECT * FROM employee_department_view;


-- 4. Create index on employee name for faster search
CREATE INDEX idx_emp_name
ON Employees(emp_name);


-- 5. Create composite index for customer orders
CREATE INDEX idx_customer_order
ON Orders(customer_id, order_date);


-- 6. Drop index example
DROP INDEX idx_emp_name ON Employees;


-- 7. Stored procedure to get all employees
DELIMITER $$

CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * FROM Employees;
END $$

DELIMITER ;


-- 8. Stored procedure to get employees by department
DELIMITER $$

CREATE PROCEDURE get_employees_by_dept(IN dept INT)
BEGIN
    SELECT *
    FROM Employees
    WHERE dept_id = dept;
END $$

DELIMITER ;


-- 9. Function to calculate yearly salary
DELIMITER $$

CREATE FUNCTION yearly_salary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END $$

DELIMITER ;


-- 10. Example usage of yearly salary function
SELECT emp_name,
       salary,
       yearly_salary(salary) AS yearly_salary
FROM Employees;
