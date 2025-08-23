-- =======================================================
-- foreign_key_on_delete_demo.sql
-- Demonstrating FOREIGN KEY actions in Oracle SQL
-- Covers: default (NO ACTION), ON DELETE SET NULL, ON DELETE CASCADE
-- =======================================================

-- 1. Create parent table
CREATE TABLE employees_copy (
    employee_id    NUMBER(6) CONSTRAINT emp_cpy_eid_pk PRIMARY KEY,
    first_name     VARCHAR2(20),
    last_name      VARCHAR2(20),
    department_id  NUMBER(4)
);

-- Insert parent rows
INSERT INTO employees_copy VALUES (103, 'John', 'King', 90);
INSERT INTO employees_copy VALUES (104, 'John2', 'King', 90);
INSERT INTO employees_copy VALUES (105, 'John3', 'King', 90);

-- =======================================================
-- Case 1: Default FK behavior (NO ACTION)
-- =======================================================
DROP TABLE managers;
CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER NOT NULL,
    phone_number   VARCHAR2(20) UNIQUE NOT NULL,
    email          VARCHAR2(100) UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy (employee_id)
);

-- Insert valid managers (FK matches parent employee_id)
INSERT INTO managers VALUES (103, 'John', 'King', 90, '123-456-789', 'jking');
INSERT INTO managers VALUES (104, 'John2', 'King', 90, '123-456-780', 'jking2');
INSERT INTO managers VALUES (105, 'John3', 'King', 90, '123-456-781', 'jking3');

-- Try deleting parent row
DELETE FROM employees_copy WHERE employee_id = 103;
-- ❌ Fails: FK prevents delete (NO ACTION)

-- =======================================================
-- Case 2: ON DELETE SET NULL
-- =======================================================
DROP TABLE managers;
CREATE TABLE managers (
    manager_id     NUMBER,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER NOT NULL,
    phone_number   VARCHAR2(20) UNIQUE NOT NULL,
    email          VARCHAR2(100) UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy (employee_id) ON DELETE SET NULL
);

-- Insert again
INSERT INTO managers VALUES (103, 'John', 'King', 90, '123-456-789', 'jking');
INSERT INTO managers VALUES (150, 'Ghost', 'User', 99, '123-456-788', 'ghost'); -- invalid unless parent exists

-- Delete parent
DELETE FROM employees_copy WHERE employee_id = 103;
-- ✅ manager_id is set to NULL for John

-- Delete non-existent parent (employee_id = 150)
DELETE FROM employees_copy WHERE employee_id = 150;
-- ✅ No error (no matching parent row)

-- =======================================================
-- Case 3: ON DELETE CASCADE
-- =======================================================
DROP TABLE managers;
CREATE TABLE managers (
    manager_id     NUMBER,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER NOT NULL,
    phone_number   VARCHAR2(20) UNIQUE NOT NULL,
    email          VARCHAR2(100) UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy (employee_id) ON DELETE CASCADE
);

-- Insert again
INSERT INTO managers VALUES (104, 'John2', 'King', 90, '123-456-780', 'jking2');
INSERT INTO managers VALUES (105, 'John3', 'King', 90, '123-456-781', 'jking3');

-- Delete parent (104)
DELETE FROM employees_copy WHERE employee_id = 104;
-- ✅ Automatically deletes matching manager row

-- Update parent key
UPDATE employees_copy
SET employee_id = 300
WHERE employee_id = 105;
-- ❌ Error: cannot update PK referenced by FK
