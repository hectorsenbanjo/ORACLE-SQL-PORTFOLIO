# 🔐 Story: Exploring User Privileges in Oracle

In Oracle, privileges determine what a user **can or cannot do**.  
Let’s explore this with a demo user called **`TEMP_USER`**.

---

## 1️⃣ Checking Privileges as TEMP_USER

First, we log in as `TEMP_USER` and run:

```sql
SELECT * FROM user_sys_privs;

This shows the system privileges assigned to TEMP_USER.

If we try:

SELECT * FROM dba_sys_privs;


This usually fails, because TEMP_USER doesn’t have access to DBA views.

Next, let’s test the privileges:

CREATE TABLE temp_table (temp_column NUMBER);


If this succeeds, it means TEMP_USER has CREATE TABLE privileges.
We can also confirm active session privileges:

SELECT * FROM session_privs;

2️⃣ Granting Privileges as SYS

As the DBA (SYS), we can see all system privileges:

SELECT * FROM system_privilege_map;


Now, let’s give TEMP_USER some rights:

GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = ALL;


This allows TEMP_USER to create tables and views in all pluggable databases.

Alternatively, if we only want the privilege in the current container:

GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = CURRENT;

✅ Conclusion

USER_SYS_PRIVS → Shows privileges for the current user.

SESSION_PRIVS → Shows what is active in the session.

SYSTEM_PRIVILEGE_MAP → DBA-level list of all possible system privileges.

Grants can be scoped per container (CURRENT) or all containers (ALL) in a multitenant Oracle environment.

This demo highlights the difference between a normal user and a DBA in managing privileges.
