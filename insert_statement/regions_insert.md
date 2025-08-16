# Inserting Rows into the REGIONS Table (HR Schema)

This script demonstrates **three different techniques** to insert rows into the `REGIONS` table, followed by verification and committing the changes.

---

## 1️⃣ Insert with Hard-Coded Values

A direct insert specifying exact values:

INSERT INTO regions
VALUES (101, 'Great Britain');

2️⃣ Insert with Substitution Variables
Using SQL*Plus or SQLcl substitution variables:

INSERT INTO regions
VALUES (&Region_number, '&Region_name');

When prompted:

Region_number: 102

Region_name: Australasia

This approach is handy for dynamic input at runtime.

3️⃣ Insert with a Scalar Subquery
Automatically determine the next available REGION_ID:

INSERT INTO regions
VALUES (
    (SELECT MAX(region_id) + 1 FROM regions),
    'Oceania'
);
The scalar subquery finds the highest existing REGION_ID and adds 1.

4️⃣ Verify the Insertions

SELECT *
FROM regions;

5️⃣ Commit the Changes

COMMIT;

Always commit after inserts to ensure data is saved permanently.

