Foreign Key Actions in Oracle

This demo shows how foreign keys behave under different delete rules.

Case 1: Default (NO ACTION)
DELETE FROM employees_copy WHERE employee_id = 103;


❌ Fails, because managers still references 103.

Default behavior is to block the delete.

Case 2: ON DELETE SET NULL
DELETE FROM employees_copy WHERE employee_id = 103;


✅ Delete succeeds.

manager_id in managers becomes NULL.

Keeps manager row, but breaks the link.

Case 3: ON DELETE CASCADE
DELETE FROM employees_copy WHERE employee_id = 104;


✅ Delete succeeds.

Automatically deletes matching row in managers.

Updating Primary Keys
UPDATE employees_copy SET employee_id = 300 WHERE employee_id = 105;


❌ Fails, because the parent PK is referenced by a foreign key.

🔑 Key Takeaways

NO ACTION (default): Parent delete is blocked.

ON DELETE SET NULL: Child row stays, foreign key is nulled.
ON DELETE CASCADE: Child row is automatically removed.

Updating PKs is not allowed if they are referenced.
