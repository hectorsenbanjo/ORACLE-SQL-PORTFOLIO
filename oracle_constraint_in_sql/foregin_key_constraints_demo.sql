-- =======================================================
-- foreign_key_demo.sql
-- Demonstrating FOREIGN KEY constraints in Oracle SQL
-- Covers: single-column FK and composite FK
-- =======================================================

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

-- Cleanup
DROP TABLE managers;
DROP TABLE employees_copy;
