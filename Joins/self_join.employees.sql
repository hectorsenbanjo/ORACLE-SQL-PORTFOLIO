-- Self Join Example: Employees and Their Managers
-- This query uses a self join on the employees table to match each worker to their manager.

SELECT 
    worker.first_name       AS worker_first_name,
    worker.last_name        AS worker_last_name,
    worker.employee_id      AS worker_id,
    worker.manager_id       AS manager_id,
    manager.employee_id     AS manager_id_number,
    manager.first_name      AS manager_first_name,
    manager.last_name       AS manager_last_name,
    worker.salary           AS worker_salary,
    manager.salary          AS manager_salary
FROM 
    employees worker
JOIN 
    employees manager
ON 
    worker.manager_id = manager.employee_id;
