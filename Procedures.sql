-- procedures.sql
-- Stored procedure and function for the Oracle Autonomous Database demo

-- Procedure to give a raise to an employee by percentage
CREATE OR REPLACE PROCEDURE give_raise(p_emp_id IN NUMBER, p_percentage IN NUMBER) AS
BEGIN
    UPDATE employees
    SET salary = salary * (1 + p_percentage / 100)
    WHERE employee_id = p_emp_id;
    COMMIT;
END give_raise;
/

-- Function to return full name of an employee
CREATE OR REPLACE FUNCTION employee_full_name(p_emp_id IN NUMBER) RETURN VARCHAR2 AS
    v_name VARCHAR2(101);
BEGIN
    SELECT first_name || ' ' || last_name INTO v_name 
    FROM employees 
    WHERE employee_id = p_emp_id;
    RETURN v_name;
END employee_full_name;
/
