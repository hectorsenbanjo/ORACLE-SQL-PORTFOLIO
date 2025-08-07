SELECT 
    job_id, 
    MAX(salary) AS max_salary
FROM 
    employees
GROUP BY 
    job_id;
