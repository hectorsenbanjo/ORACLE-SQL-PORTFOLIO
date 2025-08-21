# Updating IT Programmer Salaries in a Table Copy

This demo shows how to create a working copy of a table and update specific rows. We use the **HR schema** `employees` table, clone it, and then update all employees with the job role `IT_PROG` so their salary becomes `50,000`.

We start by creating a duplicate of the `employees` table. This protects the original data while we test our updates.

CREATE TABLE employees_copy AS 
SELECT * 
FROM employees;
👉 This is called CTAS (Create Table As Select). It copies both the structure and the data, but not constraints (no primary key, foreign keys, etc.).

Next, we target all employees with the job role IT_PROG and set their salary to a fixed value.

UPDATE employees_copy  
SET salary = 50000
WHERE job_id = 'IT_PROG';
Only rows with job_id = 'IT_PROG' are affected, and their salary is overwritten with 50,000.

To confirm the update worked, we query the modified rows:

SELECT employee_id, last_name, job_id, salary
FROM employees_copy
WHERE job_id = 'IT_PROG';

This should return all IT programmers from the copy, now showing the updated salary.
