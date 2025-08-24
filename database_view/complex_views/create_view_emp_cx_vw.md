Creating an Aggregate View: Minimum and Maximum Salaries per Department

This demo shows how to use aggregate functions in a view.
We build a summary of minimum and maximum salaries by department.

1. Create the View
CREATE OR REPLACE VIEW emp_cx_vw (DNAME, MIN_SAL, MAX_SAL) AS
SELECT UPPER(department_name), MIN(salary), MAX(salary)
FROM employees e 
JOIN departments d USING(department_id)
GROUP BY department_name;


UPPER(department_name) → formats department names consistently in uppercase.

MIN(salary) and MAX(salary) → aggregate values across employees in each department.

GROUP BY department_name → ensures one row per department.

2. Query the View
SELECT * FROM emp_cx_vw;


Example output:

DNAME	MIN_SAL	MAX_SAL
SALES	6100	14000
IT	4200	9000
HR	2500	6500
✅ Story Recap

This view is a reporting tool:

It gives a quick look at salary ranges per department.

It’s read-only — aggregate views cannot be updated directly.

It shows how views can simplify business queries by hiding complex joins and groupings.
