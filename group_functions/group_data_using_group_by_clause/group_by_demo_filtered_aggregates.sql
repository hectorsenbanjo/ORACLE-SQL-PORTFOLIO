-- Title: Demonstrating GROUP BY with Filtered Aggregates: Job-Based Employee Summary
-- Description: This query filters the employees table to selected job roles,
-- then uses GROUP BY to aggregate salary, hire date, and count per job_id.

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
