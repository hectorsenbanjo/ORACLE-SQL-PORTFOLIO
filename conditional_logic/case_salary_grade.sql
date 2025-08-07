-- case_salary_grade.sql
SELECT 
    employee_id,
    last_name,
    salary,
    CASE 
        WHEN salary >= 20000 THEN 'A - Executive'
        WHEN salary BETWEEN 10000 AND 19999 THEN 'B - Manager'
        WHEN salary BETWEEN 5000 AND 9999 THEN 'C - Associate'
        ELSE 'D - Entry Level'
    END AS salary_grade
FROM 
    employees;
