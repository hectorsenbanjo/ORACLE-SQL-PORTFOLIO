📘 regions_update.md
# Updating Rows in the REGIONS Table (HR Schema)

This example demonstrates different techniques for updating rows in the `REGIONS` table. It covers **single-row updates**, **multi-row updates**, and **subquery-driven updates**.

---

1️⃣ Update a Single Row by Primary Key
Update the `REGION_NAME` for the row with `REGION_ID = 101`.

2️⃣ Update Multiple Rows with a Non-Equality Predicate

Change all regions with IDs greater than 100.

UPDATE regions
SET region_name = 'Iberia'
WHERE region_id > 100;

3️⃣ Update Using Subqueries

Perform a more advanced update:

Use a subquery to calculate the new REGION_ID (MAX(region_id) + current region_id).

Use another subquery to filter which rows to update.

UPDATE regions
SET region_id = (
    region_id +
    (SELECT MAX(region_id) FROM regions)
)
WHERE region_id IN (
    SELECT region_id
    FROM regions
    WHERE region_id > 100
);

4️⃣ Confirm the State of the Rows

SELECT *
FROM regions;

5️⃣ Commit the Changes

COMMIT;
