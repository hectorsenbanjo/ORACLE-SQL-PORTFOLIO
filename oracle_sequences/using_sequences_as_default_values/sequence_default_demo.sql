-- ================================================================
-- sequence_default_demo.sql
-- Demo: Using Sequences as DEFAULT values in table columns
-- ================================================================

-- Step 1: Create a table with NEXTVAL as default for e_id
CREATE TABLE temp (
    e_id INTEGER DEFAULT employee_seq.NEXTVAL,
    first_name VARCHAR2(50)
);

-- Step 2: Insert a row without specifying e_id
-- The sequence will automatically provide the value
INSERT INTO temp(first_name) VALUES ('Alex');

-- Step 3: Check the result
SELECT * FROM temp;

-- Step 4: Drop the table to test a different approach
DROP TABLE temp;

-- Step 5: Re-create table with CURRVAL as default
CREATE TABLE temp (
    e_id INTEGER DEFAULT employee_seq.CURRVAL,
    first_name VARCHAR2(50)
);

-- Step 6: Advance the sequence so CURRVAL is valid
SELECT employee_seq.NEXTVAL FROM dual;

-- Step 7: Insert a row, letting CURRVAL provide the value
INSERT INTO temp(e_id, first_name) VALUES (NULL, 'Alex');

-- Step 8: Verify the inserted row
SELECT * FROM temp;
