-- Connect to the HR schema before running these commands.
-- Example (SQL*Plus): CONNECT hr/hr_password@your_db;

-- 1️⃣ Delete a single row by primary key
-- Remove the employee with ID 206
DELETE FROM employees
WHERE employee_id = 206;

-- 2️⃣ Confirm the deletion
-- Employee 206 should no longer appear in the results
SELECT *
FROM employees
WHERE employee_id = 206;

-- 3️⃣ Commit the changes to make the deletion permanent
COMMIT;
