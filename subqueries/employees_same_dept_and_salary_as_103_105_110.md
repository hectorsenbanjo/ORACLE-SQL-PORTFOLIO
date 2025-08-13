# Employees in the Same Department and Salary as Employees 103, 105, and 110

**Scenario:**  
The HR department wants to identify employees who:
- Work in the same **department** as employees with IDs 103, 105, or 110.
- Earn the same **salary** as any of those employees.

---

**SQL Query:**
```sql
SELECT employee_id, 
       first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE department_id IN (
    SELECT department_id 
    FROM employees 
    WHERE employee_id IN (103, 105, 110)
)
AND salary IN (
    SELECT salary 
    FROM employees 
    WHERE employee_id IN (103, 105, 110)
);
