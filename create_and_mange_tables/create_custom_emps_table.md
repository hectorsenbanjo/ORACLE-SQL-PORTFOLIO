# EMPS Table Demo: Create → Insert → Alter → Group 

This demo shows the lifecycle of a table in Oracle Database, from creation to data loading, modification, and analysis.  
We create a custom table `EMPS`, load data from the HR schema, alter it to add a new column with a default value, insert test data, and finally group results by hire date.

---

We begin by creating the `EMPS` table with basic employee details.  
Next, we load data from the **HR.EMPLOYEES** table into it.  
After that, we alter the table to add a `HIRED` column and set a default of today’s date (`SYSDATE`).  
Finally, we insert a new employee (`Newman`) without explicitly providing a hire date, and then group employees by their hire date.

```sql
-- Step 1: Create the table
CREATE TABLE EMPS 
(
  EMPNO   NUMBER,
  ENAME   VARCHAR2(25),
  SALARY  NUMBER,
  DEPTNO  NUMBER(4)
);

-- Step 2: Load data from HR.EMPLOYEES
INSERT INTO EMPS
SELECT employee_id, last_name, salary, department_id
FROM employees;

COMMIT;

-- Step 3: Add the HIRED column
ALTER TABLE EMPS
  ADD (HIRED DATE);

-- Step 4: Set a default value for HIRED
ALTER TABLE EMPS
  MODIFY (HIRED DEFAULT SYSDATE);

-- Step 5: Insert a row using the default HIRED value
INSERT INTO EMPS (empno, ename)
VALUES (99, 'Newman');

COMMIT;

-- Step 6: Group by HIRED date
SELECT HIRED, COUNT(1) AS num_emps
FROM EMPS
GROUP BY HIRED;
