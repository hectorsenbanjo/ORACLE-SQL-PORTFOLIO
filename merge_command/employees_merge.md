# MERGE Statement (UPSERT) – HR Schema Example

The `MERGE` statement allows you to **insert new rows** and **update existing rows** in a single command.  
It is very useful for synchronizing a target table (`employees`) with a source table (`new_employees`).

---

## 1️⃣ SQL Example
```sql
MERGE INTO employees e
USING new_employees n
ON (e.employee_id = n.employee_id)
WHEN MATCHED THEN
    UPDATE SET e.salary = n.salary
WHEN NOT MATCHED THEN
    INSERT (employee_id, last_name, salary, email, job_id)
    VALUES (n.employee_id, n.last_name, n.salary, n.email, n.job_id);

2️⃣ How It Works

USING new_employees n
The source of incoming data is the new_employees table.

ON (e.employee_id = n.employee_id)
Defines the match condition between existing (employees) and new (new_employees) rows.

WHEN MATCHED THEN UPDATE
If the employee already exists, their salary is updated.

3️⃣ Confirm the Results

After the merge, check the employees table:

SELECT *
FROM employees;

4️⃣ Cleanup with TRUNCATE

Often, new_employees is a staging table.
After merging, it can be cleared quickly using TRUNCATE:

TRUNCATE TABLE new_employees;


TRUNCATE removes all rows instantly (faster than DELETE).

Table structure remains intact for future loads.
WHEN NOT MATCHED THEN INSERT
If the employee does not exist, a new row is inserted.
