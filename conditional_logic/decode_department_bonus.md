# DECODE: Assigning Department-Based Bonuses

The `DECODE` function in Oracle SQL works like a simplified `CASE` statement, allowing you to transform values conditionally.

### Scenario:
A company wants to calculate **bonus amounts** for employees based on their `department_id`. Each department has a fixed bonus percentage:
- Department 10 → 10%
- Department 20 → 15%
- Department 30 → 20%
- Department 40 → 25%
- All other departments → 0%

### Query Breakdown:
```sql
SELECT 
    employee_id,
    last_name,
    department_id,
    salary,
    DECODE(department_id,
        10, salary * 0.1,
        20, salary * 0.15,
        30, salary * 0.2,
        40, salary * 0.25,
        0) AS department_bonus
FROM 
    employees;

How It Works:
The DECODE function checks the department_id.

If it matches 10, 20, 30, or 40, a bonus is calculated accordingly.

If it doesn’t match any of the above, the bonus is 0.





