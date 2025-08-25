# Story: Generating Employee IDs with a Sequence

Imagine you are working in HR. Every time a new employee joins, you need to assign them a **unique employee ID**. Doing this manually can lead to duplicates and errors.  
Instead, we can let Oracle automatically generate the IDs using a **sequence**.

---

## Step 1: Creating the Sequence

We create a sequence called `employee_seq`:

CREATE SEQUENCE employee_seq

   START WITH 100

   INCREMENT BY 3

   MAXVALUE 99999

   CACHE 30

   NOCYCLE;

Explanation:

START WITH 100 → First ID will be 100.

INCREMENT BY 3 → Next IDs will be 103, 106, 109...

MAXVALUE 99999 → IDs stop at 99,999.

CACHE 30 → Speeds up generation by reserving 30 numbers.

NOCYCLE → Sequence won’t restart after reaching the max.

Step 2: Preparing a Table
We copy the structure of employees but keep it empty:

CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1=0;

Step 3: Using the Sequence in Inserts
When we add employees, Oracle automatically assigns IDs:

INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)

VALUES (employee_seq.NEXTVAL, 'John', 'Watson', 'JWATSON', SYSDATE, 'IT_PROG', 5000);

INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)

VALUES (employee_seq.NEXTVAL, 'Mary', 'Jones', 'MJONES', SYSDATE, 'SA_REP', 6000);

INSERT INTO employees_copy (employee_id, first_name, last_name, email, hire_date, job_id, salary)

VALUES (employee_seq.NEXTVAL, 'Peter', 'Brown', 'PBROWN', SYSDATE, 'HR_REP', 4000);

Step 4: Viewing the Results

SELECT employee_id, first_name, last_name, job_id, salary

FROM employees_copy;

Example Output

EMPLOYEE_ID	FIRST_NAME	LAST_NAME	JOB_ID	SALARY

100	John	Watson	IT_PROG	5000

103	Mary	Jones	SA_REP	6000

106	Peter	Brown	HR_REP	4000

Step 5: Checking the Sequence
Last used value:

SELECT employee_seq.CURRVAL FROM dual;

Next available value:

SELECT employee_seq.NEXTVAL FROM dual;

✅ Recap

By using a sequence, Oracle ensures each employee gets a unique, automatically generated ID, removing the risk of duplication and saving HR from manual work.

