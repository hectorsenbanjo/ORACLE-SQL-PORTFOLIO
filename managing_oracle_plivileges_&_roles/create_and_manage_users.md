# 👤 Managing Users in Oracle Multitenant Database

This demo shows how to **create, drop, inspect, and grant privileges to users** in an Oracle **pluggable database (PDB)** environment.  

---

## 🖥️ SQL Script (`manage_users.sql`)

```sql
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

📝 Explanation

CREATE USER – Defines a new database account with a password.

DROP USER – Removes the user; CASCADE is needed if the user owns tables, views, or other objects.

Password & account options – You can force a password reset, unlock accounts, and specify where the user is created (CDB or PDB).

Views to check users:

DBA_USERS: Complete list of users (DBA only).

ALL_USERS: All accessible users for the current session.

USER_USERS: Details about your account.

GRANT CREATE SESSION – The minimum privilege to allow login. Without this, the user cannot connect.
