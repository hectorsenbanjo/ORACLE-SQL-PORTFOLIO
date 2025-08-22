-- =============================================================
-- flashback_table_recovery_demo.sql
-- Demonstration of Flashback Table recovery in Oracle SQL.
-- Shows how to restore table data after accidental changes.
-- =============================================================

-- Step 1: Check recycle bin (for dropped objects)
SELECT * FROM recyclebin;

-- Step 2: View current data in the table
SELECT * FROM employees_copy;

-- Step 3: Accidentally delete rows (all employees with salary > 5000)
DELETE FROM employees_copy WHERE salary > 5000;
COMMIT;   -- mistake is now permanent in normal DML terms

-- Step 4: Allow row movement (required for Flashback Table)
ALTER TABLE employees_copy ENABLE ROW MOVEMENT;

-- Step 5: Restore table to how it was 30 minutes ago
FLASHBACK TABLE employees_copy
TO TIMESTAMP (SYSDATE - 30/(24*60));

-- =============================================================
-- Storytelling:
-- Imagine you deleted high-salary employees and committed.
-- Normally, you'd think it's gone forever.
-- But with Flashback Table, you "rewind" the table to a time
-- before the mistake happened.
-- =============================================================
