# Story: Using Sequences as DEFAULT Column Values

This demo shows how Oracle sequences can be set as default values for table columns, using both **NEXTVAL** and **CURRVAL**.

---

## Step 1: Table with NEXTVAL Default
We first create a table where the `e_id` column automatically pulls its value from the sequence:

```sql
CREATE TABLE temp (
    e_id INTEGER DEFAULT employee_seq.NEXTVAL,
    first_name VARCHAR2(50)
);

Step 2: Insert Without ID

If we don’t supply e_id, the sequence provides it:

INSERT INTO temp(first_name) VALUES ('Alex');
SELECT * FROM temp;


Output → Alex is inserted with the next available ID (e.g., 100, 103, …).

Step 3: Try CURRVAL

Now we drop the table and rebuild it, this time using CURRVAL:

DROP TABLE temp;

CREATE TABLE temp (
    e_id INTEGER DEFAULT employee_seq.CURRVAL,
    first_name VARCHAR2(50)
);


⚠️ Note: CURRVAL only works after NEXTVAL has been called in the session.

Step 4: Activate the Sequence

We advance the sequence once:

SELECT employee_seq.NEXTVAL FROM dual;

Step 5: Insert Using CURRVAL

Now, CURRVAL is valid and can be used:

INSERT INTO temp(e_id, first_name) VALUES (NULL, 'Alex');
SELECT * FROM temp;


Output → Alex is inserted with the most recently generated sequence value.

✅ Recap

NEXTVAL → generates a new number each time. Perfect for auto-incrementing primary keys.

CURRVAL → reuses the last generated value within the session. Only valid after NEXTVAL has been called.

This distinction is critical when designing tables that depend on sequences.
