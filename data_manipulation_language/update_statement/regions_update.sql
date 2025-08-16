-- Connect to the HR schema before running these commands.
-- Example (SQL*Plus): CONNECT hr/hr_password@your_db;

-- 1️⃣ Update a single row (identified by primary key)
-- Expect: "1 row updated"
UPDATE regions
SET region_name = 'Scandinavia'
WHERE region_id = 101;

-- 2️⃣ Update multiple rows using a non-equality predicate
-- Expect: "3 rows updated"
UPDATE regions
SET region_name = 'Iberia'
WHERE region_id > 100;

-- 3️⃣ Update a set of rows using subqueries
--   - Outer UPDATE changes region_id values
--   - First subquery provides new values (MAX(region_id) offset)
--   - Second subquery selects the rows to be updated
-- Expect: "3 rows updated"
UPDATE regions
SET region_id = (
    region_id +
    (SELECT MAX(region_id) FROM regions)
)
WHERE region_id IN (
    SELECT region_id
    FROM regions
    WHERE region_id > 100
);

-- 4️⃣ Confirm the state of the rows
SELECT *
FROM regions;

-- 5️⃣ Commit the changes
COMMIT;
