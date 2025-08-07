# 🎯 Oracle SQL: Using CASE Expression to Adjust Salaries

This query demonstrates how to apply **conditional logic** in SQL using the `CASE` expression.

### 💼 Business Scenario

The HR department decided to reward specific roles with salary increases:

- 🧾 **ST_CLERK** → 20% raise  
- 💼 **SA_REP** → 30% raise  
- 👨‍💻 **IT_PROG** → 40% raise  
- 📌 All other roles → No change

### 📊 Query

```sql
SELECT 
    first_name, 
    last_name, 
    job_id, 
    salary,  
    CASE job_id 
        WHEN 'ST_CLERK' THEN salary * 1.2
        WHEN 'SA_REP'   THEN salary * 1.3
        WHEN 'IT_PROG'  THEN salary * 1.4
        ELSE salary 
    END AS "UPDATED SALARY"
FROM employees;
