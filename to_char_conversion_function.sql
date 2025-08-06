SELECT 
    'Employee ' || first_name || ' ' || last_name || ' earns ' ||
    TO_CHAR(salary, 'L999G999D99') || ' monthly and was hired on the ' ||
    TO_CHAR(hire_date, 'ddthsp" of " Month yyyy') AS "employee_info"
FROM employees;
