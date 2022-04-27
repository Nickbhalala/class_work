@C:\Users\bhala\Downloads\Oracle_sample_crt_employees_Countires_script_edited.sql;

 ----Q1)
DECLARE
 
    number_of_employees NUMBER;
    
    
    count_query VARCHAR2(340) := 'SELECT count(*) FROM employees WHERE salary <= :mini_sal ';
BEGIN

    
    EXECUTE IMMEDIATE count_query INTO number_of_employees USING 2400 ;
    
    -- print result
    dbms_output.put_line(' Number Of Employees  : ' || number_of_employees);
    
END;
/

--Q2)

CREATE or REPLACE PROCEDURE 
 Emp_info( Emp_ID number, l_name  OUT  employees.last_name%type ,  sal  out number, managerId out number)
    IS
BEGIN
       SELECT  Last_name ,salary , manager_id
       INTO      l_name ,   sal  , managerId
       FROM 	employees 
       where employee_ID = emp_ID;
     
end emp_info;
/
DECLARE
--emp_id_E employees.employee_id%type;
 e_lastname  employees.last_name%type ;
 e_sal number (8, 2) ; 
 e_mangerid  number;


--Emp_Bonus number;
   Cursor C IS SELECT employee_id from employees where salary >=2450;
   c1 c%rowtype;
BEGIN
for indx in c loop
 Emp_info( indx.employee_id,  e_lastname, e_sal, e_mangerid );

 DBMS_OUTPUT.PUT_LINE ( RPAD (indx.employee_id, 12)  ||'        '||  e_lastname ||'       '
 ||      To_char (e_sal, '$99,999') || '        '|| e_mangerid );
 end loop;
 end;
/
ROLLBACK;
----Q3)
DECLARE
type Emp_Info is RECORD
(
 emp_id number(6),
 fullname VARCHAR2(46),
 sal number(8,2),
 deptid number
 
);
v     Emp_info  ;
d_id   number (6) := 60;
Cursor C IS

   SELECT employee_id from employees where department_id =d_id  ;
function  Get_Emp_Info( emp_id number)
return Emp_info
is 
--emp_id number(6);
 fullname VARCHAR2(46);
 sal number(8,2);
 deptid number;
vei Emp_info;
BEGIN
select  employee_ID , (first_name ||' '|| last_name) as fullname,  salary ,department_id 
into
 vei. emp_id , vei.fullname , vei.sal ,vei.deptid  from  	employees 
where  employee_ID = emp_ID;
return vei;
end Get_Emp_Info;
BEGIN
For indx in C LOOP
      --Emp_Bonus;
       v:= Get_Emp_Info(indx.employee_id);
        DBMS_OUTPUT.PUT_LINE ( RPAD (v.emp_ID, 12) ||V.fullname || '    '||V.sal ||'    '||V.deptid);
end loop;
end;
/


---Q4)
drop PACKAGE  Pkg_dept_info;
drop PACKAGE BODY Pkg_dept_info;
CREATE OR REPLACE PACKAGE Pkg_dept_info AUTHID DEFINER
IS 
    FUNCTION dpt_info 
     ( dept_id	number)
       RETURN number;
    FUNCTION dpt_info 
     ( dept_name departments.department_name %type)
       RETURN number;      
       
END Pkg_dept_info;
/
CREATE OR REPLACE PACKAGE BODY Pkg_dept_info 
is	 
   FUNCTION dpt_info 
     ( dept_id	number)
       RETURN number
      IS
       ret    number (9,2); 	
   BEGIN
     SELECT count( employees.employee_id) as NUMBER_OF_employees into ret
    FROM   departments INNER join employees on departments.department_id= employees.department_id
    WHERE  departments.department_id = dept_id
    group by departments.department_id;
    RETURN ret;
   END dpt_info  ;

   FUNCTION dpt_info 
     ( dept_name  departments.department_name%type)
       RETURN number
      IS
       ret    number (9,2); 	
   BEGIN
    SELECT count( employees.employee_id) as NUMBER_OF_employees into ret
    FROM   departments INNER join employees on departments.department_id=employees.department_id
    WHERE  departments.department_name = dept_name
    group by departments.department_id;

    RETURN ret;
   END dpt_info ; 
end Pkg_dept_info;
/
DECLARE
local_variable_al departments.department_id%type :=  Pkg_dept_info.dpt_info  ( 60) ;
local_variable_a2 departments.department_name%TYPE:=  Pkg_dept_info.dpt_info  ( 'IT'  ) ;
begin
dbms_output.put_line('NUMBER_OF_employees'||' '||local_variable_al);
dbms_output.put_line('NUMBER_OF_employees'||' '||local_variable_a2);
END;
/


--Q5)
DROP TABLE Emp_log;
CREATE TABLE Emp_log  (
   Old_employee_ID     number (8),
   old_salary          number(9),
   new_salary          number(9),
   Updated_Date	  DATE,
   Updated_By	  Varchar2 (15),
   Action         Varchar2 (30)
);

CREATE OR REPLACE TRIGGER Emp_Change
   AFTER DELETE  or update  of salary ON employees
   FOR EACH ROW
   BEGIN
   if  UPDATING('salary') then
       INSERT INTO Emp_log VALUES
          ( :old.employee_ID, :old.salary , :new.salary , Sysdate, user, 'UPDATING  salary');
          
     ELSIF DELETING THEN
     INSERT INTO Emp_log VALUES
          ( :old.employee_ID, :old.salary , :new.salary , Sysdate, user, 'Deleted one employees ');
          
   ELSE	
	 DBMS_OUTPUT.PUT_LINE('something goes wrong');
      END IF;        
END Emp_Change ;
/

UPDATE employees set salary = salary * 1.2 WHERE employee_id = 111;
-- SELECT * from Emp_log;
-- rollback;

DELETE employees where employee_id = 111;
-- SELECT * from Emp_log;
-- rollback;





