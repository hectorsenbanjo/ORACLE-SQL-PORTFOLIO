# Employees City Label Based on Postal Code

**Scenario:**  
We want to assign a **city label** to employees:
- If their work location has postal code `99236`, label as **"San Francisco"**.
- Otherwise, label as **"Other"**.

---

**SQL Query:**
```sql
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
