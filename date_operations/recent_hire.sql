-- Employees hired in the last 90 days
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= SYSDATE - 90;
