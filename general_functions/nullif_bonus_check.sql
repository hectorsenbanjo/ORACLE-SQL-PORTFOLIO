-- nullif_bonus_check.sql
SELECT 
    employee_id,
    last_name,
    salary,
    commission_pct,
    NULLIF(commission_pct, 0) AS bonus_check
FROM 
    employees;
