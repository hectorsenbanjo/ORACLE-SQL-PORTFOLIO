-- ================================================
-- dropping_views.sql
-- Demo: Dropping views and checking dependencies
-- ================================================

-- Drop multiple views (no longer needed)
DROP VIEW empvw20;
DROP VIEW empvw30;
DROP VIEW empvw40;
DROP VIEW empvw100;
DROP VIEW empvw60;

-- Check if a view has constraints before dropping
SELECT * 
FROM user_constraints 
WHERE table_name = 'EMPVW80';

-- Drop empvw80 after checking
DROP VIEW empvw80;
