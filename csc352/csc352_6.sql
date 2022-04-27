
---nikhil bhalala
--- csc352
--Q1-a)
DECLARE
e_sal      number (8, 2) := 0; 
   e_comm     number (2, 2) := 0; 
   e_bonus    number (8, 2) := 0;

   Cursor C IS
   SELECT employee_id from employees where department_id in (60);

   Procedure Emp_Bonus ( Emp_ID number, 
         Sal OUT Number, Comm OUT Number, Bonus OUT Number )
    IS
     
   BEGIN
       SELECT 	salary, NVL (commission_pct, 0) comm_rate
       INTO     sal,    comm 
       FROM 	employees 
       Where    employee_ID = emp_ID; 
       
 if comm >=0.25 then 
 if sal >=10000 then bonus:=1000;
 ELSIF sal >=7000 then bonus:=800;
 ELSE
 bonus:=600;
 end if;
 ELSIF comm < 0.25 then 
 if sal >=10000 then bonus:=700;
 ELSIF sal >=7000 then bonus:=600;
 ELSE
 bonus:=500;
 end if ;
 ELSIF comm is null then 
 if sal >=10000 then bonus:=1500;
 ELSIF sal >=7000 then bonus:=1200;
 ELSE
 bonus:=110;
 end if ;
 end if;
end emp_bonus;
BEGIN
--emp_bonus( Emp_ID ,  Sal, Comm ,Bonus );
DBMS_OUTPUT.PUT_LINE (' Employee ID  Salary   Commission PCT    Bonus ');
   DBMS_OUTPUT.PUT_LINE ('------------ --------- -------------- ---------  ');

For indx in C LOOP
       Emp_Bonus ( indx.employee_id, e_sal, e_comm, e_bonus );

    DBMS_OUTPUT.PUT_LINE ( RPAD (indx.employee_id, 12)  ||
      To_char (e_sal, '$99,999') || LPAD (e_comm, 15) || To_char (e_bonus, '$99,999') );
   END loop;
end;
/

--Q1b)
CREATE or REPLACE PROCEDURE 
 Emp_Bonus ( Emp_ID number, Sal OUT Number, Comm OUT Number, Bonus OUT Number)
    IS
BEGIN
       SELECT 	salary, NVL (commission_pct, 0) comm_rate
       INTO     sal,    comm 
       FROM 	employees 
       Where    employee_ID = emp_ID; 
 if comm >=0.25 then 
     if sal >=10000 then bonus:=1000;
     ELSIF sal >=7000 then bonus:=800;
     ELSE
     bonus:=600;
     end if;
 ELSIF comm < 0.25 then 
     if sal >=10000 then bonus:=700;
    ELSIF sal >=7000 then bonus:=600;
    ELSE
     bonus:=500;
    end if ;
 ELSIF comm is null then 
     if sal >=10000 then bonus:=1500;
    ELSIF sal >=7000 then bonus:=1200;
    ELSE
        bonus:=110;
    end if ;
 end if;
end emp_bonus;
/
 DECLARE
e_sal      number (8, 2) := 0; 
e_comm     number (2, 2) := 0; 
e_bonus    number (8, 2) := 0;

   Cursor C IS SELECT employee_id from employees where department_id in (60);
   c1 c%rowtype;
BEGIN
DBMS_OUTPUT.PUT_LINE (' Employee ID  Salary   Commission PCT    Bonus ');
   DBMS_OUTPUT.PUT_LINE ('------------ --------- -------------- ---------  ');

For indx in C LOOP
       Emp_Bonus ( indx.employee_id, e_sal, e_comm, e_bonus );

    DBMS_OUTPUT.PUT_LINE ( RPAD (indx.employee_id, 12)  ||
      To_char (e_sal, '$99,999') || LPAD (e_comm, 15) || To_char (e_bonus, '$99,999') );
   END loop; 
end;
 /
 
 --q1c)
 CREATE or REPLACE FUNCTION  F_Emp_Bonus
 (emp_id in number)
 return number
 is 
 Sal  Number; 
 Comm  Number;
 Bonus  Number;
 BEGIN
       SELECT 	salary, NVL (commission_pct, 0) comm_rate
       INTO     sal,    comm 
       FROM 	employees 
       Where    employee_ID = emp_ID; 
 if comm >=0.25 then 
     if sal >=10000 then bonus:=1000;
     ELSIF sal >=7000 then bonus:=800;
     ELSE
     bonus:=600;
     end if;
 ELSIF comm < 0.25 then 
     if sal >=10000 then bonus:=700;
    ELSIF sal >=7000 then bonus:=600;
    ELSE
     bonus:=500;
    end if ;
 ELSIF comm is null then 
     if sal >=10000 then bonus:=1500;
    ELSIF sal >=7000 then bonus:=1200;
    ELSE
        bonus:=110;
    end if ;
 end if;
--RETURN sal;
--RETURN comm;
RETURN bonus;
end f_emp_bonus;
/
DECLARE
e_sal      number (8, 2) := 0; 
e_comm     number (2, 2) := 0; 
e_bonus    number (8, 2) := 0;
--Emp_Bonus number;
   Cursor C IS SELECT employee_id from employees where department_id in (60);
   c1 c%rowtype;
