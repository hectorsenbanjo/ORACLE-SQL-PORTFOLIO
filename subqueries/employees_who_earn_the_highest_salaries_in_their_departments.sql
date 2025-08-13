/*
   Story:
   HR wants a list of employees who earn the highest salary in their respective departments.
   Some departments may have more than one top earner if salaries are tied.

   Approach:
   1. Use GROUP BY and MAX(salary) to find the highest salary per department.
   2. Use tuple comparison (department_id, salary) to match employees who earn that max salary.
*/

SELECT employee_id, 
       first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE (department_id, salary) IN (
    SELECT department_id, MAX(salary)
    FROM employees
    GROUP BY department_id
)
ORDER BY department_id;
