# Deleting Rows from the EMPLOYEES Table (HR Schema)

This example demonstrates how to **delete a row** from the `EMPLOYEES` table in the HR schema.

---

## 1️⃣ Delete a Specific Employee
We delete the row where the `EMPLOYEE_ID` equals **206**:

```sql
DELETE FROM employees
WHERE employee_id = 206;

2️⃣ Verify the Deletion

Run a check to confirm the row has been removed:

SELECT *
FROM employees
WHERE employee_id = 206;

3️⃣ Commit the Changes

Save the deletion permanently:

COMMIT;
