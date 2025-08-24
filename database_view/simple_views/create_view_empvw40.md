Creating a View for Department 40 Employees

This demo shows how to create a view that selects only employees who belong to department 40.
A view is a stored query: it doesn’t store data itself, but every time you query it, Oracle re-runs the underlying SQL.

1. Create the View

We define the view empvw40 with friendly column aliases:

CREATE OR REPLACE VIEW empvw40 (e_id, name, surname, email) AS
SELECT employee_id, first_name, last_name, email
FROM employees
WHERE department_id = 40;


e_id → employee_id

name → first_name

surname → last_name

email → email

The filter ensures only department 40 employees are included.

2. Query the View
SELECT * FROM empvw40;


This retrieves all rows from department 40, but only the selected columns.

✅ Story Recap

By creating a simple view:

We give business users a clean, restricted dataset.

We hide irrelevant columns from the employees table.

We automatically enforce a filter (department_id = 40).

Views are a great way to simplify queries and enforce data access rules.
