# Insert Aggregated Department Salary Data

This SQL script aggregates salary and staff counts for each department in the HR schema, then inserts the results into a custom table `department_salaries`.

---

## Key Features
- **`FULL OUTER JOIN`** → ensures the query includes:
  - Departments without employees
  - Employees without a department
- **`COALESCE`** → replaces `NULL` department names with `"Unassigned"` and `NULL` salaries with `0`.
- **Aggregate Functions**:
  - `COUNT(employee_id)` → counts staff members per department.
  - `SUM(salary)` → totals salaries per department.
- **`GROUP BY`** → groups data by department.
- **`ORDER BY`** → sorts results alphabetically by department name.

---

## SQL Code
```sql
INSERT INTO department_salaries (department, staff, salaries)
SELECT
    COALESCE(d.department_name, 'Unassigned') AS department,
    COUNT(e.employee_id) AS staff,
    SUM(COALESCE(e.salary, 0)) AS salaries
FROM hr.employees e
FULL OUTER JOIN hr.departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY d.department_name;
