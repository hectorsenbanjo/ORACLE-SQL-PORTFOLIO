# NVL2: Commission Eligibility

This query uses `NVL2` to determine whether an employee is eligible for commission based on the `commission_pct` column.

- If `commission_pct` is not null, return `'Eligible'`
- Otherwise, return `'Not Eligible'`

### Example Query

```sql
SELECT 
    last_name,
    salary,
    commission_pct,
    NVL2(commission_pct, 'Eligible', 'Not Eligible') AS commission_status
FROM 
    employees;
