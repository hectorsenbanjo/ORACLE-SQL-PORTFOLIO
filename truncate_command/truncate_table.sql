-- Truncate all rows from a table.
-- Syntax:
TRUNCATE TABLE table_name;

-- Example: Truncate the department_salaries table
TRUNCATE TABLE department_salaries;

-- ⚠️ Note:
-- - TRUNCATE is a DDL command, not DML.
-- - It removes ALL rows instantly and cannot be rolled back.
-- - The table structure (columns, constraints, indexes) remains intact.
