# 🏗️ Story: Granting Table and View Creation Privileges in Oracle PDB

Imagine you’re an Oracle DBA working with pluggable databases (PDBs).  
Your task is to **create a new user** and allow them to build their own **tables** and **views**.  
Here’s how the story unfolds:

---

## 1️⃣ Creating the User

We begin by creating a new user called **`temp_user`** inside the current PDB:

```sql
CREATE USER temp_user IDENTIFIED BY "123" 
    ACCOUNT UNLOCK 
    CONTAINER = CURRENT;

2️⃣ Granting Login Privilege

A user cannot do anything unless they can log in.
We grant the create session privilege:

GRANT CREATE SESSION TO temp_user 
    CONTAINER = CURRENT;

3️⃣ Granting Object Creation Privileges

Now, we give the user power to create tables and views.
We also include the WITH ADMIN OPTION so they can pass on these privileges to others:

GRANT CREATE TABLE, CREATE VIEW TO temp_user 
    WITH ADMIN OPTION 
    CONTAINER = CURRENT;

4️⃣ Verifying the Privileges

To confirm, query the DBA_SYS_PRIVS view:

SELECT * FROM dba_sys_privs 
WHERE grantee = 'TEMP_USER';


You should see CREATE TABLE and CREATE VIEW listed. ✅

5️⃣ Wrap Up

By following this process, you:

Created a new user inside a pluggable database.

Granted them the ability to log in.

Allowed them to create tables and views.

Verified their privileges in the database dictionary.

💡 This is a fundamental DBA workflow for managing user permissions in an Oracle multitenant environment.
