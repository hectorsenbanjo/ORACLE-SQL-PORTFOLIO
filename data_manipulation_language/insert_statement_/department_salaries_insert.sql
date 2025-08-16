-- Insert aggregated salaries by department into department_salaries table.
-- This uses FULL OUTER JOIN to ensure we capture:
--  1. Departments with no employees
--  2. Employees without an assigned department

INSERT INTO department_salaries (department, staff, salaries)
SELECT
    COALESCE(d.department_name, 'Unassigned') AS department,
    COUNT(e.employee_id) AS staff,
    SUM(COALESCE(e.salary, 0)) AS salaries
FROM hr.employees e
FULL OUTER JOIN hr.departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
