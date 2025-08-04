# Basic Employee Select

**Purpose:**  
Retrieve a list of employees from the HR schema, showing basic identification and contact details.

**Tables Used:**  
- `employees`

**Query:**
```sql
SELECT 
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date
FROM employees
ORDER BY last_name;
