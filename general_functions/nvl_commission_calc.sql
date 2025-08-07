-- A commission bonus tale using NVL
-- We want to calculate the monthly commission for all employees
-- whose last name starts with 'E'.
-- If the employee has no commission percentage (null), we treat it as 0.

SELECT 
    last_name,
    salary,
    commission_pct,
    NVL(commission_pct, 0) * salary + 1000 AS monthly_commission
FROM 
    employees
WHERE 
    last_name LIKE 'E%';
