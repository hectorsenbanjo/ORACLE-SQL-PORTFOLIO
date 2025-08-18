CREATE TABLE EMPS 
(
  EMPNO NUMBER 
, ENAME VARCHAR2(25) 
, SALARY NUMBER 
, DEPTNO NUMBER(4) 
);

insert into emps
select employee_id, last_name, salary, department_id
from employees;
insert

commit;

alter table emps
add (hired date);


ALTER TABLE EMPS
MODIFY (HIRED DEFAULT SYSDATE);

INSERT INTO emps (empno, ename)
VALUES (99, 'Newman');

SELECT HIRED, COUNT(1)
FROM EMPS
GROUP BY HIRED;

DROP TABLE emps;
