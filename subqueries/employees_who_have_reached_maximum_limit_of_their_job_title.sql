/*
   Story:
   Management wants to identify employees who have reached the maximum salary 
   allowed for their job title.

   Approach:
   1. The `jobs` table contains each job_id and its max_salary.
   2. Compare each employee's (job_id, salary) pair against (job_id, max_salary) from jobs.
   3. Use tuple comparison to match both fields at once.
*/

SELECT employee_id, 
       first_name, 
       last_name, 
       job_id, 
       salary
FROM employees
WHERE (job_id, salary) IN (
    SELECT job_id, max_salary
    FROM jobs
);
