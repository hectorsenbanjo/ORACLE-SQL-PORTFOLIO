-- ================================================================
-- index_demo.sql
-- Demo: Creating and using an index in Oracle
-- ================================================================

-- 1. Drop the table if it exists
DROP TABLE employees_copy;

-- 2. Create a copy of the employees table
CREATE TABLE employees_copy AS 
SELECT * FROM employees;

-- 3. Create a unique index on employee_id
CREATE UNIQUE INDEX emp_cpy_eid_idx 
ON employees_copy (employee_id);

-- 4. Query with WHERE to benefit from the index
SELECT * 
FROM employees_copy 
WHERE employee_id = 103;
