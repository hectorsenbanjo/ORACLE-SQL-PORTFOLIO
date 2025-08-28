# 👥 Story: Roles and Synonyms in Oracle

Oracle lets you group privileges into **roles** for easier management.  
Users can be assigned roles, and roles can be **secured with passwords**.  
Synonyms make object names simpler and more flexible.

---

## 1️⃣ Creating a Role

We start by creating a role called `DEVELOPER`:

```sql
CREATE ROLE developer;
GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE TO developer;

2️⃣ Assigning the Role to a User

Before granting the role, we check the user’s privileges:

SELECT * FROM dba_sys_privs WHERE GRANTEE = 'TEMP_USER';


Then grant the role:

GRANT developer TO temp_user;


Now, TEMP_USER inherits those privileges. For example:

CREATE SEQUENCE temp_seq;


We can also verify:

SELECT * FROM user_role_privs;
SELECT * FROM session_privs;

3️⃣ Synonyms

A synonym is an alias for a table or object.

For example:

CREATE SYNONYM temp_synonym FOR temp_table;


If the user doesn’t have the privilege, we can extend the role:

GRANT CREATE SYNONYM TO developer;

4️⃣ Password-Protected Roles

Roles can be secured with a password:

CREATE ROLE test_role IDENTIFIED BY 123;
GRANT test_role TO temp_user;
GRANT SELECT ANY TABLE TO test_role;

5️⃣ Activating Roles in a Session

Users can enable or disable roles dynamically:

SET ROLE test_role IDENTIFIED BY 123;
SET ROLE ALL;
SET ROLE test_role IDENTIFIED BY 123, developer;
SET ROLE NONE;
SET ROLE ALL EXCEPT test_role;


To test the privileges:

SELECT * FROM hr.employees;

✅ Conclusion

Roles simplify privilege management by grouping grants.

Roles can be enabled/disabled within a session.

Synonyms make database object names easier to use.

Password-protected roles provide extra security.

This demo shows how Oracle roles streamline user privilege management.