v number;
BEGIN
DBMS_OUTPUT.PUT_LINE ( 'Employee ID    Bonus ');
   DBMS_OUTPUT.PUT_LINE ('-----------  ');
For indx in C LOOP
      --f_Emp_Bonus ( indx.employee_id);
      DBMS_OUTPUT.PUT_LINE( RPAD (indx.employee_id, 12)|| f_Emp_Bonus( indx.employee_id));

    --DBMS_OUTPUT.PUT_LINE ( RPAD (indx.employee_id, 12)  ||
      --To_char (e_sal, '$99,999') || LPAD (e_comm, 15) || To_char (e_bonus, '$99,999') );
   END loop; 
end;
 /
 
--Q2)
Declare

 Cursor C IS
   SELECT employee_id from employees where department_id in (60);
 vi  number;
  TYPE E_bonus IS RECORD
   ( Emp_id   number (6),
     Sal      number (8, 2),
     comm     number (2, 2), 
     bonus    number (6) ); 
  
   v       E_bonus;
 Function F_Emp_Bonus ( Emp_ID number)
 RETURN E_bonus
is 
 Sal  Number; 
 Comm  Number;
 Bonus  Number;
 vei  E_bonus ;
 
 BEGIN
       SELECT 	salary, NVL (commission_pct, 0) comm_rate
       INTO     vei.sal,    vei.comm 
       FROM 	employees 
       Where    employee_ID = emp_ID; 
 if vei.comm >=0.25 then 
     if vei.sal >=10000 then vei.bonus:=1000;
     ELSIF vei.sal >=7000 then vei.bonus:=800;
     ELSE
     vei.bonus:=600;
     end if;
 ELSIF vei.comm < 0.25 then 
     if vei.sal >=10000 then vei.bonus:=700;
    ELSIF vei.sal >=7000 then vei.bonus:=600;
    ELSE
     vei.bonus:=500;
    end if ;
 ELSIF vei.comm is null then 
     if vei.sal >=10000 then vei.bonus:=1500;
    ELSIF vei.sal >=7000 then vei.bonus:=1200;
    ELSE
        vei.bonus:=110;
    end if ;
 end if;
--RETURN sal;
--RETURN comm;
RETURN vei;
end F_Emp_Bonus;

BEGIN
DBMS_OUTPUT.PUT_LINE (  'Salary   Commission PCT    Bonus ');
   DBMS_OUTPUT.PUT_LINE ('------------ --------- --------------   ');
For indx in C LOOP
      --Emp_Bonus;
       v:= F_Emp_Bonus(indx.employee_id);
     -- DBMS_OUTPUT.PUT_LINE( );

    DBMS_OUTPUT.PUT_LINE ( RPAD (v.emp_ID, 12)  ||
    To_char (v.sal, '$99,999') || LPAD (v.comm, 15) || To_char (v.bonus, '$99,999') );
   END loop; 
end;
 /

--Q3)

DECLARE
    empid     employees.employee_id%TYPE := 100;  
    emp_mail  employees.email%TYPE:='SKING' ;
   FUNCTION Emp_Sal 
     ( emp_id	employees.employee_id%TYPE)
       RETURN number
      IS
       ret    number (9,2); 	
   BEGIN
     select   salary into  ret from   employees
     where  employee_ID = empid ; 
     return ret;
   END Emp_Sal ;

   FUNCTION Emp_Sal 
     ( emp_mail	employees.email%TYPE)
       RETURN number
      IS
       ret    number (9,2); 	
   BEGIN
    select   salary  into  ret from   employees
     where email = emp_mail  ; 
     return ret;
   END Emp_Sal ;
BEGIN
DBMS_OUTPUT.PUT_LINE ('First call, ret is empid  ' ||

', returned value ret = '||Emp_Sal(empid ));

DBMS_OUTPUT.PUT_LINE ('second call, ret is emp_mail  ' ||

', returned value  ret = '||(Emp_Sal( emp_mail)));
end;
/
--Q4
DECLARE
TYPE emp_name IS RECORD (
 f_name   varchar2 (20),
 l_name   varchar2 (25)
);
emp1 emp_name;
emp2 emp_name;
emp3 emp_name;
FUNCTION Emp_name_eq( r1 in emp_name , r2 in emp_name ) 
return  Boolean
is
v   Boolean;
BEGIN
if( r1.f_name=r2.f_name and r1.l_name= r2.l_name)then 
v:=true;
else
v:=false;
end if;
return v;
end Emp_name_eq;
BEGIN
select  first_name , last_name into emp1.f_name ,emp1.l_name from employees
where employee_id = 102;
emp2:=emp1;
emp3.f_name:= 'Winston' ;
emp3.l_name := 'Taylor';
if emp_name_eq(emp1,emp2)then
 DBMS_OUTPUT.PUT_LINE('emp1 and emp2 are same' );
 else
 DBMS_OUTPUT.PUT_LINE('emp1 and emp2 are not  same' );
end if;

if emp_name_eq(emp1,emp3)then
 DBMS_OUTPUT.PUT_LINE('emp1 and emp3 are same' );
 else
 DBMS_OUTPUT.PUT_LINE('emp1 and emp3 are not  same' );
end if;                  
end;
/

 
 
  
    
 