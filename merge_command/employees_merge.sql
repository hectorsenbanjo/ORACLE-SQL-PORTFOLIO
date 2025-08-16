-- MERGE data from new_employees into employees
-- If a match is found (same employee_id), update the salary.
-- If no match is found, insert the new employee.

MERGE INTO employees e
USING new_employees n
ON (e.employee_id = n.employee_id)
WHEN MATCHED THEN
    UPDATE SET e.salary = n.salary
WHEN NOT MATCHED THEN
    INSERT (employee_id, last_name, salary, email, job_id)
    VALUES (n.employee_id, n.last_name, n.salary, n.email, n.job_id);

-- Confirm the results
SELECT *
FROM employees;

-- Example of clearing staging data:
-- TRUNCATE TABLE new_employees;
