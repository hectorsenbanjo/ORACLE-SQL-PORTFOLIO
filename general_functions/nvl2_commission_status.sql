-- nvl2_commission_status.sql
SELECT 
    last_name,
    salary,
    commission_pct,
    NVL2(commission_pct, 'Eligible', 'Not Eligible') AS commission_status
FROM 
    employees;
