-- =============================================================
-- drop_constraints_and_dependencies.sql
-- Demo: Dropping constraints (PK, FKs) and handling dependencies
-- Works in HR schema (employees, departments tables available).
-- =============================================================

-- Clean up any previous copies
DROP TABLE managers CASCADE CONSTRAINTS;
DROP TABLE employees_copy CASCADE CONSTRAINTS;

-- Step 1: Clone employees table
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- Add a primary key to employees_copy
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

-- Step 2: Create a managers table referencing employees_copy
CREATE TABLE managers (
  manager_id    NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
  first_name    VARCHAR2(50),
  last_name     VARCHAR2(50),
  department_id NUMBER NOT NULL,
  phone_number  VARCHAR2(11) UNIQUE NOT NULL,
  email         VARCHAR2(100) UNIQUE,
  CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) REFERENCES employees_copy (employee_id)
);

-- Step 3: Drop constraints in different ways

-- Drop using explicit constraint name
ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk;

-- Re-add the PK for further tests
ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

-- Drop PK + dependent FK in managers with CASCADE
ALTER TABLE employees_copy DROP PRIMARY KEY CASCADE;

-- Clean up again
DROP TABLE managers CASCADE CONSTRAINTS;
DROP TABLE employees_copy CASCADE CONSTRAINTS;
