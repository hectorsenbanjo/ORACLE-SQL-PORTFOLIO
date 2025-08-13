# Employees Who Have Reached the Maximum Salary for Their Job Title

**Scenario:**  
The HR team needs to find employees who have already reached the **maximum salary limit** for their job title, based on the `jobs` table reference data.

---

**SQL Query:**
```sql
SELECT employee_id, 
       first_name, 
       last_name, 
       job_id, 
       salary
FROM employees
WHERE (job_id, salary) IN (
    SELECT job_id, max_salary
    FROM jobs
);
