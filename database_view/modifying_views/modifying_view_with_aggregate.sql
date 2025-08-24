-- ================================================
-- modifying_view_with_aggregate.sql
-- Demo: Modifying a view by adding an aggregate column (SUM)
-- ================================================

-- Original view had MIN and MAX salary
-- New definition adds TOTAL_SAL (SUM of salaries per department)

CREATE OR REPLACE VIEW emp_cx_vw (dname, min_sal, max_sal, total_sal) AS
SELECT UPPER(department_name),
       MIN(salary),
       MAX(salary),
       SUM(salary)
FROM employees e
JOIN departments d
USING (department_id)
GROUP BY department_name;

-- Query the modified view
SELECT * FROM emp_cx_vw;
