# Employees with Salary Above Company Average

**Scenario:**  
We need to find employees whose salary is **greater than the company-wide average**.

---

**SQL Query:**
```sql
SELECT first_name, 
       last_name, 
       job_id
FROM employees
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees
);
