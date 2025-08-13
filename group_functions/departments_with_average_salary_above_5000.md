# Departments with Average Salary Above 5,000

**Scenario:**  
The HR team wants to list departments whose average salary exceeds 5,000.

---

**SQL Query:**
```sql
SELECT department_id, 
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;
