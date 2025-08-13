/*
   Story:
   We want to list employees along with their department name, city, 
   and state/province. 
   To make the query more modular and readable, we first create an inline view 
   that joins departments with locations. 
   Then we join that inline view with the employees table.

   Approach:
   1. Inline view `b` combines `departments` and `locations` into a single set.
   2. Main query joins `employees` with that inline view using `department_id`.
*/

SELECT e.employee_id, 
       e.first_name, 
       e.last_name,
       b.department_name, 
       b.city, 
       b.state_province
FROM employees e
JOIN (
    SELECT department_id, 
           department_name, 
           state_province, 
           city
    FROM departments
    JOIN locations USING (location_id)
    ORDER BY department_id
) b
USING (department_id);
