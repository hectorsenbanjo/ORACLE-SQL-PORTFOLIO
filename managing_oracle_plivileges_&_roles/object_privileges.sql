-- ============================================================
-- Story: Object Privileges in Oracle
-- Demonstrating grants and testing them as different users
-- ============================================================

-- ============================================================
-- Connected as HR
-- ============================================================

-- Check the table
SELECT * FROM employees_copy;

-- Grant specific object privileges
GRANT SELECT, DELETE ON employees_copy TO temp_user, developer;
GRANT UPDATE (salary, commission_pct) ON employees_copy TO temp_user;
GRANT UPDATE ON employees_copy TO developer;

-- Grant INSERT to all users
GRANT INSERT ON employees_copy TO PUBLIC;

-- Grant all privileges on the table to TEMP_USER
GRANT ALL ON employees_copy TO temp_user;

-- Grant tablespace quota for TEMP_USER
GRANT UNLIMITED TABLESPACE TO temp_user;

-- ============================================================
-- Connected as TEMP_USER
-- ============================================================

-- Access the table (directly and with schema prefix)
SELECT * FROM employees_copy;
SELECT * FROM hr.employees_copy;

-- Update columns (requires granted privileges)
UPDATE hr.employees_copy SET salary = 100;
UPDATE hr.employees_copy SET manager_id = 100;

-- Insert new row
INSERT INTO hr.employees_copy (
    employee_id, first_name, last_name, email, hire_date, job_id, salary
) VALUES (
    207, 'Alex', 'Brown', 'ABROWN', SYSDATE, 'IT_PROG', 5000
);

-- Create an index on the HR-owned table
CREATE INDEX idx_emp_cpy ON hr.employees_copy(email);

-- Check object privileges granted
SELECT * FROM user_tab_privs;
