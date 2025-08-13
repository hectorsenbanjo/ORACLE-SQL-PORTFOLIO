/*
   Story:
   HR wants to label employees based on whether their work location 
   matches the location with postal code '99236'.

   If it matches, label as "San Francisco", otherwise label as "Other".

   Approach:
   1. Identify the location_id for postal code '99236'.
   2. Use CASE to assign the appropriate label.
   3. NATURAL JOIN employees and departments for location_id access.
*/

SELECT employee_id, 
       first_name, 
       last_name,
       CASE 
           WHEN location_id = (
               SELECT location_id 
               FROM locations 
               WHERE postal_code = '99236'
           ) THEN 'San Francisco'
           ELSE 'Other' 
       END AS city
FROM employees 
NATURAL JOIN departments;
