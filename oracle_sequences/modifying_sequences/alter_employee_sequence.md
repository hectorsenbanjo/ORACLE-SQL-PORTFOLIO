# Story: Changing the Rules of an Employee ID Sequence

Imagine your HR department decides that employee IDs should not grow by 3 anymore, but by **5** (e.g., 100, 105, 110...).  
Instead of creating a new sequence, we can **alter the existing one**.

---

## Step 1: Check Current Settings
First, let’s confirm how the sequence is defined:

```sql
SELECT sequence_name, increment_by, last_number, cache_size, cycle_flag
FROM user_sequences
WHERE sequence_name = 'EMPLOYEE_SEQ';

This shows us the current INCREMENT BY and other properties.

Step 2: Alter the Sequence

We apply the new rule:

ALTER SEQUENCE employee_seq
   INCREMENT BY 5
   MAXVALUE 99999
   CACHE 30
   NOCYCLE;

Explanation:

INCREMENT BY 5 → IDs will now increase by 5 each time.

MAXVALUE 99999 → Still capped at 99,999.

CACHE 30 → Performance boost (keeps 30 numbers ready).

NOCYCLE → Still no restart when max is reached.

Step 3: Test the New Behavior

Generate values after the change:

SELECT employee_seq.NEXTVAL AS new_id FROM dual;
SELECT employee_seq.NEXTVAL AS new_id FROM dual;
SELECT employee_seq.NEXTVAL AS new_id FROM dual;

Example Output
NEW_ID
109
114
119
✅ Recap

By altering the sequence, we reprogrammed Oracle’s automatic ID generator without losing existing values.
This way, our employee IDs now jump in steps of 5 instead of 3, matching the new HR policy.
