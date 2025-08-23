Adding Constraints to a Copied Table with ALTER TABLE

This demo shows how to clone a table and then enforce data rules by adding constraints step by step.
We work with the HR schema, cloning the employees table into employees_copy and then applying constraints.

1. Clone the Table

We begin by creating a working copy of employees.
This creates the structure and data, but no constraints are copied over:

CREATE TABLE employees_copy AS SELECT * FROM employees;

2. Add a Primary Key

We enforce uniqueness on employee_id:

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);

3. Add Unique Constraints

We prevent duplicate values in critical columns:

ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_email_uk UNIQUE (email);
ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_names_uk UNIQUE (first_name, last_name);
ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_phone_uk UNIQUE (phone_number);

4. Add a Check Constraint

We ensure only employees with a meaningful salary are allowed:

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_salary_ck CHECK (salary > 10000);

5. Add a Foreign Key

We maintain referential integrity by linking each employee to a valid department:

ALTER TABLE employees_copy 
    ADD CONSTRAINT emp_cpy_dept_fk FOREIGN KEY (department_id) 
    REFERENCES departments(department_id);

6. Enforce NOT NULL

Finally, we make sure key fields are never left empty:

ALTER TABLE employees_copy MODIFY salary CONSTRAINT emp_cpy_salary_nn NOT NULL;
ALTER TABLE employees_copy MODIFY last_name NOT NULL;
ALTER TABLE employees_copy MODIFY first_name NOT NULL;

✅ Story Recap

By starting with a simple copy and layering constraints one by one, we:

Guaranteed unique identifiers (PK & unique constraints).

Prevented invalid data (check & NOT NULL).

Ensured referential integrity (foreign key).

This approach mirrors real-world database design, where constraints protect data quality and business rules.
