# MERGE Statement Demo: Keeping Employee Copies in Sync

This demo shows how to use the **MERGE statement** in Oracle (also known as **UPSERT**) to keep a copy table (`employees_copy`) synchronized with the HR schema `employees` table.  

We’ll handle three cases:
1. **Update** employees if they already exist in the copy.  
2. **Delete** employees if their department is missing.  
3. **Insert** new employees if they don’t exist in the copy.  

---

## The SQL Script

```sql
MERGE INTO employees_copy c
USING (SELECT * FROM employees) e
ON (c.employee_id = e.employee_id)

-- CASE 1: Rows exist in both tables (MATCHED)
WHEN MATCHED THEN
   UPDATE SET
      c.first_name    = e.first_name,
      c.last_name     = e.last_name,
      c.department_id = e.department_id,
      c.salary        = e.salary
   DELETE WHERE e.department_id IS NULL   -- remove "orphaned" rows

-- CASE 2: Rows exist in source but not in target (NOT MATCHED)
WHEN NOT MATCHED THEN
   INSERT (
      employee_id, first_name, last_name, email, phone_number,
      hire_date, job_id, salary, commission_pct, manager_id, department_id
   )
   VALUES (
      e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
      e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id
   );
