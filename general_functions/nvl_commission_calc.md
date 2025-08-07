# 💼 Oracle SQL: Calculating Commission Using NVL

This SQL query tells a simple story:

- We are analyzing **employees whose last names start with 'E'**.
- For these employees, we want to calculate their **monthly commission**.
- The formula used is:  
  `NVL(commission_pct, 0) * salary + 1000`

Why `NVL`?  
Because some employees don’t earn a commission. If `commission_pct` is `NULL`, we treat it as `0` to avoid calculation errors.

### 💡 Key Learning
The `NVL` function helps in:
- Avoiding `NULL` issues in arithmetic
- Providing default values
- Writing cleaner conditional logic in SQL

### 🔍 Query Breakdown
```sql
SELECT 
    last_name,
    salary,
    commission_pct,
    NVL(commission_pct, 0) * salary + 1000 AS monthly_commission
FROM 
    employees
WHERE 
    last_name LIKE 'E%';
