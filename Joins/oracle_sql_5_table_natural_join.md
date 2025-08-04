# Oracle SQL: Joining 5 Tables with NATURAL JOIN

This example demonstrates how to join **five related tables** in Oracle SQL using the `NATURAL JOIN` syntax.

---

## 📜 SQL Query
```sql
-- Build a readable sentence per employee by joining related dimensions
SELECT 
  e.first_name || ' ' || e.last_name || ' works as a ' || e.job_id ||
  ' in the ' || d.department_name || ' department located in ' ||
  location_id || ' ' || l.city || ', ' || country_id || ', ' || region_name || ' region.' AS "multi joins"
FROM departments d
NATURAL JOIN locations l
NATURAL JOIN countries c
NATURAL JOIN regions r
NATURAL JOIN employees e;

⚠️ Notes

NATURAL JOIN is convenient for quick joins but may cause unexpected results if column names match unintentionally.

For production queries, consider using INNER JOIN ... ON ... for more control over join conditions.

Alternative / Safer Version

SELECT 
  e.first_name || ' ' || e.last_name || ' works as a ' || e.job_id ||
  ' in the ' || d.department_name || ' department located in ' ||
  l.location_id || ' ' || l.city || ', ' || c.country_id || ', ' || r.region_name || ' region.' AS "multi joins"
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id;

🔍 What this produces

Rows like:

Employee Kochhar works as a AD_VP in the Executive department located in Seattle, 1700 US, Americas region.
and similarly for other employees in the HR schema.

📌 Recommendation
Use the explicit join version for clarity and to avoid accidental column matching issues.

Keep the NATURAL JOIN version only for quick ad-hoc exploration when you’re sure of column name overlaps.

⚠️ This version avoids the ambiguity of NATURAL JOIN by specifying join keys explicitly.
