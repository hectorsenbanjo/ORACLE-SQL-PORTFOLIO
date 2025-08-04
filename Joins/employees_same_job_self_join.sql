-- employees_same_job_self_join.sql
-- Purpose: Find pairs of employees who share the same job in the HR schema.
-- OCA Objective: Self-join to compare rows within the same table.
-- Tables used: employees

SELECT 
    e1.job_id,
    e1.employee_id AS emp1_id,
    e1.first_name || ' ' || e1.last_name AS employee1,
    e2.employee_id AS emp2_id,
    e2.first_name || ' ' || e2.last_name AS employee2
FROM employees e1
JOIN employees e2 
    ON e1.job_id = e2.job_id
    AND e1.employee_id < e2.employee_id  -- avoid self-pairing and duplicates
ORDER BY e1.job_id, e1.employee_id, e2.employee_id;
