-- =============================================================
-- create_view_empvw40.sql
-- Demo: Creating and querying a simple view
-- Works in HR schema (employees table available).
-- =============================================================

-- Step 1: Create a view for department 40 employees
CREATE OR REPLACE VIEW empvw40 (e_id, name, surname, email) AS
SELECT employee_id, first_name, last_name, email
FROM employees
WHERE department_id = 40;

-- Step 2: Query the view
SELECT * FROM empvw40;
