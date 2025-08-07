# 🧩 Demonstrating GROUP BY Clause: Count of Distinct Job IDs per Department

### 🎯 Objective
Group employees by department and count the number of unique `job_id` values per department.

---

### 📄 SQL Query

```sql
SELECT 
    department_id,
    COUNT(DISTINCT job_id) AS num_of_job_ids
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    department_id;
