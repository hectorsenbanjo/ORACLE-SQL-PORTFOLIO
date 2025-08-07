# CASE Expression: Categorizing Employees by Salary Grade

The `CASE` expression in Oracle SQL allows us to evaluate multiple conditions and return a value based on the first true match.

### Scenario:
HR wants to **categorize employees** into salary grades:
- **A - Executive**: Salary ≥ 20,000
- **B - Manager**: Salary between 10,000 and 19,999
- **C - Associate**: Salary between 5,000 and 9,999
- **D - Entry Level**: Salary < 5,000

### Query Example:
```sql
SELECT 
    employee_id,
    last_name,
    salary,
    CASE 
        WHEN salary >= 20000 THEN 'A - Executive'
        WHEN salary BETWEEN 10000 AND 19999 THEN 'B - Manager'
        WHEN salary BETWEEN 5000 AND 9999 THEN 'C - Associate'
        ELSE 'D - Entry Level'
    END AS salary_grade
FROM 
    employees;

Why Use CASE?

It's versatile: You can check for ranges, values, or complex expressions.

Helps you customize output without altering the underlying data.

Makes queries more readable when dealing with business logic.

📌 Use CASE instead of DECODE when your logic requires evaluating ranges, conditions, or complex rules.





