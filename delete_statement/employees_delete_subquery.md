# Deleting Employees by Region (Europe) – HR Schema

This example demonstrates a **multi-row DELETE** using **nested subqueries**.  
It removes employees who belong to departments located in the **Europe region**.

---

## 1️⃣ Delete Employees in Europe
We trace the relationships step by step:
- `REGIONS` → Find the region named `"Europe"`.
- `COUNTRIES` → Select countries within that region.
- `LOCATIONS` → Select locations in those countries.
- `DEPARTMENTS` → Select departments at those locations.
- `EMPLOYEES` → Delete employees assigned to those departments.

```sql
DELETE FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id IN (
            SELECT country_id
            FROM countries
            WHERE region_id IN (
                SELECT region_id
                FROM regions
                WHERE region_name = 'Europe'
            )
        )
    )
);


2️⃣ Verify the Deletion

Check that no employees remain in Europe-based departments:

SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location_id IN (
        SELECT location_id
        FROM locations
        WHERE country_id IN (
            SELECT country_id
            FROM countries
            WHERE region_id IN (
                SELECT region_id
                FROM regions
                WHERE region_name = 'Europe'
            )
        )
    )
);

3️⃣ Commit the Changes

Make the deletion permanent:

COMMIT;
    )
);
