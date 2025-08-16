# Transaction Control in Oracle SQL

This demo shows how to use **Transaction Control Language (TCL)** commands in Oracle:
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`
- `SELECT FOR UPDATE`

👉 Copy and paste the script below into **SQL*Plus**, **SQLcl**, or **SQL Developer (Run Script)**.  
It is safe to run because it uses demo rows with a configurable `BASE_ID`.

---

## Full Demo Script

```sql
-- ================================================
-- transaction_control_demo.sql
-- One-page TCL demo: COMMIT, ROLLBACK, SAVEPOINT,
-- and SELECT FOR UPDATE
-- ================================================

-- Use a base ID unlikely to collide. Change if needed.
SET DEFINE ON
DEFINE BASE_ID = 9500

PROMPT
PROMPT ========== STEP 1: INSERT (pending), VERIFY, then ROLLBACK ==========
-- Insert a row (not permanent yet)
INSERT INTO regions (region_id, region_name)
VALUES (&BASE_ID, 'TCL_DEMO_INSERT_1');

-- Verify it's visible in this session (pending change)
SELECT region_id, region_name
FROM regions
WHERE region_id = &BASE_ID;

-- Undo the pending insert
ROLLBACK;

-- Verify it's gone
SELECT region_id, region_name
FROM regions
WHERE region_id = &BASE_ID;

PROMPT
PROMPT ========== STEP 2: INSERT again and COMMIT ==========
-- Insert the same row again
INSERT INTO regions (region_id, region_name)
VALUES (&BASE_ID, 'TCL_DEMO_INSERT_1');

-- Make it permanent
COMMIT;

-- Verify it persisted
SELECT region_id, region_name
FROM regions
WHERE region_id = &BASE_ID;

PROMPT
PROMPT ========== STEP 3: SAVEPOINT demo (partial rollback) ==========
-- Insert a second row
INSERT INTO regions (region_id, region_name)
VALUES (&BASE_ID + 1, 'TCL_DEMO_SAVEPOINT_B');

-- Mark a savepoint
SAVEPOINT sp1;

-- Insert a third row
INSERT INTO regions (region_id, region_name)
VALUES (&BASE_ID + 2, 'TCL_DEMO_SAVEPOINT_C');

-- Verify both rows exist (B and C)
SELECT region_id, region_name
FROM regions
WHERE region_id IN (&BASE_ID + 1, &BASE_ID + 2)
ORDER BY region_id;

-- Roll back only to the savepoint (undo C, keep B)
ROLLBACK TO sp1;

-- Verify B remains, C is gone
SELECT region_id, region_name
FROM regions
WHERE region_id IN (&BASE_ID + 1, &BASE_ID + 2)
ORDER BY region_id;

-- Finalize the demo changes
COMMIT;

PROMPT
PROMPT ========== STEP 4: SELECT FOR UPDATE demo ==========
-- Insert a row for locking demo
INSERT INTO regions (region_id, region_name)
VALUES (&BASE_ID + 10, 'FOR_UPDATE_DEMO');
COMMIT;

-- Lock the row so other sessions cannot change it
SELECT region_id, region_name
FROM regions
WHERE region_id = &BASE_ID + 10
FOR UPDATE;

-- Safe to update inside this session
UPDATE regions
SET region_name = 'LOCKED_UPDATE'
WHERE region_id = &BASE_ID + 10;

-- Release the lock
COMMIT;

PROMPT
PROMPT ========== FINAL CHECK: Show all demo rows ==========
SELECT region_id, region_name
FROM regions
WHERE region_id BETWEEN &BASE_ID AND (&BASE_ID + 15)
ORDER BY region_id;

PROMPT
PROMPT ========== OPTIONAL CLEANUP (uncomment to remove demo rows) ==========
-- DELETE FROM regions
-- WHERE region_id BETWEEN &BASE_ID AND (&BASE_ID + 15);
-- COMMIT;
