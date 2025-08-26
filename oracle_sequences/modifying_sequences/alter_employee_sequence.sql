-- alter_employee_sequence.sql
-- Demo: Altering a sequence in Oracle SQL

-- Step 1: Show current properties of the sequence
SELECT sequence_name, increment_by, last_number, cache_size, cycle_flag
FROM user_sequences
WHERE sequence_name = 'EMPLOYEE_SEQ';

-- Step 2: Alter the sequence
ALTER SEQUENCE employee_seq
   INCREMENT BY 5
   MAXVALUE 99999
   CACHE 30
   NOCYCLE;

-- Step 3: Test new increments
SELECT employee_seq.NEXTVAL AS new_id FROM dual;
SELECT employee_seq.NEXTVAL AS new_id FROM dual;
SELECT employee_seq.NEXTVAL AS new_id FROM dual;
