# Flashback Table Recovery Demo

This demo shows how to use **Flashback Table** to recover from accidental deletes — even after a `COMMIT`.

---

## Example Walkthrough

```sql
-- Check recycle bin (optional)
SELECT * FROM recyclebin;

-- Look at current data
SELECT * FROM employees_copy;

-- Oops! Delete high earners
DELETE FROM employees_copy WHERE salary > 5000;
COMMIT;

-- Enable row movement (required for flashback)
ALTER TABLE employees_copy ENABLE ROW MOVEMENT;

-- Rewind table 30 minutes back
FLASHBACK TABLE employees_copy
TO TIMESTAMP (SYSDATE - 30/(24*60));
