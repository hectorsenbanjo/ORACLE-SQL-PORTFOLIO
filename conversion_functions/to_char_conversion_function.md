# 🔄 Oracle SQL: `TO_CHAR` Conversion Function

This example demonstrates how to use the `TO_CHAR` function in Oracle SQL to format both **number** and **date** data types for improved readability.

## 💡 What It Does:
- Converts the `salary` column (a number) into a **formatted currency string**.
- Converts the `hire_date` column (a date) into a **human-readable date format**.

## 📄 SQL Query:
```sql


SELECT 
    'Employee ' || first_name || ' ' || last_name || ' earns ' ||
    TO_CHAR(salary, 'L999G999D99') || ' monthly and was hired on the ' ||
    TO_CHAR(hire_date, 'ddthsp" of " Month, yyyy') AS "employee_info"
FROM employees;

📌 Breakdown:
TO_CHAR(salary, 'L999G999D99') → Adds a local currency symbol, thousands separator, and 2 decimal places.

TO_CHAR(hire_date, 'ddthsp" of " Month, yyyy') → Returns dates in a format like "sixth of August, 2025".

🧠 Tip:
Use TO_CHAR whenever you need to display numbers or dates in a more user-friendly or report-friendly way.
