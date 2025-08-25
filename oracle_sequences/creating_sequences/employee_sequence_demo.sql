-- employee_sequence_demo.sql
-- Demo: Creating and using a sequence in Oracle SQL

-- Clean up if rerunning
DROP SEQUENCE employee_seq;
DROP TABLE employees_copy;

-- Step 1: Create empty table (same structure as employees)
CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1=0;

-- Step 2: Create sequence
CREATE SEQUENCE employee_seq
   START WITH 100
   INCREMENT BY 3
   MAXVALUE 99999
   CACHE 30
   NOCYCLE;

-- Step 3: Insert employees using the sequence
INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (employee_seq.NEXTVAL, 'John', 'Watson', 'JWATSON', SYSDATE, 'IT_PROG', 5000);

INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (employee_seq.NEXTVAL, 'Mary', 'Jones', 'MJONES', SYSDATE, 'SA_REP', 600
