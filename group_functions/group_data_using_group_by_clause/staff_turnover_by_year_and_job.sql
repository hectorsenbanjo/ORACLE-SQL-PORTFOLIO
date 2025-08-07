-- Report: Staff Turnover by Year and Job
-- Description: This query returns the year, job_id, and number of employees
-- who left their jobs, grouped by year and job_id.

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
