# Employees Who Earn the Highest Salaries in Their Departments

**Scenario:**  
The HR department wants to know which employees earn the highest salary within their department.  
If two or more employees share the same top salary in a department, all should be listed.

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
    SELECT department_id, MAX(salary)
    FROM employees
    GROUP BY department_id
)
ORDER BY department_id;

Handling ties in maximum values automatically.
