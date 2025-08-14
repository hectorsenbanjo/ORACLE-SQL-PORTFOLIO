-- Story:
-- HR wants to know which employees earn more than Mr. Taylor.
-- You write a query to compare salaries directly.

-- Initial Attempt:
SELECT last_name
FROM employees
WHERE salary >
    (SELECT salary
     FROM employees
     WHERE last_name = 'Taylor')
ORDER BY last_name;

-- Problem:
-- ORA-01427: single-row subquery returns more than one row
-- This happens when more than one employee has the last name 'Taylor'.

-- Investigating the Issue:
SELECT COUNT(last_name)
FROM employees
WHERE last_name = 'Taylor';
-- This reveals that there is more than one 'Taylor' in the table.

-- Why It Fails:
-- The ">" operator requires the subquery to return exactly one value.
-- But if multiple Taylors exist, the subquery returns multiple rows,
-- causing the error.

---------------------------------------------------------------
-- Solution 1: Use a multi-row comparison operator (> ALL)
---------------------------------------------------------------
SELECT last_name
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE last_name = 'Taylor'
)
ORDER BY last_name;

---------------------------------------------------------------
-- Solution 2: Force the subquery to always return one row (MAX)
---------------------------------------------------------------
SELECT last_name
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE last_name = 'Taylor'
)
ORDER BY last_name;

-- Conclusion:
-- Solution 1 compares each employee’s salary to every Taylor's salary.
-- Solution 2 compares each employee’s salary to the highest Taylor salary.
