# Using Inline Indexes in Oracle DDL

This demo shows how Oracle uses **inline index definitions** when creating a table.  
We’ll define a **primary key** and a **unique constraint** with explicitly named indexes, then check if the query optimizer uses them.

---

## Step 1: Drop the Table

```sql
DROP TABLE sales PURGE;

We start fresh by ensuring the sales table doesn’t exist.

Step 2: Create the Table with Inline Indexes
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
            CREATE UNIQUE INDEX sale_tran_id_idx ON sales(transaction_id)
        ),
    sale_detail_text VARCHAR2(4000)
);

sale_id → Primary Key, backed by a unique B-tree index (sales_sale_id_idx).

transaction_id → Unique constraint, also backed by a unique B-tree index (sale_tran_id_idx).

This ensures fast lookups on both columns.

Step 3: Insert Data
INSERT INTO sales VALUES (201, DATE '2023-01-01', 1001, 30123, 'Demo sale 1');
INSERT INTO sales VALUES (202, DATE '2023-01-02', 1002, 30124, 'Demo sale 2');
COMMIT;


Now we have data to query.

Step 4: Run a Query with Both Columns
SELECT * 
FROM sales
WHERE sale_id = 201
  AND transaction_id = 30123;


This query matches one row. Both filter columns (sale_id and transaction_id) are indexed.

Step 5: Check the Execution Plan

In SQL Developer: highlight the query and press Shift+F4.
Or use the classic approach:

EXPLAIN PLAN FOR
SELECT * 
FROM sales
WHERE sale_id = 201
  AND transaction_id = 30123;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

Expected Plan (simplified)
-----------------------------------------------------------------------------------
| Id  | Operation                   | Name                | Rows | Bytes | Cost |
-----------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |                     |    1 |   100 |    2 |
|   1 |  TABLE ACCESS BY INDEX ROWID| SALES               |    1 |   100 |    2 |
|*  2 |   INDEX UNIQUE SCAN         | SALES_SALE_ID_IDX   |    1 |       |    1 |
-----------------------------------------------------------------------------------

Predicate Information:
  2 - access("SALE_ID"=201)
      filter("TRANSACTION_ID"=30123)


Oracle uses the primary key index on sale_id.

It then applies the transaction_id filter.

Alternatively, it could use the unique index on transaction_id first.

Step 6: Key Insight

Oracle does not need to scan both indexes simultaneously.
It chooses the most selective index (often the PK) and filters the other column.

If you wanted both columns to be used together efficiently, you could create a composite index:

CREATE UNIQUE INDEX sale_composite_idx 
    ON sales(sale_id, transaction_id);

✅ This demo shows how inline index definitions work in Oracle DDL and how the optimizer uses them in practice.
