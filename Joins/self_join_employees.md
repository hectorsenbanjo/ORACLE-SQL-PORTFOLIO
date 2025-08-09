# 👥 Self Join Example – Employees and Their Managers

In this example, we explore how **a table can be joined to itself** to create meaningful relationships within its own data.  
We use the `employees` table from the **HR schema** in Oracle Database.

---

## 📌 Scenario

Every employee in the company might have a manager, and that manager is also an employee in the same table.  
The `employees` table stores both workers and managers in the same dataset.

We want to **list each worker alongside their manager** and compare their salaries.

---

## 🗂 SQL Query

```sql
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
on
worker.manager_id = manager.employee_id;

🔍 How It Works

We alias the employees table as:

worker → representing the employee

manager → representing the manager of that employee

The join condition:

worker.manager_id = manager.employee_id

connects the worker's manager_id to the manager's employee_id.

This way, we can retrieve both the worker's details and the manager's details from the same table.

📊 Example Output

worker_first_name	worker_last_name	worker_id	manager_id	manager_first_name	manager_last_name	worker_salary	manager_salary
Lex	De            Haan	            102	      100	        Steven	            King	            17000	        24000
Alexander	        Hunold	          103	      102        	Lex	                De Haan           9000          17000

💡 Key Takeaways

Self joins allow us to relate rows in a table to other rows in the same table.

They are useful for hierarchical data, like employee-manager relationships.

Aliases are essential to distinguish the two roles (worker vs manager) in the query.
    worker.manager_id = manager.employee_id;

