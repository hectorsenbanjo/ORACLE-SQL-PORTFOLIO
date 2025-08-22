# Transaction Mix Demo: DML, TCL, and DDL in Action

This demo illustrates how **Data Manipulation Language (DML)**, **Transaction Control Language (TCL)**, and simple **Data Definition Language (DDL)** statements work together in Oracle SQL.

---

## Script Overview

```sql
-- View data
SELECT * FROM employees_copy;

-- Delete all Sales Representatives
DELETE employees_copy WHERE job_id = 'SA_REP';

-- Rollback: undo the delete
ROLLBACK;

-- Update everyone’s name to 'John'
UPDATE employees_copy SET first_name = 'John';

-- Commit: save permanently
COMMIT;

-- Restore original first_name from employees
UPDATE employees_copy c 
SET first_name = (
    SELECT first_name 
    FROM employees e
    WHERE e.employee_id = c.employee_id
);

-- Insert back Sales Representatives
INSERT INTO employees_copy
    (SELECT * FROM employees WHERE job_id = 'SA_REP');

-- Create and drop a simple table
CREATE TABLE temp (tmp DATE);
DROP TABLE temp;
