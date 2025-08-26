# Bitmap Index on commission_pct

In this demo, we explore **bitmap indexes** using the `employees_copy` table.  

---

## Step 1: Create the Bitmap Index

We create a bitmap index on the `commission_pct` column:

```sql
CREATE BITMAP INDEX emp_cpy_comm_idx 
ON employees_copy (commission_pct);

Step 2: Run a Query Using the Index

Now we run a query to find all employees with a commission percentage of 0.4:

SELECT * 
FROM employees_copy 
WHERE commission_pct = 0.4;

🔎 What We Did

Bitmap Index

Stores row IDs as bitmaps (0s and 1s) for each distinct value.

Very efficient when the column has low cardinality (few distinct values), such as commission_pct.

Why Not a B-tree?

A B-tree index is better for high-cardinality columns (like employee_id).

A bitmap index shines in queries like this, where we filter on a column with only a few distinct values.

✅ Conclusion: This is a bitmap index that optimizes lookups on the commission_pct column.
