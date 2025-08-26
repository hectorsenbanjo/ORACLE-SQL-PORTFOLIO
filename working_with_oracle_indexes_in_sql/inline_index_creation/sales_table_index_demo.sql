-- Drop the table if it exists
DROP TABLE sales PURGE;

-- Create the sales table with inline indexes
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

-- Sample query that should leverage indexes
SELECT * 
FROM sales 
WHERE sale_id = 201 
  AND transaction_id = 30123;

-- In SQL Developer: Highlight the query and press SHIFT + F4
-- to open the Explain Plan window and verify if indexes are used.
