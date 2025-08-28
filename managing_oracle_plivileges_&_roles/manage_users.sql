-- Step 1: Create a simple user with a password
CREATE USER temp_user IDENTIFIED BY 123;

-- Step 2: Drop the user (no CASCADE, fails if user owns objects)
DROP USER temp_user;

-- Step 3: Create user with more options
-- - Password expires immediately (forces reset on next login)
-- - Account is unlocked
-- - Create in current container (useful in multitenant setup)
CREATE USER temp_user IDENTIFIED BY 123 PASSWORD EXPIRE ACCOUNT UNLOCK CONTAINER=CURRENT;

-- Step 4: Drop user forcefully, removing schema and objects
DROP USER temp_user CASCADE;

-- Step 5: Inspect users in the database
-- DBA_USERS: All users in the database (requires DBA privilege)
SELECT username, account_status, created FROM dba_users;

-- ALL_USERS: All users visible to current user
SELECT username FROM all_users;

-- USER_USERS: Information about the current connected user
SELECT username FROM user_users;

-- Step 6: Grant minimal privilege to allow login
GRANT CREATE SESSION TO temp_user;
