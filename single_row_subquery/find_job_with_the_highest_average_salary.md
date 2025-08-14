# Job with the Highest Average Salary

**Scenario:**  
The HR team wants to identify which job role has the **highest average salary** in the company to inform future salary benchmarks.

**SQL Query:**
```sql
SELECT job_title
FROM jobs
NATURAL JOIN employees
GROUP BY job_title
HAVING AVG(salary) = (
    SELECT MAX(AVG(salary))
    FROM employees
    GROUP BY job_id
);
