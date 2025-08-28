-- ============================================================
-- Story: Working with Roles and Synonyms in Oracle
-- ============================================================

-- ============================================================
-- Step 1: Create a Role
-- ============================================================
CREATE ROLE developer;

-- Grant privileges to the developer role
GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE TO developer;

-- Verify system privileges for the developer role
SELECT * FROM dba_sys_privs WHERE GRANTEE = 'DEVELOPER';

-- ============================================================
-- Step 2: Assign Role to a User
-- ============================================================
-- Check privileges of TEMP_USER before granting the role
SELECT * FROM dba_sys_privs WHERE GRANTEE = 'TEMP_USER';

-- Grant the developer role to TEMP_USER
GRANT developer TO temp_user;

-- Now TEMP_USER can use the privileges of the role
-- Create a sequence
CREATE SEQUENCE temp_seq;

-- View active roles and privileges
SELECT * FROM user_role_privs;
SELECT * FROM session_privs;

-- ============================================================
-- Step 3: Synonyms
-- ============================================================
-- TEMP_USER creates a synonym for easier access to objects
CREATE SYNONYM temp_synonym FOR temp_table;

-- If TEMP_USER doesn’t have synonym privileges, grant it to the role
GRANT CREATE SYNONYM TO developer;

-- ============================================================
-- Step 4: Secure Roles with Passwords
-- ============================================================
-- Create a password-protected role
CREATE ROLE test_role IDENTIFIED BY 123;

-- Assign the role to TEMP_USER
GRANT test_role TO temp_user;

-- Give test_role an extra system privilege
GRANT SELECT ANY TABLE TO test_role;

-- ============================================================
-- Step 5: Managing Roles in a Session
-- ============================================================
-- Activate the role with a password
SET ROLE test_role IDENTIFIED BY 123;

-- Enable all roles granted
SET ROLE ALL;

-- Enable specific roles only
SET ROLE test_role IDENTIFIED BY 123, developer;

-- Disable all roles
SET ROLE NONE;

-- Enable all except one role
SET ROLE ALL EXCEPT test_role;

-- Test access with SELECT from HR schema
SELECT * FROM hr.employees;

-- ============================================================
-- Cleanup
-- ============================================================
DROP ROLE test_role;
