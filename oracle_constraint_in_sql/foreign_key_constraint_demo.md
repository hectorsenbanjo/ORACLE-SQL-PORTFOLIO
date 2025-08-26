# Exploring Foreign Keys: Single-Column and Composite Constraints

This demo shows how **foreign keys** enforce referential integrity between parent and child tables.  
We’ll create a parent table `employees_copy`, a child table `managers`, and test valid/invalid inserts.

---

## 1. SQL Script

```sql
-- 1. Create parent table (employees_copy)
CREATE TABLE employees_copy (
    employee_id    NUMBER(6) CONSTRAINT emp_cpy_eid_pk PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(20),
    department_id  NUMBER(4),
    CONSTRAINT emp_cpy_names_uk UNIQUE (first_name, last_name)
);

-- 2. Create child table (managers) with foreign keys
CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_uq UNIQUE,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER NOT NULL,
    phone_number   VARCHAR2(11) UNIQUE NOT NULL,
    email          VARCHAR2(100),
    UNIQUE (email),
    -- Single-column FK
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy (employee_id),
    -- Composite FK
    CONSTRAINT mgr_names_fk FOREIGN KEY (first_name, last_name)
        REFERENCES employees_copy (first_name, last_name)
);

-- 3. Insert into employees_copy (parent table)
INSERT INTO employees_copy VALUES (101, 'Alice', 'Brown', 10);
INSERT INTO employees_copy VALUES (102, 'Mark', 'Smith', 20);

-- 4. Testing Foreign Keys
-- ✅ Valid insert: matches employee_id and (first_name,last_name)
INSERT INTO managers 
VALUES (101, 'Alice', 'Brown', 10, '08011111111', 'alice.brown@company.com');

-- ❌ Invalid: manager_id not found in employees_copy
INSERT INTO managers 
VALUES (200, 'John', 'Doe', 30, '08022222222', 'john.doe@company.com');

-- ❌ Invalid: (first_name,last_name) not found in employees_copy
INSERT INTO managers 
VALUES (102, 'David', 'Lee', 40, '08033333333', 'david.lee@company.com');

-- 5. Cleanup
DROP TABLE managers;
DROP TABLE employees_copy;

2. Storytelling Walkthrough
Creating the Parent Table

Our parent table employees_copy holds employee records.
It has:

A primary key on employee_id

A unique constraint on (first_name, last_name)

Creating the Child Table

The managers table references employees in two ways:

Single-column foreign key → manager_id must exist in employees_copy.employee_id.

Composite foreign key → (first_name, last_name) must exist in employees_copy.

Inserting Parent Data

We add two employees:

(101, 'Alice', 'Brown')

(102, 'Mark', 'Smith')

Testing Foreign Keys

✅ Valid insert: Alice Brown works (both keys match).

❌ Invalid insert: John Doe fails (missing employee_id=200).

❌ Invalid insert: David Lee fails (missing composite key pair).

Cleanup

Finally, we DROP both tables to reset the schema.

🔑 Key Takeaways

A single-column foreign key ensures one field matches in the parent.

A composite foreign key enforces dependency on multiple fields as a unit.

Oracle rejects invalid inserts, preserving referential integrity.
