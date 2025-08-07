# NULLIF: Bonus Check for Commission

This query demonstrates the use of the `NULLIF` function to check whether an employee’s `commission_pct` is 0. If it is, `NULLIF` returns `NULL`, indicating no bonus is given. Otherwise, it returns the `commission_pct` itself.

### How it Works:
- If `commission_pct = 0`, `NULLIF` returns `NULL`
- If `commission_pct ≠ 0`, `NULLIF` returns the original `commission_pct`

This helps differentiate between employees with no bonus and those who receive some commission.

### Example Query

```sql
SELECT 
    employee_id,
    last_name,
    salary,
    commission_pct,
    NULLIF(commission_pct, 0) AS bonus_check
FROM 
    employees;
