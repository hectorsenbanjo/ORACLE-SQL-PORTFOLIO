-- ============================================================
-- Story: Changing a User Password in Oracle
-- ============================================================

-- Step 1: Create the demo user (if not exists)
CREATE USER temp_user IDENTIFIED BY "123" 
    ACCOUNT UNLOCK 
    CONTAINER = CURRENT;

GRANT CREATE SESSION TO temp_user CONTAINER = CURRENT;

-- Step 2: Change the password
ALTER USER temp_user IDENTIFIED BY abc123;

-- Step 3: Verify the user exists
SELECT username, account_status, created 
FROM dba_users
WHERE username = 'TEMP_USER';

-- Step 4 (Optional): Clean up
-- DROP USER temp_user CASCADE;
