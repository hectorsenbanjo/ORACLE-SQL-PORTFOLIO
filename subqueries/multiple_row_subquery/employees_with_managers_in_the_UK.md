# Employees with Managers Based in the UK

**Scenario:**  
A multinational company needs to prepare a leadership development program for managers in the United Kingdom.  
To ensure they reach all relevant staff, HR wants to find **employees whose direct managers are based in UK departments**.

**SQL Query:**
```sql
SELECT last_name
FROM employees
WHERE manager_id IN (
    SELECT employee_id
    FROM employees
    WHERE department_id IN (
        SELECT department_id
        FROM departments
        WHERE location_id IN (
            SELECT location_id
            FROM locations
            WHERE country_id = 'UK'
        )
    )
);
