# 📖 Heap Table Demo (Continuous Story)

In this demo, we create a **heap table**, insert rows with a **subquery**,  
and then modify the table structure as business needs change.

---

## 🏗️ Create, Populate, and Modify the Heap Table

We begin by creating a simple `sales_heap` table to track sales.  
Heap tables are the default in Oracle, storing rows without order, which makes inserts fast:

```sql
CREATE TABLE sales_heap (
    sale_id     NUMBER(5) PRIMARY KEY,
    customer_id NUMBER(5),
    product_id  NUMBER(5),
    quantity    NUMBER(3),
    sale_date   DATE DEFAULT SYSDATE
);

--Next, instead of typing values manually, we populate the table with a subquery.
We pull sample data from the OE schema’s customers and products tables:

INSERT INTO sales_heap (sale_id, customer_id, product_id, quantity, sale_date)
SELECT rownum, c.customer_id, p.product_id, 1, SYSDATE
FROM customers c
JOIN products p ON ROWNUM <= 5
WHERE c.customer_id < 105;

COMMIT;

Once data is loaded, new requirements arrive from the business:

The sales team wants to track discounts

Quantity needs higher precision

Later, discounts are dropped again

We adjust the table step by step:

-- Add a discount column
ALTER TABLE sales_heap ADD discount NUMBER(5,2) DEFAULT 0;

-- Modify quantity to allow larger values
ALTER TABLE sales_heap MODIFY quantity NUMBER(5);

-- Drop the discount column when no longer needed
ALTER TABLE sales_heap DROP COLUMN discount;

