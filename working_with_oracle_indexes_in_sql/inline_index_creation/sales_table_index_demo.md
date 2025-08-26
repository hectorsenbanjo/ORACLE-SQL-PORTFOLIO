# Table with Inline Indexes on `sales`

In this demo, we create a `sales` table that demonstrates **two types of indexes**:

---

## Step 1: Create the Table

We define the `sales` table with both **unique B-tree** and **bitmap indexes** created inline:

```sql
CREATE TABLE sales (
    sale_id NUMBER 
        PRIMARY KEY 
        USING INDEX (
            CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)
        ),
    sale_date DATE NOT NULL,
    customer_id NUMBER NOT NULL,
    transaction_id NUMBER 
        UNIQUE 
        USING INDEX (
            CREATE BITMAP INDEX sale_tran_id_idx ON sales(transaction_id)
        ),
    sale_detail_text VARCHAR2(4000)
);

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

