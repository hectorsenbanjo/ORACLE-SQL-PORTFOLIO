-- ================================================
-- Composite Primary Key Demo
-- Demonstrates how to enforce uniqueness across
-- multiple columns using a PRIMARY KEY constraint.
-- ================================================

-- Drop table if it exists
DROP TABLE executives;

-- Create table with a composite primary key
CREATE TABLE executives (
    executive_id NUMBER,
    first_name   VARCHAR2(50),
    last_name    VARCHAR2(50),
    CONSTRAINT exec_eid_pk PRIMARY KEY (executive_id, last_name)
);

-- =========================
-- Test Constraint Behavior
-- =========================

-- ✅ Valid insert
INSERT INTO executives VALUES (100, 'John', 'Goodman');

-- ❌ NULL not allowed in last_name (part of PK)
INSERT INTO executives VALUES (101, 'Alice', NULL);

-- ❌ Duplicate (executive_id, last_name) not allowed
INSERT INTO executives VALUES (100, 'Mark', 'Goodman');

-- ✅ Different combination works
INSERT INTO executives VALUES (100, 'John', 'Smith');

-- View results
SELECT * FROM executives;
