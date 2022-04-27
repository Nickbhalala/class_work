---Q1
DECLARE
type tab_column is RECORD
(
col_name    varchar2 (30),
data_type  varchar2(30),
data_len   NUMBER
);
v1 tab_column;
CURSOR c is select  column_name, data_type, data_length from user_tab_columns 
 where table_name = 'EMPLOYEES';

BEGIN
OPEN c;
loop
FETCH c into v1;
exit when c%notfound;
 dbms_output.put(rpad(c%rowcount, 6) || '   ' );
      dbms_output.put_line(rpad(v1.col_name,25,' ') || rpad(v1.data_type,25) || v1.data_len);
 end loop;
close c;
end;
/
--Q2
DECLARE
TYPE Emp_Sal  is RECORD
(
emp_no   employees.employee_id%TYPE, 
full_name  VARCHAR2(46),
sal      employees.salary%type
);
v2  Emp_Sal;
CURSOR c is select employee_id , (first_name || ' '|| last_name) as fil ,salary
from employees
where employee_id =105;

BEGIN
OPEN c;
loop
FETCH c into v2;
exit when c%notfound;
 dbms_output.put(rpad(c%rowcount, 6) || '   ' );
      dbms_output.put_line(rpad(v2.emp_no,25,' ') || rpad(v2.full_name,25) || v2.sal);
 end loop;
close c;
end;
/

----Q3
DECLARE
TYPE Emp_Sal  is RECORD
(
emp_no   employees.employee_id%TYPE, 
full_name  VARCHAR2(46),
sal      employees.salary%type
);
v2  Emp_Sal;

TYPE Emp_Sal_NT is table of Emp_Sal;
list Emp_Sal_NT:=Emp_Sal_NT();
CURSOR c is  select employee_id , (first_name || ' '|| last_name) as fil ,salary from Employees
where department_id =30;
i INTEGER :=1;
BEGIN
list.extend(50);
for indx in c loop
list(i).emp_no := indx.employee_id;
list(i).full_name := indx.fil;
list(i).sal:= indx.salary;
DBMS_OUTPUT.PUT_LINE (RPAD(c%rowcount,6)|| RPAD(LIST(i).emp_no, 9) 
        || RPAD (LIST(i).full_name, 25) || RPAD(LIST(i).sal ,25)  );
i := i + 1;        
End loop;

end;
/

---Q4
Declare

dept_id    employees.department_id%TYPE := 60;
dept_name   varchar2 (30);
 mgr_name    varchar2 (46);
 procedure dept_info
(  
deptno         IN    employees.department_id%type,
deptname   OUT   departments.department_name%type
)
    IS         
    BEGIN
        SELECT  department_name
        INTO    deptname
        FROM    departments
        WHERE   department_id = deptno ;
        END dept_info;
BEGIN
dept_info ( dept_id, dept_name);
DBMS_OUTPUT.PUT_LINE(dept_id ||' '|| dept_name ) ;
END;
/
--rollback;

---q5 
create or replace procedure dept_info
(  
deptno         IN    employees.department_id%type,
deptname   OUT   departments.department_name%type
) is
BEGIN
       
        SELECT  department_name
        INTO    deptname
        FROM    departments
        WHERE   department_id = deptno ;
    
         
end;
/
declare
cursor c  is SELECT    department_ID, count (*)
          FROM      employees 
          where     department_id is not null
          GROUP BY  department_ID
          HAVING    count (*) <= 3 ;
c1  c%rowtype;
dept_id    employees.department_id%TYPE ;
dept_name   varchar2 (30);
begin
open c;
loop
FETCH c into c1;
EXIT WHEN c%NOTFOUND;
dept_info ( c1.department_ID, dept_name);
DBMS_OUTPUT.PUT_LINE(c1.department_ID ||'  '|| dept_name ) ;
end loop;
CLOSE c;
end;
/





