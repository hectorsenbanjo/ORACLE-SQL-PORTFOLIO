-- ================================================
-- function_based_index_demo.sql
-- Demo of B-tree index vs Function-Based Index
-- Works in HR schema (Oracle Database)
-- ================================================

-- Step 1: Create a working copy of employees table
DROP TABLE employees_copy PURGE;
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- Step 2: Create a normal B-tree index on last_name
CREATE INDEX emp_cpy_lname_idx ON employees_copy (last_name);

-- Step 3: Query using the column directly (index used)
SELECT * FROM employees_copy WHERE last_name = 'KING';

-- Step 4: Query using a function (index NOT used)
SELECT * FROM employees_copy WHERE upper(last_name) = 'KING';

-- Step 5: Drop the normal index
DROP INDEX emp_cpy_lname_idx;

-- Step 6: Create a Function-Based Index (FBI) on UPPER(last_name)
CREATE INDEX emp_cpy_fname_idx ON employees_copy (UPPER(last_name));

-- Step 7: Now queries using UPPER() can use the FBI
SELECT * FROM employees_copy WHERE UPPER(last_name) = 'KING';

-- Step 8: Queries without the function may not use the FBI
SELECT * FROM employees_copy WHERE last_name = 'KING';

-- Tip: In SQL Developer, press Shift+F4 to view execution plan
-- or run: EXPLAIN PLAN FOR <query>;
-- then SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
