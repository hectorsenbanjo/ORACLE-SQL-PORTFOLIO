# COALESCE: Selecting the First Available Contact Info

In real-world scenarios, employee contact information may be incomplete. This query demonstrates how to use the `COALESCE` function to retrieve the first available contact method for each employee.

### Logic:
- `COALESCE` returns the **first non-NULL** value from the list of columns.
- If `phone_number` is available, it is selected.
- If `phone_number` is `NULL`, it tries `email`.
- If both are `NULL`, the output will be `'No contact info'`.

### Query Used:
```sql
SELECT 
    employee_id,
    first_name || ' ' || last_name AS full_name,
    COALESCE(phone_number, email, 'No contact info') AS preferred_contact
FROM 
    employees;
