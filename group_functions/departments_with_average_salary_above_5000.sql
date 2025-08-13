/*
   Story:
   Management wants to identify departments where the average employee salary 
   is greater than 5,000.

   Approach:
   1. Group employees by department_id.
   2. Use AVG(salary) to calculate each department's average salary.
   3. Use HAVING to filter only departments whose average salary exceeds 5,000.
*/

SELECT department_id, 
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;
