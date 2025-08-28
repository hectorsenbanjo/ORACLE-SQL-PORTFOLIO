# 🔑 Story: Object Privileges in Oracle

In Oracle, **system privileges** (like CREATE TABLE) are different from **object privileges** (like SELECT, UPDATE, DELETE on specific tables).  
This demo shows how privileges granted by the `HR` schema affect what the `TEMP_USER` can do.

---

## 1️⃣ Connected as HR

First, HR owns the table `EMPLOYEES_COPY`.  

HR grants different privileges:

```sql
GRANT SELECT, DELETE ON employees_copy TO temp_user, developer;
GRANT UPDATE (salary, commission_pct) ON employees_copy TO temp_user;
GRANT UPDATE ON employees_copy TO developer;
GRANT INSERT ON employees_copy TO PUBLIC;
GRANT ALL ON employees_copy TO temp_user;
GRANT UNLIMITED TABLESPACE TO temp_user;

Here we see a mix of:

Column-level privilege (update only salary and commission_pct)

Full object privilege (ALL)

Role & public grants

2️⃣ Connected as TEMP_USER

Now TEMP_USER uses the privileges granted by HR.

Selecting Data
SELECT * FROM employees_copy;
SELECT * FROM hr.employees_copy;

Updating Data
UPDATE hr.employees_copy SET salary = 100;
UPDATE hr.employees_copy SET manager_id = 100;  -- will fail unless ALL was granted

Inserting Data
INSERT INTO hr.employees_copy (
  employee_id, first_name, last_name, email, hire_date, job_id, salary
) VALUES (
  207, 'Alex', 'Brown', 'ABROWN', SYSDATE, 'IT_PROG', 5000
);

Creating an Index
CREATE INDEX idx_emp_cpy ON hr.employees_copy(email);

Checking Privileges
SELECT * FROM user_tab_privs;

✅ Key Takeaways

HR grants object privileges on employees_copy.

TEMP_USER can query, update, insert, and delete depending on those grants.

Privileges can be column-specific (e.g., only update salary).

Roles (developer) and PUBLIC can also receive privileges.

Checking USER_TAB_PRIVS confirms what the user has access to.

This exercise demonstrates how fine-grained object privilege control works in Oracle Database.
