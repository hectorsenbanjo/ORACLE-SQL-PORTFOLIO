# Employees Earning Above Average Salary

This SQL query returns a list of employees whose salary is above the average salary of all employees in the company.

## SQL Features Used

- **Subquery**: The `AVG(salary)` is calculated using a subquery inside the `WHERE` clause.
- **Comparison**: The main query compares each employee’s salary with the average salary.

## Output Example

| first_name | last_name | salary |
|------------|-----------|--------|
| Steven     | King      | 24000  |
| Neena      | Kochhar   | 17000  |
| Lex        | De Haan   | 17000  |

*(Note: Output varies depending on your dataset.)*

## Use Case

This query is useful for HR analytics, performance evaluations, and compensation benchmarking.

---

**HR Schema Required**  
This query assumes you're using Oracle’s sample HR schema.
