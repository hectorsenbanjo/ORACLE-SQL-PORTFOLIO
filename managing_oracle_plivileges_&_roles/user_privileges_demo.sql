-- ============================================================
-- Story: Understanding User Privileges in Oracle
-- ============================================================

-- ============================================================
-- SECTION 1: Temp_User Perspective
-- ============================================================

-- Logged in as TEMP_USER
-- Check the privileges available to this user
SELECT * FROM user_sys_privs;

-- Attempt to see system-level grants (requires higher privileges, may fail)
SELECT * FROM dba_sys_privs;

-- Try to create a simple table
CREATE TABLE temp_table (temp_column NUMBER);

-- View active privileges in the current session
SELECT * FROM session_privs;

-- ============================================================
-- SECTION 2: SYS Perspective (DBA actions)
-- ============================================================

-- Logged in as SYS
-- Explore available system privileges
SELECT * FROM system_privilege_map;

-- Grant CREATE TABLE and CREATE VIEW to TEMP_USER at all containers
GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = ALL;

-- Grant the same but only in the current container
GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = CURRENT;

-- ============================================================
-- Clean up (Optional)
-- DROP USER temp_user CASCADE;
