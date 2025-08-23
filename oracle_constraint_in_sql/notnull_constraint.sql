-- ==========================================================
-- Oracle Constraints in SQL Demo
-- Showcasing NOT NULL constraints: auto-named vs. user-named
-- ==========================================================

-- Explore JOBS table structure (has system-assigned NOT NULL constraints)
DESC jobs;

-- Attempt to insert NULL into job_title (auto-named NOT NULL constraint violation)
INSERT INTO jobs VALUES (100, NULL, 1, 10000);

-- Insert with valid job_title (succeeds)
INSERT INTO jobs VALUES (100, 'My_Job', 1, 10000);

-- Insert omitting job_title (defaults to NULL, fails if NOT NULL constraint exists)
INSERT INTO jobs(job_id, min_salary, max_salary)
VALUES (100, 1, 10000);

-- Create MANAGERS table with a user-named NOT NULL constraint
CREATE TABLE managers (
    manager_id    NUMBER NOT NULL, -- auto-named constraint
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50) CONSTRAINT lname_not_null NOT NULL, -- user-named
    department_id NUMBER NOT NULL -- auto-named
);

-- Explore MANAGERS table structure
DESC managers;

-- Test user-named constraint violation (last_name is NULL → lname_not_null)
INSERT INTO managers(manager_id, first_name, department_id)
VALUES (200, 'Mark', 10);
