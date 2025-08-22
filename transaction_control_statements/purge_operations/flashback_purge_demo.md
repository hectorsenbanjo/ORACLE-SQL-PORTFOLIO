# Flashback Drop vs PURGE Demo

This demo shows how Oracle’s **Recycle Bin** works with `DROP`, and how `PURGE` permanently removes objects so they cannot be restored.

---

## Example Walkthrough

```sql
-- See recycle bin
SELECT * FROM recyclebin;

-- Empty recycle bin
PURGE RECYCLEBIN;

-- Drop permanently (skips recycle bin)
DROP TABLE employees_copy PURGE;

-- Attempt to restore (fails)
FLASHBACK TABLE employees_copy TO BEFORE DROP;
-- ORA-38305: object not in RECYCLE BIN

-- Create some test copies
CREATE TABLE employees_copy2 AS SELECT * FROM employees;
CREATE TABLE employees_copy3 AS SELECT * FROM employees;

-- Drop them (goes to recycle bin)
DROP TABLE employees_copy;
DROP TABLE employees_copy2;
DROP TABLE employees_copy3;

-- Purge specific tables permanently
PURGE TABLE employees_copy2;
PURGE TABLE employees_copy3;
