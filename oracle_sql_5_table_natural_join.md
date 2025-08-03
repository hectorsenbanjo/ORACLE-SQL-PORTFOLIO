# Oracle SQL: Joining 5 Tables with NATURAL JOIN

This example demonstrates how to join **five related tables** in Oracle SQL using the `NATURAL JOIN` syntax.

---

## 📜 SQL Query
```sql
-- Build a readable sentence per employee by joining related dimensions
SELECT 
    'Employee ' || last_name || ' in ' || department_name || 
    ' department located in ' || city || ', ' || location_id || ' ' || country_id || 
    ' works as a ' || job_id AS "multi joins"
FROM departments
-- Natural joins cascade: joins based on columns with the same name
NATURAL JOIN locations
NATURAL JOIN countries
NATURAL JOIN regions
NATURAL JOIN employees;


⚠️ Notes

NATURAL JOIN is convenient for quick joins but may cause unexpected results if column names match unintentionally.

For production queries, consider using INNER JOIN ... ON ... for more control over join conditions.

Alternative / Safer Version

SELECT 
    'Employee ' || e.last_name || ' in ' || d.department_name || 
    ' department located in ' || l.city || ', ' || l.location_id || ' ' || c.country_id || 
    ' works as a ' || e.job_id AS "multi joins"
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

⚠️ This version avoids the ambiguity of NATURAL JOIN by specifying join keys explicitly.

