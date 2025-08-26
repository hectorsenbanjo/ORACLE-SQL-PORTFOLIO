# Story: Dropping a Sequence in Oracle SQL

Sometimes, a sequence is no longer needed.  
For example, suppose we created `employee_seq` to generate employee IDs.  
Later, HR decides to switch to a different numbering system.  
In this case, we should **drop the sequence** to keep the database clean.

---

## Step 1: Confirm the Sequence Exists
Before dropping, we can verify it:

```sql
  
SELECT sequence_name
FROM user_sequences
WHERE sequence_name = 'EMPLOYEE_SEQ';

If it shows up, we know it exists.

Step 2: Drop the Sequence

We remove it with:

DROP SEQUENCE employee_seq;

Step 3: Verify Removal

Check again:

SELECT sequence_name
FROM user_sequences
WHERE sequence_name = 'EMPLOYEE_SEQ';


This time, it should return no rows, meaning the sequence is gone.

⚠️ Important Notes

Dropping a sequence is permanent.

Any tables or code relying on it will fail if they try to fetch NEXTVAL or CURRVAL.

Always double-check before dropping in production.

✅ Recap

We successfully dropped employee_seq when it was no longer required.
This keeps our schema tidy and avoids confusion with unused objects.
