-- ================================================================
-- heap_table_demo.sql
-- Demonstration of creating a heap table, inserting rows with
-- subqueries, and modifying the table in SQL Developer.
-- ================================================================

-- 1. CREATE TABLE (Heap Table)
-- A heap table is the default table type in Oracle unless you
-- specify IOT, CLUSTER, or EXTERNAL.
CREATE TABLE sales_heap (
    sale_id     NUMBER(5) PRIMARY KEY,
    customer_id NUMBER(5),
    product_id  NUMBER(5),
    quantity    NUMBER(3),
    sale_date   DATE DEFAULT SYSDATE
);

-- 2. INSERT ROWS using a subquery
-- Suppose we want to copy some customers and products from OE schema
-- and simulate initial sales.
INSERT INTO sales_heap (sale_id, customer_id, product_id, quantity, sale_date)
SELECT rownum, c.customer_id, p.product_id, 1, SYSDATE
FROM customers c
JOIN products p ON ROWNUM <= 5
WHERE c.customer_id < 105;

-- Commit the transaction so data is saved.
COMMIT;

-- 3. ALTER TABLE: Add a new column for discount
ALTER TABLE sales_heap
ADD discount NUMBER(5,2) DEFAULT 0;

-- 4. ALTER TABLE: Modify a column (increase quantity precision)
ALTER TABLE sales_heap
MODIFY quantity NUMBER(5);

-- 5. ALTER TABLE: Drop a column (if not needed)
ALTER TABLE sales_heap
DROP COLUMN discount;
