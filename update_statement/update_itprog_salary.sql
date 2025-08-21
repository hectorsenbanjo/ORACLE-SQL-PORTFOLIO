-- =====================================================
-- update_itprog_salary.sql
-- Demo: Updating rows in a copy of the employees table
-- Target: Set all IT_PROG salaries to 50,000
-- =====================================================

-- Step 1: Create a working copy of the employees table
CREATE TABLE employees_copy AS 
SELECT * 
FROM employees;

-- Step 2: Update salaries for IT programmers
UPDATE employees_copy  
SET salary = 50000
WHERE job_id = 'IT_PROG';

COMMIT;

-- Step 3: Verify the changes
SELECT employee_id, last_name, job_id, salary
FROM employees_copy
WHERE job_id = 'IT_PROG';
