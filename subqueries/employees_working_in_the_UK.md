# Employees Working in the United Kingdom

**Scenario:**  
We need to list all employees who work in the United Kingdom.  
The relationship between tables is as follows:
- **employees** → `department_id`
- **departments** → `location_id`
- **locations** → `country_id`
- **countries** → `country_name`

---

**SQL Query:**
```sql
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
