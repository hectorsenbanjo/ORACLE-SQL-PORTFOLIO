# Employees in UK-Based Departments

This query identifies all employees who work in departments located in the **United Kingdom**, using **three levels of nested subqueries** from the HR schema.

## SQL Breakdown

```sql
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id = (
            SELECT country_id
            FROM countries
            WHERE country_name = 'United Kingdom'
        )
    )
);
```

## Explanation

- **Innermost Subquery**: Retrieves the `country_id` of the United Kingdom from the `countries` table.
- **Middle Subquery**: Uses the country_id to find all relevant `location_id`s from the `locations` table.
- **Outer Subquery**: Finds `department_id`s for departments located in those locations.
- **Main Query**: Lists all employees who work in any of those departments.

## Use Case

Useful for HR reporting, employee distribution by region, and localized payroll or compliance tracking.

## Sample Output

| first_name | last_name | department_id |
|------------|-----------|----------------|
| David      | Austin    | 90             |
| Lisa       | O'Hara    | 110            |

> Output depends on actual HR dataset contents.
