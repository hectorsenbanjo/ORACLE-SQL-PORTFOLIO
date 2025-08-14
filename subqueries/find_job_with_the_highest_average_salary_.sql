-- Story:
-- HR wants to know which job position pays the highest average salary.
-- This will help in setting benchmarks for compensation negotiations.

-- Goal:
-- Identify the job title with the maximum average salary among all employees.

SELECT job_title
FROM jobs
NATURAL JOIN employees
GROUP BY job_title
HAVING AVG(salary) = (
    SELECT MAX(AVG(salary))
    FROM employees
    GROUP BY job_id
);

-- Explanation:
-- 1. The inner query calculates the average salary for each job_id and finds the maximum of those averages.
-- 2. The outer query groups employees by job_title and calculates their average salary.
-- 3. The HAVING clause ensures we only select the job(s) whose average salary equals the maximum found in step 1.
