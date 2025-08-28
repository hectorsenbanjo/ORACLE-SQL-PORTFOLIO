# 🔑 Story: Changing a User’s Password in Oracle

Imagine you’re an Oracle DBA and your developer **forgets their password**.  
Instead of recreating the user, you can simply **reset the password**.

---

## 1️⃣ Creating the User (for demo)

We create a user called **`temp_user`** with a starter password:

```sql
CREATE USER temp_user IDENTIFIED BY "123" 
    ACCOUNT UNLOCK 
    CONTAINER = CURRENT;

GRANT CREATE SESSION TO temp_user CONTAINER = CURRENT;

This ensures the account is active and the user can log in.

2️⃣ Changing the Password

Now suppose the developer requests a new password.
We use the ALTER USER command:

ALTER USER temp_user IDENTIFIED BY abc123;


This changes the password from "123" → "abc123".

3️⃣ Verifying the User

To confirm the account exists and is open:

SELECT username, account_status, created 
FROM dba_users
WHERE username = 'TEMP_USER';


You should see TEMP_USER with status OPEN.

✅ Conclusion

Users don’t need to be dropped and recreated when they forget a password.

A DBA can simply run ALTER USER … IDENTIFIED BY ….
