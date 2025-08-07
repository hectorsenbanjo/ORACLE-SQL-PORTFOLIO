-- avg_salary_by_department.sql
-- This query calculates the average salary for each department.

SELECT 
    department_id,
    ROUND(AVG(salary), 2) AS avg_salary
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    avg_salary DESC;
