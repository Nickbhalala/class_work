 @C:\Users\bhala\Downloads\Oracle_sample_crt_employees_Countires_script_edited.sql;

--Q1
DECLARE
 dep_id  departments.department_id%TYPE :=777;
 dep_Name departments.department_name%TYPE:='Deleteme';
 dep_manager_id departments.manager_id%TYPE:=100;
 dep_location_id departments.location_id%TYPE:=1700;
 
 BEGIN
 INSERT into departments
 (department_id ,department_name,manager_id,location_id)
 VALUES(dep_id, dep_Name, dep_manager_id ,dep_location_id);
 DBMS_OUTPUT.PUT_LINE ('New record of departments is instert='||' '||
 dep_id ||' '|| dep_Name ||' '|| dep_manager_id ||' '||dep_location_id);
 
end;
/



--Q2
DECLARE
dep_id  departments.department_id%TYPE :=777;
 dep_Name departments.department_name%TYPE:='Deleteme';
 dep_manager_id departments.manager_id%TYPE:=100;
 dep_location_id departments.location_id%TYPE:=1700;
BEGIN
DELETE from departments WHERE department_id =dep_id
RETURNING department_name, manager_id,location_id into 
dep_Name, dep_manager_id ,dep_location_id;
DBMS_OUTPUT.PUT_LINE 
        ('After DELETION: the record deleted had  department_id'||' '||
       dep_id ||' '|| dep_Name ||' '|| dep_manager_id ||' '||dep_location_id);

end;
/

 --Q3
 
 DECLARE
dep_id  departments.department_id%TYPE:=230 ;
 dep_Name departments.department_name%TYPE;
 dep_manager_id departments.manager_id%TYPE;
 dep_location_id departments.location_id%TYPE;
 
 BEGIN
 UPDATE departments set manager_id=103
 where department_id = dep_id
 RETURNING department_name into dep_name;
 DBMS_OUTPUT.PUT_LINE 
        ('After update: the record Update in  department of '||' '||dep_name);
 end;
 /
 
 
---Q4

DECLARE

dept_id employees.department_id%TYPE:= 80;
e employees.employee_id%TYPE;
dept_size varchar2(20);

BEGIN
dbms_output.put_line(dept_id);
select count(employees.employee_id)into e from employees
where department_id =dept_id;
DBMS_OUTPUT.PUT_LINE(e);

case 
when e>=30 then dept_size:='LARGE';
DBMS_OUTPUT.PUT_LINE(dept_size);
when e>8  or e<=29 then dept_size:='MEDIUM';
DBMS_OUTPUT.PUT_LINE(dept_size);
when e<8  then dept_size:='SAMLL';
DBMS_OUTPUT.PUT_LINE(dept_size);
end case;
end;
/

---Q5
select employee_id, salary, 
		floor (months_between (sysdate, hire_date)/12) Years
FROM 	employees 
where employee_id in ( 128, 192, 206);


DECLARE
employ_id employees.employee_id%TYPE := 192;
e_salary employees.salary%TYPE;
Years number; 
h employees.hire_date%type;
hi number :=floor (months_between (sysdate, h)/12) ;
s number;
sb number;
BEGIN
select employee_id, salary , hire_date ,floor (months_between (sysdate, hire_date)/12)  years into 
        employ_id, e_salary ,h ,hi FROM 	employees 
        where employee_id = employ_id;
DBMS_OUTPUT.PUT_LINE( employ_id );
DBMS_OUTPUT.PUT_LINE( e_salary );
DBMS_OUTPUT.PUT_LINE( hi );
if e_salary >10000 then
sb:=1100;
 if (hi <25) then 
 s:= e_salary +1000+sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELSIF (hi >=25 and hi<27) then
 s:= e_salary +1000+500 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELse
 s:= e_salary +1000+700 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 end if;
elsif e_salary >=5000 and e_salary<=10000 then
sb:=1000;
 if (hi <25) then 
 s:= e_salary +1000+sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELSIF (hi >=25 and hi<27) then
 s:= e_salary +1000+500 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELse
 s:= e_salary +1000+700 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 end if; 
 else
sb:=900;
 if (hi <25) then 
 s:= e_salary +1000+sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELSIF (hi >=25 and hi<27) then
 s:= e_salary +1000+500 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 ELse
 s:= e_salary +1000+700 +sb;
 DBMS_OUTPUT.PUT_LINE(s);
 end if;
 end if;
end;
/


---Q6
declare
x number :=76;
BEGIN

    DBMS_OUTPUT.PUT_LINE ('Basic loop');

LOOP

DBMS_OUTPUT.PUT_LINE ('Inside loop: x = ' || TO_CHAR(x));

x := x + 1;

IF x >= 80 THEN
EXIT;
 END IF; 
 END LOOP;

 
 end;
 / 
 
 
DECLARE

BEGIN
DBMS_OUTPUT.PUT_LINE ('For loop');

for i in  76..79 loop
DBMS_OUTPUT.PUT_LINE ('Inside loop: i = ' || TO_CHAR(i));
end loop;


end;
/
commit;

declare
counter number := 76;
begin
DBMS_OUTPUT.PUT_LINE ('while loop');
while (counter < 80) loop
dbms_output.put_line('Inside loop: counter = ' || TO_CHAR(counter));
counter := counter + 1;
end loop;

end;
/
commit;

------Q7

DECLARE
   str  varchar2 (80);
   i    integer := 1 ;
   j    integer := 1 ;
BEGIN
  for i in 1..9 LOOP
    for j in 1..9   LOOP 
        str := str || RPAD (TO_CHAR ( i*10 + j ), 4) ;
    END LOOP;                  -- end of inner loop
   
    DBMS_OUTPUT.PUT_LINE ( '|  ' || str ||'|' );
                                  -- print out one line 
      str := null;     -- re-set the line to null for next line/next i 
      -- j := 1;
      -- i := i + 1;
      -- Exit when i > 9 
 END loop;
END;
/


---Q8
CREATE TABLE EMP_TEST as select * from employees 
           where department_id in (20, 30, 60);
SELECT * from EMP_TEST;
 DECLARE
 BEGIN
 update  EMP_TEST

   set salary = salary * 1.1 

   where department_ID = 30 and salary <= 3000;

   DBMS_OUTPUT.PUT_LINE ('Number of employees updated: '||

                  TO_CHAR(SQL%ROWCOUNT));
                  
DELETE from  EMP_TEST WHERE department_id =20;
 
 end;
 /
 ROLLBACK ;

---q9)

declare
emloy_id employees.employee_id%type;
f_name employees.first_name%type;
l_name employees.last_name%type;
fullName varchar2(46);
dept_id employees.department_id%TYPE:=60;
cursor emloyPtr is select employee_id, (last_name ||' '|| first_name )as fullName
from employees
where department_id =dept_id ;
begin
open emloyPtr;
loop
fetch emloyPtr into emloy_id, fullName  ;
if emloyPtr%found then 
DBMS_OUTPUT.PUT_LINE(emloy_id ||' '|| fullName);
--DBMS_OUTPUT.PUT_LINE(employPtr%ROWTYPE);
else
exit;
end if;
end loop;
close emloyPtr;
end;
/




