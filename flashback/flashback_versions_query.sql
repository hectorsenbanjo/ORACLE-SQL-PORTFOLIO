-- ==========================================================
-- Flashback Versions Query Demo
-- Tracks historical changes to a row in the last 5 minutes
-- Works in Oracle Database with row movement enabled
-- ==========================================================

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
