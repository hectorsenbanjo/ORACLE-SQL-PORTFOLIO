# Adding Constraints to a Table Copy in Oracle

This demo shows how to **add different types of constraints** (PK, UK, FK, CHECK, NOT NULL) to a cloned table.  
We use the **HR schema** `employees` table as the base and create `employees_copy` with enhanced integrity rules.

---

## Full Demo Script with Explanations

```sql
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

🔑 Key Takeaways

Primary Key ensures each row in employees_copy is uniquely identified by employee_id.

Unique constraints enforce business rules: no duplicate emails, names, or phone numbers.

Check constraint guarantees salaries must be greater than 10,000.

Foreign Key links employees to valid departments, preserving referential integrity.

NOT NULL constraints enforce mandatory data entry for important fields like names and salary.

This example highlights how Oracle lets you layer multiple constraints to enforce both data quality and business rules.
