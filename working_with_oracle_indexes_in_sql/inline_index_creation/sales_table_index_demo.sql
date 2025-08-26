-- Drop the table if it exists
DROP TABLE sales PURGE;

-- Create the sales table with inline unique indexes
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

-- Test query
SELECT * 
FROM sales 
WHERE sale_id = 201 
  AND transaction_id = 30123;
