# Employees with Same Department and Salary as Employees 103, 105, and 110

**Scenario:**  
We want to list all employees who:
- Work in the same department as employees with IDs 103, 105, or 110
- AND earn the exact same salary as those employees.

---

**SQL Query:**
```sql
SELECT employee_id, 
       first_name, 
       last_name, 
       salary, 
       department_id
FROM employees
WHERE (department_id, salary) IN (
    SELECT department_id, salary
    FROM employees
    WHERE employee_id IN (103, 105, 110)
);
