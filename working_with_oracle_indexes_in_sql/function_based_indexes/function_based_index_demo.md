# Function-Based Index Demo in Oracle

This demo shows the difference between **normal B-tree indexes** and **function-based indexes (FBI)** in Oracle Database.

---

## Story

Imagine you’re working in HR and need to speed up lookups on employee last names.  
You first create a **normal index** on the `last_name` column of a copy of the `employees` table.

```sql
CREATE INDEX emp_cpy_lname_idx ON employees_copy (last_name);

Now if you query:

SELECT * FROM employees_copy WHERE last_name = 'KING';


✅ The index is used.

But if you query with a function:

SELECT * FROM employees_copy WHERE UPPER(last_name) = 'KING';


❌ The index is ignored because Oracle cannot apply it on a transformed value (UPPER).

Fix with Function-Based Index

You drop the normal index and instead create a function-based index:

CREATE INDEX emp_cpy_fname_idx ON employees_copy (UPPER(last_name));


Now this query can use the index:

SELECT * FROM employees_copy WHERE UPPER(last_name) = 'KING';


But this one may not:

SELECT * FROM employees_copy WHERE last_name = 'KING';

Key Lesson

Normal index → works only when the column is queried directly.

Function-based index → works when queries apply the same function to the column.

Use function-based indexes when your queries often apply transformations like UPPER(), LOWER(), TRUNC(), or calculations on columns.
