-- employees_basic_select.md
-- Purpose: Retrieve basic employee details from the HR schema.
-- Basic SELECT statements.
-- Tables used: employees

SELECT 
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date
FROM employees
ORDER BY last_name;

Notes:
Uses ORDER BY to sort by last_name.
