-- average_salary_by_department.sql

SELECT 
    department_id,
    ROUND(AVG(salary), 2) AS average_salary
FROM 
    employees
GROUP BY 
    department_id
ORDER BY 
    department_id;
