/*
   Story:
   Find all employees who have both the same department 
   AND the same salary as employees with IDs 103, 105, or 110.

   Improvement:
   Instead of writing two separate IN subqueries (one for department, one for salary),
   we can use a tuple comparison: (department_id, salary) IN (...)
*/

SELECT employee_id, 
       first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE (department_id, salary) IN (
    SELECT department_id, salary
    FROM employees
    WHERE employee_id IN (103, 105, 110)
);
