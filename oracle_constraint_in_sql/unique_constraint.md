# Oracle Constraints in SQL

This extended demo shows **NOT NULL** and several flavors of **UNIQUE** constraints:

1. **Named UNIQUE** → `mgr_mid_uk` on `manager_id`
2. **Inline UNIQUE + NOT NULL** → `phone_number`
3. **Table-level UNIQUE (auto-named)** → `email`
4. **Composite UNIQUE** → `mgr_composite_uk` across (`first_name`, `last_name`, `department_id`)

---

## Table Definition
```sql
CREATE TABLE managers (
    manager_id    NUMBER CONSTRAINT mgr_mid_uk UNIQUE,
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50),
    department_id NUMBER NOT NULL,
    phone_number  VARCHAR2(11) UNIQUE NOT NULL,
    email         VARCHAR2(100),
    UNIQUE (email),
    CONSTRAINT mgr_composite_uk UNIQUE (first_name, last_name, department_id)
);
