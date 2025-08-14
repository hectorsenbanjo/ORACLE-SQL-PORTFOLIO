/*
   Story:
   We want to find customers who have placed at least one order 
   with a total value greater than 100,000.

   Approach:
   1. Use EXISTS to check for qualifying orders per customer.
   2. Compare order_total against the threshold (numeric comparison).
   3. Sort results alphabetically by customer name.
*/

SELECT 
    cust_first_name, 
    cust_last_name, 
    cust_email
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
      AND o.order_total > 100000
)
ORDER BY cust_first_name, cust_last_name;
