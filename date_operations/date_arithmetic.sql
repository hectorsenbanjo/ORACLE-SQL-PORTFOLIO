-- Calculate probation end date as 30 days after hire date
SELECT employee_id, hire_date, hire_date + 30 AS probation_end
FROM employees;
