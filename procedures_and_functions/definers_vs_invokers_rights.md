# Exploring Definer’s Rights vs Invoker’s Rights in Oracle

In Oracle, stored procedures and views can run under two different security models:  
- **Definer’s Rights**: Executes with the privileges of the procedure’s creator.  
- **Invoker’s Rights**: Executes with the privileges of the calling user.  

This demo shows how these concepts affect what users can do.

---

## Step 1: TEMP_USER Creates a Table and Procedure
The `temp_user` creates a table and a stored procedure that inserts values into it.

```sql
CREATE TABLE temp_table (temp_column VARCHAR2(100));

CREATE OR REPLACE PROCEDURE insert_into_temp_table (insert_value IN VARCHAR2) IS
BEGIN
    INSERT INTO temp_table VALUES (insert_value);
END;

The procedure initially runs as Definer’s Rights by default.
The hr user is granted the right to execute it.

Step 2: Testing Definer’s Rights

TEMP_USER runs the procedure and inserts a value:

EXEC temp_user.insert_into_temp_table('User: TEMP_USER --> Procedure: Definer''s Rights');


Even if hr does not have direct insert privileges on temp_user’s table, the call works because the procedure uses the definer’s privileges.

Step 3: Switching to Invoker’s Rights

We modify the procedure to use Invoker’s Rights:

CREATE OR REPLACE PROCEDURE insert_into_temp_table (insert_value IN VARCHAR2) AUTHID CURRENT_USER IS
BEGIN
    INSERT INTO temp_table VALUES (insert_value);
END;


Now, when hr executes the procedure, Oracle checks hr’s privileges on the table. If hr does not have INSERT access, the call fails.

Step 4: Functions and Views

TEMP_USER also tests the difference with functions and views.

A function returns the last record from a table.

A view is created with either BEQUEATH DEFINER or BEQUEATH CURRENT_USER.

CREATE OR REPLACE VIEW temp_view BEQUEATH DEFINER AS
    SELECT get_last_record_from_temp_table temp_text FROM dual;


When HR queries the view, the behavior changes depending on whether it inherits the definer’s or invoker’s rights.

Step 5: HR’s Perspective

From HR’s session:

Direct insert into temp_user’s table is not allowed.

Executing procedures behaves differently depending on AUTHID.

Querying the view returns results only if privileges align with the security model.

INSERT INTO temp_user.temp_table VALUES ('User: HR --> Direct Insert - Privilege: No');
EXEC temp_user.insert_into_temp_table('User: HR --> Procedure Test');
SELECT * FROM temp_user.temp_view;

✅ Conclusion

This exercise demonstrates:

Definer’s Rights let procedures/views run with the privileges of the owner.

Invoker’s Rights enforce the caller’s privileges.

Views with BEQUEATH DEFINER or CURRENT_USER allow fine-grained control over security.

This concept is crucial in Oracle security and application development, especially when granting limited access to sensitive objects.
