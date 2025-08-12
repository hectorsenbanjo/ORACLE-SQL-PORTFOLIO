/* 
   Story:
   Daniel is an employee in our HR database. 
   We want to find which department he works in, 
   along with the location details of that department 
   and the country it belongs to.
*/

SELECT e.first_name, 
       e.last_name, 
       d.department_name, 
       l.city, 
       l.postal_code, 
       l.street_address, 
       country_id
FROM employees e 
JOIN departments d 
  ON e.department_id = d.department_id
JOIN locations l 
  USING (location_id)
JOIN countries 
  USING (country_id)
WHERE d.department_id = 100
  AND e.first_name = 'Daniel';
