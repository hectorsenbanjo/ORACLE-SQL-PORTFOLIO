SELECT 
    'Employee ' || first_name || ' ' || last_name || 
    ' with phone ending in ' || SUBSTR(phone_number, -8) ||
    ' converted to number: ' || TO_NUMBER(SUBSTR(phone_number, -8)) ||
    ', and scaled value: ' || TO_NUMBER(SUBSTR(phone_number, -8)) * 10000 AS "Phone Conversion Detail"
FROM employees
WHERE department_id = 30;
