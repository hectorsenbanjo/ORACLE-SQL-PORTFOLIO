# Dropping Constraints and Handling Dependencies in Oracle

This demo shows how to **drop constraints (PKs, FKs)** in Oracle, and what happens when **dependencies** exist between tables.  
We use the **HR schema** `employees` table as the source.

---

## Full Demo Script with Explanations

```sql
-- =============================================================
-- drop_constraints_and_dependencies.sql
-- Demo: Dropping constraints (PK, FKs) and handling dependencies
-- Works in HR schema (employees, departments tables available).
-- =============================================================

-- 1. Clean up any previous copies
DROP TABLE managers CASCADE CONSTRAINTS;
DROP TABLE employees_copy CASCADE CONSTRAINTS;

-- 2. Clone the employees table and add a PK
CREATE TABLE employees_copy AS SELECT * FROM employees;

ALTER TABLE employees_copy
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

-- 3. Create a dependent child table (managers)
CREATE TABLE managers (
  manager_id    NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
  first_name    VARCHAR2(50),
  last_name     VARCHAR2(50),
  department_id NUMBER NOT NULL,
  phone_number  VARCHAR2(11) UNIQUE NOT NULL,
  email         VARCHAR2(100) UNIQUE,
  CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
    REFERENCES employees_copy (employee_id)
);

-- 4a. Drop PK using explicit constraint name
ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk;

-- 4b. Re-add the PK for further tests
ALTER TABLE employees_copy
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

-- 4c. Drop PK + dependent FK with CASCADE
ALTER TABLE employees_copy DROP PRIMARY KEY CASCADE;

-- 5. Final cleanup
DROP TABLE managers CASCADE CONSTRAINTS;
DROP TABLE employees_copy CASCADE CONSTRAINTS;

🔑 Key Takeaways

Dropping by name lets you target a specific constraint safely.

Dropping PRIMARY KEY CASCADE removes the PK and all dependent FKs in child tables.

CASCADE CONSTRAINTS is useful for cleanup when dropping tables with dependencies.

Always be cautious: removing constraints can compromise referential integrity.
