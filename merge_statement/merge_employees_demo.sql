-- =============================================================
-- merge_employees_demo.sql
-- Demonstration of the MERGE statement (UPSERT) in Oracle.
-- This example keeps a copy table (employees_copy) synchronized
-- with the HR schema employees table.
--
-- Steps:
-- 1. If a matching employee_id exists, update basic details.
-- 2. If the department_id from source is NULL, delete the row.
-- 3. If the employee_id does not exist, insert a new row.
-- =============================================================

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

-- =============================================================
-- Storytelling notes:
-- Imagine you have two tables:
--   - employees: the source of truth
--   - employees_copy: a reporting/staging copy
--
-- The MERGE ensures employees_copy always matches employees:
--   * Existing employees get their latest details.
--   * Employees with no department are cleaned out.
--   * New hires are inserted automatically.
--
-- This pattern is commonly called "UPSERT with conditional DELETE".
-- =============================================================
