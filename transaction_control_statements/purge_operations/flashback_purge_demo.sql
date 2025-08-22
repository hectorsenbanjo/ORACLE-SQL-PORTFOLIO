-- =============================================================
-- flashback_purge_demo.sql
-- Demonstration of Flashback Drop vs PURGE in Oracle SQL.
-- Shows how recycle bin works, and how PURGE removes objects forever.
-- =============================================================

-- Step 1: Check recycle bin contents
SELECT * FROM recyclebin;

-- Step 2: Purge all objects in recycle bin (empty it)
PURGE RECYCLEBIN;

-- Step 3: Drop a table permanently (skips recycle bin)
DROP TABLE employees_copy PURGE;

-- Step 4: Try to flashback the purged table (this will fail)
FLASHBACK TABLE employees_copy TO BEFORE DROP;
-- ORA-38305: object not in RECYCLE BIN

-- Step 5: Create some test tables
CREATE TABLE employees_copy2 AS SELECT * FROM employees;
CREATE TABLE employees_copy3 AS SELECT * FROM employees;

-- Step 6: Drop the test tables (they go to recycle bin)
DROP TABLE employees_copy;
DROP TABLE employees_copy2;
DROP TABLE employees_copy3;

-- Step 7: Permanently purge specific tables from recycle bin
PURGE TABLE employees_copy2;
PURGE TABLE employees_copy3;

-- =============================================================
-- Storytelling:
-- * DROP sends tables to recycle bin (can be restored).
-- * DROP PURGE skips the recycle bin (no recovery).
-- * PURGE RECYCLEBIN removes everything for current user.
-- * PURGE TABLE removes one object permanently.
-- Once PURGE is used, Flashback cannot bring it back.
-- =============================================================
