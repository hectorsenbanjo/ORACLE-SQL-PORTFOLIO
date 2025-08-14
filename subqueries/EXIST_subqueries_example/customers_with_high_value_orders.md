# Customers with High-Value Orders

**Scenario:**  
The business wants a list of customers who have placed **at least one order** worth more than 100,000.

---

**SQL Query:**
```sql
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

**Data Preview:**
![Customers Table Sample](subqueries/EXIST_subqueries_example/image_customers_table.web)
