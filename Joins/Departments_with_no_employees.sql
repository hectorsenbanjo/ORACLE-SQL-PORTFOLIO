-- departments_with_no_employees.sql
-- Purpose: Find departments in the HR schema that currently have no employees assigned.
-- OCA Objective: Joins / anti-join patterns (detecting missing related rows).
-- Tables used: departments, employees

SELECT 
    d.department_id,
    d.department_name,
    d.location_id
FROM departments d
LEFT JOIN employees e 
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL
ORDER BY d.department_id;
