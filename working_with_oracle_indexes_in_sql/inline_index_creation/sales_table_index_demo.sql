-- =============================================================
-- sales_index_demo.sql
-- Demonstration of inline indexes (PK and UNIQUE) in table DDL
-- and how Oracle uses them in queries.
-- =============================================================

-- 1. Drop the table if it exists
DROP TABLE sales PURGE;

-- 2. Create the sales table with inline unique indexes
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

-- 3. Insert some sample data
INSERT INTO sales VALUES (201, DATE '2023-01-01', 1001, 30123, 'Demo sale 1');
INSERT INTO sales VALUES (202, DATE '2023-01-02', 1002, 30124, 'Demo sale 2');

COMMIT;

-- 4. Query filtering by both PK and UNIQUE columns
SELECT * 
FROM sales
WHERE sale_id = 201
  AND transaction_id = 30123;

-- 5. Get the explain plan to see if indexes are used
-- In SQL Developer: highlight the query above and press SHIFT+F4
-- Or use EXPLAIN PLAN FOR / DBMS_XPLAN:
EXPLAIN PLAN FOR
SELECT * 
FROM sales
WHERE sale_id = 201
  AND transaction_id = 30123;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- 6. Cleanup (optional)
-- DROP TABLE sales PURGE;
