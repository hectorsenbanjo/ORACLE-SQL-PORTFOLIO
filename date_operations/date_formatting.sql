-- Format hire date in a more readable way
SELECT employee_id, TO_CHAR(hire_date, 'Month DD, YYYY') AS formatted_hire_date
FROM employees;
