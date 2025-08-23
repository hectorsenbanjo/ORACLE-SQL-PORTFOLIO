-- =============================================================
-- add_constraints_via_alter_table_statement.sql
-- Demo: Adding constraints to a cloned table using ALTER TABLE
-- Works in HR schema (employees, departments tables available).
-- =============================================================

-- Clean up any previous copies
DROP TABLE employees_copy CASCADE CONSTRAINTS;

-- Step 1: Clone the employees table
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- Step 2: Add constraints

-- Primary Key on employee_id
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

-- Unique constraints
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_email_uk UNIQUE (email);

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_names_uk UNIQUE (first_name, last_name);

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_phone_uk UNIQUE (phone_number);

-- Check constraint
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_salary_ck CHECK (salary > 10000);

-- Foreign Key to departments table
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_dept_fk FOREIGN KEY (department_id) 
    REFERENCES departments(department_id);

-- NOT NULL constraints
ALTER TABLE employees_copy 
    MODIFY salary CONSTRAINT emp_cpy_salary_nn NOT NULL;

ALTER TABLE employees_copy 
    MODIFY last_name NOT NULL;

ALTER TABLE employees_copy 
    MODIFY first_name NOT NULL;
