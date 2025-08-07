# 📉 Staff Turnover Report by Year and Job

### 🎯 Objective
Generate a report that lists the **number of employees who left their jobs**, grouped by:
- Year (`end_date`),
- Job role (`job_id`).

The output is sorted in **descending order of turnover volume**.

---

### 📄 SQL Query

```sql
SELECT 
    EXTRACT(YEAR FROM end_date) AS year_left,
    job_id,
    COUNT(*) AS num_of_leavers
FROM 
    job_history
GROUP BY 
    EXTRACT(YEAR FROM end_date), job_id
ORDER BY 
    num_of_leavers DESC;
