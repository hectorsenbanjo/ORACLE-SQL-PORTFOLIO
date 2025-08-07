-- decode_department_bonus.sql
SELECT 
    employee_id,
    last_name,
    department_id,
    salary,
    DECODE(department_id,
        10, salary * 0.1,
        20, salary * 0.15,
        30, salary * 0.2,
        40, salary * 0.25,
        0) AS department_bonus
FROM 
    employees;
