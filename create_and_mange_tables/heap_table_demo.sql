-- ================================================================
-- heap_table_demo.sql
-- Storytelling demo in SQL Developer:
-- Create a heap table, insert rows using a subquery, then modify it.
-- ================================================================

-- Step 1: Create a heap table for recording sales
CREATE TABLE sales_heap (
    sale_id     NUMBER(5) PRIMARY KEY,
    customer_id NUMBER(5),
    product_id  NUMBER(5),
    quantity    NUMBER(3),
    sale_date   DATE DEFAULT SYSDATE
);

-- Step 2: Populate the table with initial data using a subquery
-- We pull customers and products from the OE schema as sample data.
INSERT INTO sales_heap (sale_id, customer_id, product_id, quantity, sale_date)
SELECT rownum, c.customer_id, p.product_id, 1, SYSDATE
FROM customers c
JOIN products p ON ROWNUM <= 5
WHERE c.customer_id < 105;

COMMIT;

-- Step 3: Business change requests come in...
-- 3a. Sales team asks for a discount column
ALTER TABLE sales_heap
ADD discount NUMBER(5,2) DEFAULT 0;

-- 3b. Quantity column needs larger precision
ALTER TABLE sales_heap
MODIFY quantity NUMBER(5);

-- 3c. Later, discount tracking is dropped
ALTER TABLE sales_heap
DROP COLUMN discount;
