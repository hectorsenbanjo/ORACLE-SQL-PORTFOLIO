-- ============================================================
-- check_constraint_demo.sql
-- Demo of Oracle CHECK constraint enforcing business rules
-- Works in SQL*Plus, SQLcl, and SQL Developer (run as script).
-- ============================================================

-- Drop table if it exists
DROP TABLE managers2 CASCADE CONSTRAINTS;

-- =============================================
-- Part 1: Simple CHECK constraint on salary
-- =============================================
CREATE TABLE managers2
(
   manager_id NUMBER,
   first_name VARCHAR2(50),
   salary     NUMBER, 
   CONSTRAINT salary_check CHECK (salary > 100 AND salary < 50000)
);

-- Attempt to insert an invalid row (salary too low) -> FAIL
INSERT INTO managers2 VALUES(1, 'Steven', 50);

-- Valid insert (salary in range) -> SUCCESS
INSERT INTO managers2 VALUES(2, 'Steven', 500);

-- Attempt to update with invalid salary -> FAIL
UPDATE managers2 
SET salary = 20
WHERE manager_id = 2;

-- Cleanup before next part
DROP TABLE managers2 CASCADE CONSTRAINTS;

-- =============================================
-- Part 2: Compound CHECK constraint
-- Salary must be in range AND email must end with .COM
-- =============================================
CREATE TABLE managers2 (
    manager_id NUMBER,
    first_name VARCHAR2(50),
    salary NUMBER,
    email VARCHAR2(100),
    CONSTRAINT demo_check CHECK (
        salary > 100 
        AND salary < 50000 
        AND UPPER(email) LIKE '%.COM'
    )
);

-- Attempt invalid email -> FAIL
INSERT INTO managers2 VALUES (3, 'St
