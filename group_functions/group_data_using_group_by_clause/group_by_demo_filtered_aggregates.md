# 🧩 Demonstrating GROUP BY Clause: Filtered Aggregates by Job Role

### 🎯 Objective
Show how to use the `GROUP BY` clause alongside multiple aggregate functions on a filtered dataset.  
This query summarizes key statistics for a selected set of job roles.

---

### 📄 SQL Query

```sql
SELECT 
    job_id,
    SUM(salary) AS total_salary,
    MAX(hire_date) AS most_recent_hire,
    COUNT(*) AS num_of_employees
FROM 
    employees
WHERE 
    job_id IN ('IT_PROG', 'ST_MAN', 'AC_ACCOUNT')
GROUP BY 
    job_id;
