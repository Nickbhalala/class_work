old:DECLARE
dept_id employees.department_id:=&dept_id;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;

new:DECLARE
dept_id employees.department_id:=70;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;

Error starting at line : 56 in command -
DECLARE
dept_id employees.department_id:=70;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;
Error report -
ORA-06550: line 2, column 9:
PLS-00488: 'EMPLOYEES.DEPARTMENT_ID' must be a type
ORA-06550: line 0, column 1:
PL/SQL: Compilation unit analysis terminated
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

Table REGIONS dropped.


Table LOCATIONS dropped.


Table COUNTRIES dropped.


Table DEPARTMENTS dropped.


Table EMPLOYEES dropped.


Table JOBS dropped.


Table JOB_HISTORY dropped.


Table REGIONS created.


INDEX REG_ID_PK created.


Table REGIONS altered.


Table COUNTRIES created.


Table COUNTRIES altered.


Table LOCATIONS created.


INDEX LOC_ID_PK created.


Table LOCATIONS altered.


Sequence LOCATIONS_SEQ dropped.


Sequence LOCATIONS_SEQ created.


Table DEPARTMENTS created.


INDEX DEPT_ID_PK created.


Table DEPARTMENTS altered.


Sequence DEPARTMENTS_SEQ dropped.


Sequence DEPARTMENTS_SEQ created.


Table JOBS created.


INDEX JOB_ID_PK created.


Table JOBS altered.


Table EMPLOYEES created.


INDEX EMP_EMP_ID_PK created.


Table EMPLOYEES altered.


Table DEPARTMENTS altered.


Sequence EMPLOYEES_SEQ dropped.


Sequence EMPLOYEES_SEQ created.


Table JOB_HISTORY created.


INDEX JHIST_EMP_ID_ST_DATE_PK created.


Table JOB_HISTORY altered.


View EMP_DETAILS_VIEW created.


Commit complete.


Session altered.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Table DEPARTMENTS altered.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


Table DEPARTMENTS altered.


Commit complete.


Index EMP_DEPARTMENT_IX created.


Index EMP_JOB_IX created.


Index EMP_MANAGER_IX created.


Index EMP_NAME_IX created.


Index DEPT_LOCATION_IX created.


Index JHIST_JOB_IX created.


Index JHIST_EMPLOYEE_IX created.


Index JHIST_DEPARTMENT_IX created.


Index LOC_CITY_IX created.


Index LOC_STATE_PROVINCE_IX created.


Index LOC_COUNTRY_IX created.


Commit complete.


Procedure SECURE_DML compiled


Trigger SECURE_EMPLOYEES compiled


Trigger SECURE_EMPLOYEES altered.


Procedure ADD_JOB_HISTORY compiled


Trigger UPDATE_JOB_HISTORY compiled


Commit complete.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Comment created.


Commit complete.

old:DECLARE
dept_id employees.department_id:=&dept_id;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;

new:DECLARE
dept_id employees.department_id:=80;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;

Error starting at line : 56 in command -
DECLARE
dept_id employees.department_id:=80;
e employees.employee_id;
dept_size varchar2(20);
BEGIN
DBMS_OUTPUT.PUT(dept_id);
select count(e) into employee_id from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE( count(e));
end;
Error report -
ORA-06550: line 2, column 9:
PLS-00488: 'EMPLOYEES.DEPARTMENT_ID' must be a type
ORA-06550: line 0, column 1:
PL/SQL: Compilation unit analysis terminated
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:
