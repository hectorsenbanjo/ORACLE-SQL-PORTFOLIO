-- File: highest_paid_employee.sql
-- Description: Returns the employee(s) who earn the highest salary


SELECT first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

# Highest Paid Employee

This SQL script retrieves the employee(s) who earn the highest salary in the company.

## Query Breakdown
- **Main Table**: `employees`
- **Subquery**: `(SELECT MAX(salary) FROM employees)` returns the highest salary.
- **Filter**: `WHERE salary = (subquery)` ensures only employees earning that exact amount are shown.

## Use Case
To identify top earners in the company, for example during salary review or performance audits.

## Sample Output
| first_name | last_name | salary |
|------------|-----------|--------|
| Steven     | King      | 24000  |

> Note: Output depends on your actual dataset in the HR schema.

  
