# Story: Exploring Oracle Synonyms

Synonyms in Oracle are **aliases for database objects**.  
They make SQL easier to write and can hide schema/owner details.

---

## Case 1: Basic Synonym
```sql
CREATE SYNONYM test_syn FOR employees;
SELECT * FROM test_syn;

Case 2: Replace Synonym
CREATE OR REPLACE SYNONYM test_syn FOR departments;


👉 The synonym now points to the departments table instead.
Any existing queries using test_syn will now retrieve department data.

Case 3: Drop Synonym
DROP SYNONYM test_syn;


👉 Removes the synonym definition.

Case 4: Synonym for Another Schema
CREATE SYNONYM test_syn FOR SYS.user_objects;
SELECT * FROM hr.test_syn;


👉 You can create synonyms that point to objects in other schemas,
but the querying user must have the right object privileges.
For example, HR must have SELECT permission on SYS.user_objects to query it.

✅ Recap

Synonyms simplify object access by removing the need to prefix with schema names.

CREATE OR REPLACE allows you to re-point a synonym without dropping it first.

Dropping a synonym removes only the alias, not the underlying object.

Cross-schema synonyms require correct privileges.

Synonyms are especially useful in applications where you want to decouple SQL from schema names. If the underlying table moves to another schema, just recreate the synonym — no code changes needed.
