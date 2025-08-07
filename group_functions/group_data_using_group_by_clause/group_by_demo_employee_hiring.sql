-- Title: Demonstrating GROUP BY Clause: Employee Hiring Report by Year, Job Role, and Salary
-- Description: This query demonstrates how to use the GROUP BY clause to analyze hiring trends.
-- It groups employee data by the year of hire, job role, and salary, and counts how many were hired.

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
