-- TEMP_USER Worksheet Code
CREATE TABLE temp_table (temp_column VARCHAR2(100));
/
GRANT CREATE PROCEDURE, CREATE VIEW TO temp_user;
/
CREATE OR REPLACE PROCEDURE insert_into_temp_table (insert_value IN VARCHAR2) IS
BEGIN
    INSERT INTO temp_table VALUES (insert_value);
END;
/
GRANT EXECUTE ON insert_into_temp_table TO hr;
/
SELECT * FROM temp_table;
/
EXEC temp_user.insert_into_temp_table('User: TEMP_USER --> Procedure: Definer''s Rights');
/
CREATE OR REPLACE PROCEDURE insert_into_temp_table (insert_value IN VARCHAR2) AUTHID CURRENT_USER IS 
BEGIN
    INSERT INTO temp_table VALUES (insert_value);
END;
/
EXEC temp_user.insert_into_temp_table('User: TEMP_USER --> Procedure: Invoker''s Rights');
/
SELECT object_name,object_type,status FROM user_objects where object_name = 'INSERT_INTO_TEMP_TABLE';
DROP TABLE temp_table;
/
DROP PROCEDURE insert_into_temp_table;
/
CREATE TABLE temp_table2 (temp_column VARCHAR2(100));
INSERT INTO temp_table2 values('View Test: Temp Table in TEMP_USER');
/
CREATE OR REPLACE FUNCTION get_last_record_from_temp_table RETURN VARCHAR2 AUTHID CURRENT_USER IS
temp_text VARCHAR2(100);
BEGIN
    SELECT temp_column INTO temp_text FROM temp_table2 WHERE ROWNUM = 1;
    RETURN temp_text;
END;
/
CREATE OR REPLACE VIEW temp_view BEQUEATH DEFINER AS
    SELECT get_last_record_from_temp_table temp_text FROM dual;
/
GRANT SELECT ON temp_view TO HR;
/
CREATE OR REPLACE VIEW temp_view BEQUEATH CURRENT_USER AS
    SELECT get_last_record_from_temp_table temp_text FROM dual;
/
DROP VIEW temp_view;
DROP FUNCTION get_last_record_from_temp_table;
DROP TABLE temp_table2;


-- HR USER Worksheet Code:
CREATE TABLE temp_table (temp_column VARCHAR2(100));
INSERT INTO temp_user.temp_table VALUES ('User: HR --> Direct Insert - INSERT Privilege for Temp_user''s table: No');
EXEC temp_user.insert_into_temp_table('User: HR --> Procedure: Definer''s Rights - INSERT Privilege for Temp_user''s table: No');
SELECT * FROM temp_table;
SELECT * FROM temp_user.temp_table;
EXEC temp_user.insert_into_temp_table('User: HR --> Procedure: Invoker''s Rights - INSERT Privilege for Temp_user''s table: No');
DROP TABLE temp_table;
SELECT * FROM temp_user.temp_view;
SELECT * FROM temp_user.temp_table2;
