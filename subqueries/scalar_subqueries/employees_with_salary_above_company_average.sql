/*
   Story:
   HR wants to find employees whose salary is greater than the average salary 
   of all employees in the company.

   Approach:
   1. Calculate the average salary from the employees table.
   2. Compare each employee's salary to that average using a scalar subquery.
*/

SELECT first_name, 
       last_name, 
       job_id
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
);
