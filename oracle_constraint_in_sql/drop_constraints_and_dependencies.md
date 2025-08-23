Dropping Constraints and Handling Dependencies

This demo shows how to remove constraints from a table and deal with dependencies like foreign keys.
We work with a cloned employees_copy table and a new managers table.

1. Clone the Base Table

We start by copying data from employees:

CREATE TABLE employees_copy AS SELECT * FROM employees;


We then add a primary key:

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

2. Create a Dependent Table

The managers table includes a foreign key to employees_copy:

CREATE TABLE managers (
  manager_id    NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
  first_name    VARCHAR2(50),
  last_name     VARCHAR2(50),
  department_id NUMBER NOT NULL,
  phone_number  VARCHAR2(11) UNIQUE NOT NULL,
  email         VARCHAR2(100) UNIQUE,
  CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) REFERENCES employees_copy (employee_id)
);


Here, mgr_emp_fk depends on the primary key of employees_copy.

3. Drop Constraints
Drop by Explicit Name
ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk;


This works because we named the PK.

Drop with CASCADE
ALTER TABLE employees_copy DROP PRIMARY KEY CASCADE;


Drops the primary key.

Also removes dependent foreign keys (e.g., mgr_emp_fk in managers).

This is safer when other tables depend on the PK.

✅ Story Recap

In this demo, we learned that:

Always name constraints for easier management.

Use CASCADE when foreign keys depend on the constraint.

Dropping a PK without CASCADE fails if child tables reference it.

This mirrors real-world DBA work where careful constraint management keeps the schema consistent.
