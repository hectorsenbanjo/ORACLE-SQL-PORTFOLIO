# 🧩 Demonstrating GROUP BY Clause: Employee Hiring Report by Year, Job Role, and Salary

### 🎯 Objective
Demonstrate the use of the `GROUP BY` clause by analyzing how many employees were hired, grouped by:
- Hire year (`hire_date`)
- Job role (`job_id`)
- Salary

---

### 📄 SQL Query

```sql
SELECT 
    TO_CHAR(hire_date, 'YYYY') AS hire_year,
    job_id,
    salary,
    COUNT(*) AS num_of_hires
FROM 
    employees
GROUP BY 
    TO_CHAR(hire_date, 'YYYY'),
    job_id,
    salary
ORDER BY 
    num_of_hires DESC;
