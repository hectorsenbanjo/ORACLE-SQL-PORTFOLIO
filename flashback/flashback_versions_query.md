# Flashback Versions Query Demo

This demo shows how to track **row history** in Oracle Database using **Flashback Versions Query**.  
It lets you see all changes (INSERT, UPDATE, DELETE) that affected a row over a given period of time.

---

## SQL Code
```sql
SELECT versions_starttime,
       versions_endtime,
       versions_startscn,
       versions_endscn,
       versions_operation,
       versions_xid,
       employees_copy.*
FROM employees_copy
     VERSIONS BETWEEN TIMESTAMP (SYSDATE - INTERVAL '5' MINUTE) AND SYSDATE
WHERE employee_id = 100;
