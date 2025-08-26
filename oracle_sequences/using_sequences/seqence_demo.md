# Story: Dropping, Re-creating, and Using a Sequence

This demo shows how to drop an old sequence, create a new one, and use it to generate employee IDs automatically.

---

## Step 1: Drop the Old Sequence
If a sequence with the same name exists, remove it:

```sql
DROP SEQUENCE employee_seq;

This ensures a clean start.

Step 2: Create a New Sequence

We build employee_seq to generate employee IDs:

CREATE SEQUENCE employee_seq 
START WITH 100 
INCREMENT BY 3
MAXVALUE 99999 
CACHE 30 
NOCYCLE;


START WITH 100 → first generated ID

INCREMENT BY 3 → values increase by 3 each time (100, 103, 106 …)

CACHE 30 → pre-allocates values for performance

NOCYCLE → sequence will not restart when max is reached

Step 3: Test the Sequence
SELECT employee_seq.NEXTVAL FROM dual;  -- fetch next number
SELECT employee_seq.CURRVAL FROM dual;  -- show current number

Step 4: Use in an Insert

The sequence integrates into INSERT statements:

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (employee_seq.NEXTVAL, 'Smith', 'SMITH5', sysdate, 'IT_PROG');

Step 5: Verify
SELECT * FROM employees;


You’ll see Smith inserted with a new auto-generated ID (100, 103, 106 … depending on sequence calls).

✅ Recap

We dropped any old employee_seq

Re-created it with new settings

Used it in an INSERT to automate employee ID generation

Sequences are powerful tools for ensuring unique keys without manual number management!
