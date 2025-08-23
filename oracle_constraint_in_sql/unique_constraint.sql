-- ==========================================================
-- Oracle Constraints in SQL Demo
-- Showcasing NOT NULL, UNIQUE, and Composite Constraints
-- ==========================================================

-- Create MANAGERS table with a variety of constraints
CREATE TABLE managers (
    manager_id    NUMBER CONSTRAINT mgr_mid_uk UNIQUE,        -- named UNIQUE constraint
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50),
    department_id NUMBER NOT NULL,                            -- auto-named NOT NULL
    phone_number  VARCHAR2(11) UNIQUE NOT NULL,               -- inline UNIQUE + NOT NULL (auto-named)
    email         VARCHAR2(100),
    UNIQUE (email),                                           -- table-level UNIQUE (auto-named)
    CONSTRAINT mgr_composite_uk UNIQUE (first_name, last_name, department_id) -- composite UNIQUE
);

-- Explore MANAGERS table structure
DESC managers;

-- Test Inserts to trigger constraint checks

-- 1. Valid row
INSERT INTO managers VALUES (1, 'Mark', 'Smith', 10, '08012345678', 'mark.smith@company.com');

-- 2. Duplicate manager_id → violates mgr_mid_uk
INSERT INTO managers VALUES (1, 'John', 'Doe', 20, '08098765432', 'john.doe@company.com');

-- 3. Duplicate phone_number → violates auto-named UNIQUE
INSERT INTO managers VALUES (2, 'Alice', 'Brown', 30, '08012345678', 'alice.brown@company.com');

-- 4. Duplicate email → violates auto-named UNIQUE
INSERT INTO managers VALUES (3, 'David', 'Lee', 40, '08055555555', 'mark.smith@company.com');

-- 5. Duplicate (first_name, last_name, department_id) → violates mgr_composite_uk
INSERT INTO managers VALUES (4, 'Mark', 'Smith', 10, '08066666666', 'duplicate@company.com');
