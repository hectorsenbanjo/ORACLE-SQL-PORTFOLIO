This demo shows how to remove views from the database and check for constraints before dropping them.

1. Dropping Views

Views that are no longer needed can be removed with the DROP VIEW command:

DROP VIEW empvw20;

DROP VIEW empvw30;

DROP VIEW empvw40;

DROP VIEW empvw41;

DROP VIEW empvw60;

2. Checking Constraints Before Dropping

Sometimes, a view may have constraints defined (for example, a view with WITH CHECK OPTION).

We can check using the USER_CONSTRAINTS data dictionary view:

SELECT * 

FROM user_constraints 

WHERE table_name = 'EMPVW80';

3. Dropping the Last View

If there are no blocking constraints, we can safely drop the view:

DROP VIEW empvw80;

✅ Story Recap

Use DROP VIEW to clean up unnecessary views.

Always check USER_CONSTRAINTS for dependencies before dropping a view.

This prevents accidental loss of important data integrity rules.
