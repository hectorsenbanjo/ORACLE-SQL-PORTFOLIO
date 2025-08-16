-- ================================================
-- transaction_control_demo.sql
-- One-page TCL demo: COMMIT, ROLLBACK, SAVEPOINT
-- Works in SQL*Plus, SQLcl, and SQL Developer (run as script).
-- ================================================

-- Use a base ID unlikely to collide. Change if needed.
SET DEFINE ON
DEFINE BASE_ID = 9200

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
PROMPT ========== FINAL CHECK: Show all demo rows ==========
SELECT region_id, region_name
FROM regions
WHERE region_id BETWEEN &BASE_ID AND (&BASE_ID + 2)
ORDER BY region_id;

PROMPT
PROMPT ========== OPTIONAL CLEANUP (uncomment to remove demo rows) ==========
-- DELETE FROM regions
-- WHERE region_id BETWEEN &BASE_ID AND (&BASE_ID + 2);
-- COMMIT;
