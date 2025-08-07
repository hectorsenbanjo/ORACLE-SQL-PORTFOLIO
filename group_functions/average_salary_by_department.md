# 📊 Average Salary by Department

In this example, we analyze the salary distribution across different departments in the HR database.

## 🧠 What We’re Doing

We're using the `AVG` group function to calculate the **average salary** of employees **within each department**. This helps managers understand which departments tend to have higher or lower compensation.

## 🔍 SQL Breakdown

- `AVG(salary)`: Calculates the average salary in each department.
- `ROUND(..., 2)`: Rounds the result to 2 decimal places.
- `GROUP BY department_id`: Aggregates data by department.
- `ORDER BY department_id`: Displays results in ascending order of department ID.

## 💼 Real-World Use Case

A Human Resources Analyst wants to understand the average compensation by department to determine where salary adjustments might be needed.
