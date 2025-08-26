-- ================================================================
-- synonyms_demo.sql
-- Demo: Creating and using synonyms in Oracle
-- ================================================================

-- 1. Create a synonym for the employees table
CREATE SYNONYM test_syn FOR employees;

-- Use the synonym in a query
SELECT * FROM test_syn;

-- 2. Redefine the synonym to point to another table
CREATE OR REPLACE SYNONYM test_syn FOR departments;

-- 3. Drop the synonym
DROP SYNONYM test_syn;

-- 4. Create a synonym for an object in the SYS schema
CREATE SYNONYM test_syn FOR SYS.user_objects;

-- Access it using HR schema prefix (HR must have permission!)
SELECT * FROM hr.test_syn;
