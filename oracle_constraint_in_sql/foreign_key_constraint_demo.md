Foreign Key Constraint Demo

This demo shows how foreign keys enforce referential integrity in Oracle SQL.
We use two tables:

employees_copy → Parent table with employee_id (PK) and (first_name, last_name) (Unique).

managers → Child table with both single-column and composite foreign keys.

✅ Valid Insert
INSERT INTO managers 
VALUES (101, 'Alice', 'Brown', 10, '08011111111', 'alice.brown@company.com');


manager_id = 101 exists in employees_copy.

(first_name, last_name) = ('Alice', 'Brown') also exists.
✔ Insert succeeds.

❌ Invalid Insert: Unknown manager_id
INSERT INTO managers 
VALUES (200, 'John', 'Doe', 30, '08022222222', 'john.doe@company.com');


manager_id = 200 does not exist in employees_copy.
❌ Violates mgr_emp_fk.

❌ Invalid Insert: Unknown (first_name, last_name)
INSERT INTO managers 
VALUES (102, 'David', 'Lee', 40, '08033333333', 'david.lee@company.com');


(first_name, last_name) = ('David','Lee') not found in parent table.
❌ Violates mgr_names_fk.

🔑 Key Takeaways

Single-column FK → ensures manager_id exists in employees_copy.

Composite FK → ensures (first_name, last_name) pair matches the parent.

Foreign keys prevent inserting invalid references, protecting data integrity.
