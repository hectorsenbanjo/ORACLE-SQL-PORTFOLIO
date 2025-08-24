Modifying a View: Adding an Aggregate Column

This demo shows how to use CREATE OR REPLACE VIEW to modify an existing view by adding a new column.

1. The Change

We modified the view emp_cx_vw to include an extra aggregate column:

CREATE OR REPLACE VIEW emp_cx_vw (dname, min_sal, max_sal, total_sal) AS
SELECT UPPER(department_name),
       MIN(salary),
       MAX(salary),
       SUM(salary)
FROM employees e
JOIN departments d
USING (department_id)
GROUP BY department_name;


Before: Only showed MIN_SAL and MAX_SAL.

Now: Adds TOTAL_SAL = sum of salaries in each department.

2. Query the Modified View
SELECT * FROM emp_cx_vw;

Example Output
DNAME	MIN_SAL	MAX_SAL	TOTAL_SAL
IT	4200	9000	27000
HR	2500	6500	12000
SALES	6100	14000	50000
✅ Story Recap

CREATE OR REPLACE VIEW lets you update a view without dropping it first.

Adding aggregate functions (like SUM) gives richer department-level summaries.

This example demonstrates iterative view design: starting simple, then enhancing with more insights.
