# Creating a Unique Index on `employee_id`

Indexes are special lookup structures that improve query performance. In this demo, we create a **unique index** on the `employee_id` column in our `employees_copy` table.

---

## Step 1: Create the Table Copy

We start by making a working copy of the `employees` table:

```sql
DROP TABLE employees_copy;

CREATE TABLE employees_copy AS 
SELECT * FROM employees;

Step 2: Create a Unique Index

Now, let’s create an index on the employee_id column:

CREATE UNIQUE INDEX emp_cpy_eid_idx 
ON employees_copy (employee_id);

Step 3: Query the Table Using the Index

We can test how the index helps with searching:

SELECT * 
FROM employees_copy 
WHERE employee_id = 103;

📖 What Type of Index Did We Create?

This is a Unique B-tree Index on a single column (employee_id).

🔎 Breakdown:

Unique

Enforces that no two rows in the table have the same employee_id.

Adds a layer of data integrity, similar to a primary key.

Single-Column

Built only on employee_id.

If more columns were included, it would be a composite index.

B-tree Index (Default in Oracle)

Oracle uses B-trees for indexes unless you specify otherwise (e.g., bitmap).

Very efficient for:

Equality lookups (WHERE employee_id = ...)

Range scans (BETWEEN, <, >).

Sorting and joins.

✅ Summary:
We created a unique B-tree index on employee_id to ensure uniqueness and boost query performance.
