-- ================================================================
-- sequence_demo.sql
-- Demo: Dropping, Re-creating, and Using a Sequence in Oracle SQL
-- ================================================================

-- Step 1: Drop the sequence if it already exists
DROP SEQUENCE employee_seq;

-- Step 2: Re-create the sequence with custom settings
CREATE SEQUENCE employee_seq 
START WITH 100 
INCREMENT BY 3
MAXVALUE 99999 
CACHE 30 
NOCYCLE;

-- Step 3: Check sequence values
SELECT employee_seq.CURRVAL FROM dual;  -- Current value (after first NEXTVAL call)
SELECT employee_seq.NEXTVAL FROM dual;  -- Next available value

-- Step 4: Use the sequence in an INSERT
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (employee_seq.NEXTVAL, 'Smith', 'SMITH5', sysdate, 'IT_PROG');

-- Step 5: Verify the inserted row
SELECT * FROM employees;
