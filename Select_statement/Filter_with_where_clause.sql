-- filter_with_where.sql
-- Purpose: Retrieve employees from the HR schema who work in department 90.
-- Tables used: employees

SELECT 
    employee_id,
    first_name,
    last_name,
    department_id,
    salary
FROM employees
WHERE department_id = 90
ORDER BY last_name;

*Purpose:**  
Demonstrate how to use the `WHERE` clause to filter rows from a table in the HR schema.
