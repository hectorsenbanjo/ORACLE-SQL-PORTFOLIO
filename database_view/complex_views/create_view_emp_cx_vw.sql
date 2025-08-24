-- =============================================================
-- create_view_emp_cx_vw.sql
-- Demo: Creating an aggregate view (min/max salary per department)
-- Works in HR schema (employees, departments tables available).
-- =============================================================

-- Step 1: Create the view
CREATE OR REPLACE VIEW emp_cx_vw (DNAME, MIN_SAL, MAX_SAL) AS
SELECT UPPER(department_name), MIN(salary), MAX(salary)
FROM employees e 
JOIN departments d USING(department_id)
GROUP BY department_name;

-- Step 2: Query the view
SELECT * FROM emp_cx_vw;
