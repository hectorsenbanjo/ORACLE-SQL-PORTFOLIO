# 📊 Average Salary by Department

This query showcases the use of the `AVG()` group function in Oracle SQL. Using the sample HR schema, it calculates the **average salary of employees** grouped by their respective `department_id`.

## 🧠 Explanation
- The `AVG(salary)` function computes the average salary for each group.
- `GROUP BY department_id` ensures aggregation per department.
- `ROUND(..., 2)` is used to limit the result to 2 decimal places.
- The result is sorted in descending order so departments with the highest average salaries appear first.

## 🔍 Query Output (Example)
| DEPARTMENT_ID | AVG_SALARY |
|---------------|------------|
| 90            | 19333.33   |
| 100           | 8600.00    |
| 110           | 8300.00    |
| ...           | ...        |

> 💡 You can replace `AVG` with `MAX`, `MIN`, `COUNT`, or `SUM` to explore other group functions.
