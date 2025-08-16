-- Connect to the HR schema before running these commands.
-- Example (SQL*Plus): CONNECT hr/hr_password@your_db;

-- 1️⃣ Delete employees working in departments located in Europe.
DELETE FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id IN (
            SELECT country_id
            FROM countries
            WHERE region_id IN (
                SELECT region_id
                FROM regions
                WHERE region_name = 'Europe'
            )
        )
    )
);

-- 2️⃣ Confirm no employees remain from Europe-based departments
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id IN (
            SELECT country_id
            FROM countries
            WHERE region_id IN (
                SELECT region_id
                FROM regions
                WHERE region_name = 'Europe'
            )
        )
    )
);

-- 3️⃣ Commit the changes
COMMIT;
