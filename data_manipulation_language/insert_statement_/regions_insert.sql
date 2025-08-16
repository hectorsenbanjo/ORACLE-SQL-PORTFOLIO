-- Connect to the HR schema before running these commands.
-- Example in SQL*Plus: CONNECT hr/hr_password@your_db;

-- 1️⃣ Insert a row with hard-coded values
INSERT INTO regions
VALUES (101, 'Great Britain');

-- 2️⃣ Insert a row using substitution variables
-- When prompted:
--   Region_number: 102
--   Region_name:   Australasia
INSERT INTO regions
VALUES (&Region_number, '&Region_name');

-- 3️⃣ Insert a row calculating REGION_ID dynamically
-- This ensures the new ID is one greater than the current maximum
INSERT INTO regions
VALUES (
    (SELECT MAX(region_id) + 1 FROM regions),
    'Oceania'
);

-- 4️⃣ Confirm the inserted rows
SELECT *
FROM regions;

-- 5️⃣ Commit the changes to make them permanent
COMMIT;
