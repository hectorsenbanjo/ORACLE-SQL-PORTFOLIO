-- CASE-based Salary Adjustment

-- In this example, we adjust employee salaries based on their job role:
-- - ST_CLERK gets a 20% raise
-- - SA_REP gets a 30% raise
-- - IT_PROG gets a 40% raise
-- - All others remain the same

SELECT 
    first_name, 
    last_name, 
    job_id, 
    salary,  
    CASE job_id 
        WHEN 'ST_CLERK' THEN salary * 1.2
        WHEN 'SA_REP'   THEN salary * 1.3
        WHEN 'IT_PROG'  THEN salary * 1.4
        ELSE salary 
    END AS "UPDATED SALARY"
FROM employees;
