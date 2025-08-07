-- coalesce_contact_info.sql
SELECT 
    employee_id,
    first_name || ' ' || last_name AS full_name,
    COALESCE(phone_number, email, 'No contact info') AS preferred_contact
FROM 
    employees;
