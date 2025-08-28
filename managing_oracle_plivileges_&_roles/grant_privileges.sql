-- ============================================================
-- Story: Granting Object Creation Privileges to temp_user
-- ============================================================

-- Step 1: Create a demo user (if not already exists)
CREATE USER temp_user IDENTIFIED BY "123" 
    ACCOUNT UNLOCK 
    CONTAINER = CURRENT;

-- Step 2: Grant session privilege (so user can log in)
GRANT CREATE SESSION TO temp_user 
    CONTAINER = CURRENT;

-- Step 3: Grant object creation privileges
GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = CURRENT;

-- Step 4: Verification query
SELECT * FROM dba_sys_privs 
WHERE grantee = 'TEMP_USER';

-- Step 5 (Optional): Clean up
-- DROP USER temp_user CASCADE;
