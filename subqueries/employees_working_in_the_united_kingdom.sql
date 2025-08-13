/*
   Story:
   The HR team wants to know which employees work in the United Kingdom.
   However, the employee table only stores the department they belong to.
   The department table stores the location, and the location table stores the country.
   We will use nested subqueries to traverse these relationships and find the employees.

   Steps:
   1. Find the country_id for 'United Kingdom' in the countries table.
   2. Use that country_id to get location_ids from the locations table.
   3. Use those location_ids to find department_ids from the departments table.
   4. Finally, get the employees who belong to those departments.
*/

SELECT first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id IN (
            SELECT country_id
            FROM countries
            WHERE country_name = 'United Kingdom'
        )
    )
);
