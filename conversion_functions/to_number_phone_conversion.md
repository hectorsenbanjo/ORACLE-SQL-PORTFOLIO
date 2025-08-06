# 🔢 Oracle SQL: Converting Substrings of PHONE_NUMBER Using `TO_NUMBER`

## 🧾 Scenario
For employees in `DEPARTMENT_ID = 30`, we want to:
1. Extract the **last 8 characters** from the `PHONE_NUMBER` column.
2. Convert that substring (which includes a decimal point) into a **numeric value** using `TO_NUMBER`.
3. Multiply the resulting number by **10,000** for further processing or reporting.

## 📄 SQL Query:
```sql
SELECT 
    'Employee ' || first_name || ' ' || last_name || 
    ' with phone ending in ' || SUBSTR(phone_number, -8) ||
    ' converted to number: ' || TO_NUMBER(SUBSTR(phone_number, -8)) ||
    ', and scaled value: ' || TO_NUMBER(SUBSTR(phone_number, -8)) * 10000 AS "Phone Conversion Detail"
FROM employees
WHERE department_id = 30;
```

## 💡 Explanation:
- `SUBSTR(phone_number, -8)` extracts the **last 8 characters** from each phone number.
- `TO_NUMBER(...)` converts the substring into a **numeric data type**, which may include a decimal.
- Multiplying by `10000` simulates a **scaling operation** for reporting or calculations.

## ✅ Use Case
This is useful when phone numbers or similar strings contain **embedded numeric values** used for tracking, calculations, or obfuscation purposes.
