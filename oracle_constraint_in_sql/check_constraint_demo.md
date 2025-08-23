# Enforcing Business Rules with CHECK Constraints

This demo shows how to use **Oracle CHECK constraints** to validate data at the table level.  
We create two versions of a table (`managers2`) that enforce different business rules.

---

## Part 1: Salary Range Check

We define a constraint to ensure that all manager salaries are **greater than 100 and less than 50,000**.

```sql
CREATE TABLE managers2
(
   manager_id NUMBER,
   first_name VARCHAR2(50),
   salary     NUMBER, 
   CONSTRAINT salary_check CHECK (salary > 100 AND salary < 50000)
);
Test Cases
❌ Insert salary = 50 → Rejected (too low)

✅ Insert salary = 500 → Accepted (valid range)

❌ Update salary to 20 → Rejected

Part 2: Compound Check (Salary + Email Format)
We enhance the constraint to also check that the email ends with .COM.
Both salary and email rules must be satisfied.

CREATE TABLE managers2 (
    manager_id NUMBER,
    first_name VARCHAR2(50),
    salary NUMBER,
    email VARCHAR2(100),
    CONSTRAINT demo_check CHECK (
        salary > 100 
        AND salary < 50000 
        AND UPPER(email) LIKE '%.COM'
    )
);
Test Cases
❌ Insert with email ending in .xyz → Rejected

✅ Insert with email ending in .com → Accepted

Key Takeaway
CHECK constraints let you enforce custom business logic directly in the database.
They guarantee data quality by preventing invalid rows from ever entering your tables.
Copy
Edit
