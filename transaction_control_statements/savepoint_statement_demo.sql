-- =============================================================
-- savepoints_demo.sql
-- Demonstration of SAVEPOINT and ROLLBACK in Oracle SQL.
-- This shows how to control transactions step by step.
-- =============================================================

-- Look at starting data
SELECT * FROM employees_copy;
SELECT * FROM jobs_copy;

-- DML 1: Delete all IT Programmers
DELETE FROM employees_copy WHERE job_id = 'IT_PROG';
SAVEPOINT A;  -- Create Savepoint A

-- DML 2: Increase all salaries by 20%
UPDATE employees_copy 
SET salary = 1.2 * salary;
SAVEPOINT B;  -- Create Savepoint B

-- DML 3: Insert a new Python Developer job
INSERT INTO jobs_copy 
VALUES ('PY_DEV','Python Developer', 12000, 20000);
SAVEPOINT C;  -- Create Savepoint C

-- DML 4: Delete all Sales Representatives
DELETE FROM employees_copy WHERE job_id = 'SA_REP';
SAVEPOINT D;  -- Create Savepoint D

-- =============================================================
-- ROLLBACK operations
-- =============================================================

-- Rollback entire transaction (everything undone)
ROLLBACK;

-- Rollback only to Savepoint B (salary changes remain, later changes undone)
ROLLBACK TO B;

-- Rollback only to Savepoint C (the Python Developer insert remains, but later changes undone)
ROLLBACK TO C;

-- Rollback only to Savepoint A (the IT_PROG delete remains, but later changes undone)
ROLLBACK TO SAVEPOINT A;

-- =============================================================
-- Storytelling Notes:
-- * SAVEPOINT creates "checkpoints" in your transaction.
-- * ROLLBACK can undo either the entire transaction
--   or go back to a specific SAVEPOINT.
-- * Later SAVEPOINTS are lost when you roll back to an earlier one.
-- * DDL (like CREATE TABLE) would auto-commit and clear savepoints.
-- =============================================================
