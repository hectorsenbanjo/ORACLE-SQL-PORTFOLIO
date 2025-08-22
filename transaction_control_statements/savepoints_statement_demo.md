# SAVEPOINT and ROLLBACK Demo

This demo illustrates how to use **SAVEPOINT** and **ROLLBACK** in Oracle SQL to control transactions step by step.

---

## Script Overview

```sql
-- Start by checking data
SELECT * FROM employees_copy;
SELECT * FROM jobs_copy;

-- Delete IT Programmers
DELETE FROM employees_copy WHERE job_id = 'IT_PROG';
SAVEPOINT A;

-- Give everyone a 20% raise
UPDATE employees_copy SET salary = 1.2 * salary;
SAVEPOINT B;

-- Insert a new job role
INSERT INTO jobs_copy VALUES ('PY_DEV','Python Developer', 12000, 20000);
SAVEPOINT C;

-- Delete Sales Reps
DELETE FROM employees_copy WHERE job_id = 'SA_REP';
SAVEPOINT D;

-- Rollbacks
ROLLBACK;            -- Undo everything
ROLLBACK TO B;       -- Undo after Savepoint B
ROLLBACK TO C;       -- Undo after Savepoint C
ROLLBACK TO SAVEPOINT A; -- Undo after Savepoint A
