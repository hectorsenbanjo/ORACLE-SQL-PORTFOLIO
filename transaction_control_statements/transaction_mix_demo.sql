-- =============================================================
-- transaction_mix_demo.sql
-- Demonstration of DML (SELECT, INSERT, UPDATE, DELETE),
-- transaction control (COMMIT, ROLLBACK),
-- and simple DDL (CREATE, DROP).
-- Works in SQL*Plus, SQLcl, and SQL Developer.
-- =============================================================

-- 1. View all rows in the copy table
SELECT * FROM employees_copy;

-- 2. Delete all Sales Representatives (SA_REP)
DELETE employees_copy WHERE job_id = 'SA_REP';

-- 3. Undo the delete
ROLLBACK;

-- 4. Update all rows, set first_name = 'John'
UPDATE employees_copy SET first_name = 'John';

-- 5. Save the change permanently
COMMIT;

-- 6. Restore original first_name values from employees table
UPDATE employees_copy c 
SET first_name = (
    SELECT first_name 
    FROM employees e
    WHERE e.employee_id = c.employee_id
);

-- 7. Insert back all Sales Representatives
INSERT INTO employees_copy
    (SELECT * FROM employees
     WHERE job_id = 'SA_REP');

-- 8. Create a temporary table
CREATE TABLE temp (tmp DATE);

-- 9. Drop the temporary table
DROP TABLE temp;

-- =============================================================
-- Storytelling Notes:
-- * DELETE + ROLLBACK: demonstrates undoing changes.
-- * UPDATE + COMMIT: shows how permanent changes are made.
-- * UPDATE with subquery: syncs one column with the source.
-- * INSERT with subquery: brings in specific rows (SA_REP).
-- * CREATE and DROP illustrate schema-level changes (DDL).
-- 
-- This script shows how DML, TCL, and DDL interact
-- in everyday Oracle SQL work.
-- =============================================================
