-- Drop the index first (if it already exists)
DROP INDEX emp_cpy_comm_idx;

-- Create a bitmap index on commission_pct
CREATE BITMAP INDEX emp_cpy_comm_idx 
ON employees_copy (commission_pct);

-- Query that can take advantage of the bitmap index
SELECT * 
FROM employees_copy 
WHERE commission_pct = 0.4;

