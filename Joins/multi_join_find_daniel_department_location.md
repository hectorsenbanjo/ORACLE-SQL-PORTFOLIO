# Finding Daniel's Department and Location

**Scenario:**  
In the HR database, Daniel is an employee.  
We want to retrieve:  
- His first and last name  
- The department he works in  
- The department’s city, postal code, and street address  
- The country code of the location  

---

**SQL Query:**
```sql
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



