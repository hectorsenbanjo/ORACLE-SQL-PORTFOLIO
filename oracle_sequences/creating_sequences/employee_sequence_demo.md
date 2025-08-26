# Story: Generating Employee IDs with a Sequence

Imagine you are working in **HR**. Every time a new employee joins, you need to assign them a unique employee ID.  
Doing this manually can lead to **duplicates and errors**.  

Instead, we can let **Oracle automatically generate the IDs** using a sequence.

---

## Demo: Automatic Employee ID Generation

```sql
-- Step 1: Create a sequence
CREATE SEQUENCE employee_seq
    START WITH 100
    INCREMENT BY 3
    MAXVALUE 99999
    CACHE 30
    NOCYCLE;

-- Step 2: Copy the employees table structure into a new empty table
CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1=0;

-- Step 3: Insert rows using the sequence
INSERT INTO employees_copy 
    (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES 
    (employee_seq.NEXTVAL, 'John', 'Watson', 'JWATSON', SYSDATE, 'IT_PROG', 5000);

INSERT INTO employees_copy 
    (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES 
    (employee_seq.NEXTVAL, 'Mary', 'Jones', 'MJONES', SYSDATE, 'SA_REP', 6000);

INSERT INTO employees_copy 
    (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES 
    (employee_seq.NEXTVAL, 'Peter', 'Brown', 'PBROWN', SYSDATE, 'HR_REP', 4000);

-- Step 4: View the results
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees_copy;

-- Step 5: Check sequence values
SELECT employee_seq.CURRVAL AS last_used FROM dual;
SELECT employee_seq.NEXTVAL AS next_value FROM dual;

Example Output
EMPLOYEE_ID	FIRST_NAME	LAST_NAME	JOB_ID	SALARY
100	John	Watson	IT_PROG	5000
103	Mary	Jones	SA_REP	6000
106	Peter	Brown	HR_REP	4000
✅ Key Takeaway

By using a sequence, Oracle ensures each employee gets a unique, automatically generated ID, eliminating duplication and saving HR from manual work.
