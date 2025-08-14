-- Story:
-- Imagine a multinational company where managers are spread across various countries.
-- The HR department needs to identify employees whose managers are based in the United Kingdom (UK).
-- This will help plan upcoming leadership workshops for UK-based managers and their direct reports.

-- Goal:
-- Find all employees whose manager works for a department located in the UK.

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

-- Explanation:
-- 1. Start with the innermost query to get all location IDs in the UK.
-- 2. Use those IDs to get departments located in the UK.
-- 3. Use those departments to get employee IDs of managers in the UK.
-- 4. Finally, get the last names of employees whose manager_id matches those manager IDs.
