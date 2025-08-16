-- ===========================================================
-- transaction_control_oe_demo.sql
-- Transaction Control Exercise in OE Schema (Steps 1–11)
-- Demonstrates INSERT, UPDATE, COMMIT, row-level locks,
-- concurrent session blocking, DELETE, TRUNCATE, and DDL vs DML.
-- ===========================================================

-- 1. Insert a new customer with a unique CUSTOMER_ID
INSERT INTO customers (customer_id, cust_first_name, cust_last_name)
VALUES (
   (SELECT MAX(customer_id) + 1 FROM customers),
   'John','Watson'
);

-- 2. Give Watson a credit limit = average credit limit
UPDATE customers
SET credit_limit = (SELECT AVG(credit_limit) FROM customers)
WHERE cust_last_name = 'Watson';

-- 3. Create another customer based on Watson, with unique ID
INSERT INTO customers (customer_id, cust_first_name, cust_last_name, credit_limit)
SELECT customer_id + 1, cust_first_name, cust_last_name, credit_limit
FROM customers
WHERE cust_last_name = 'Watson';

-- 4. Rename the second customer
UPDATE customers
SET cust_last_name = 'Ramklass',
    cust_first_name = 'Roopesh'
WHERE customer_id = (SELECT MAX(customer_id) FROM customers);

-- 5. Commit the transaction
COMMIT;

-- 6. Lock both Watson and Ramklass (first session)
SELECT customer_id, cust_last_name
FROM customers
WHERE cust_last_name IN ('Watson','Ramklass')
FOR UPDATE;

-- From another session (second session): try update → will hang
-- UPDATE customers SET credit_limit = 0;

-- 7. First session: release locks
COMMIT;

-- 8. Second session: update completes, then delete both rows
DELETE FROM customers
WHERE cust_last_name IN ('Watson','Ramklass');

-- 9. First session: try to truncate the table (blocked)
TRUNCATE TABLE customers;

-- 10. Second session: commit to unblock
COMMIT;

-- 11. Confirm state reset: check highest CUSTOMER_ID
SELECT MAX(customer_id) FROM customers;
