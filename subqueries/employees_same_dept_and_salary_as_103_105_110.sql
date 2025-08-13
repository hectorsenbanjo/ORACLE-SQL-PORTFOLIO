/*
   Story:
   We want to find employees who work in the same department 
   AND earn the same salary as any of the employees with IDs 103, 105, or 110.

   Approach:
   1. First, find the department IDs of employees 103, 105, and 110.
   2. Then, find the salaries of these same employees.
   3. Use two separate IN subqueries in the WHERE clause 
      to filter employees matching both criteria.
*/

SELECT employee_id, 
       first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE department_id IN (
    SELECT department_id 
    FROM employees 
    WHERE employee_id IN (103, 105, 110)
)
AND salary IN (
    SELECT salary 
    FROM employees 
    WHERE employee_id IN (103, 105, 110)
);
