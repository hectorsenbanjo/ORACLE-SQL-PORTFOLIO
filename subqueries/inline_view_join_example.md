# Inline View Join Example

**Scenario:**  
We want to show each employee’s:
- ID, first name, last name
- Department name
- Department’s city
- Department’s state/province

To keep the query clean, we first build a **derived table** that merges department and location details.

---

**SQL Query:**
```sql
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
