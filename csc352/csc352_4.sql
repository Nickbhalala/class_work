@C:\Users\bhala\Downloads\Oracle_sample_crt_employees_Countires_script_edited.sql;


--------Q3
declare 
Exceed_Limit  EXCEPTION;
counter NUMBER:=100;
BEGIN
 loop
 
 if counter >=119 THEN RAISE exceed_limit;
 else 
 dbms_output.put_line(counter);
 counter:=counter+5;
 end if;
 end loop;
 exception 
 when Exceed_limit then 
 dbms_output.put_line('it Exceed_limit');
end;
/
------Q4
DECLARE
 CURSOR c_1 is select  employees.employee_id ,salary from employees
                       where job_id= 'IT_PROG';
c  c_1%rowtype;
Sal_Below_MIN  EXCEPTION;
error_code NUMBER;
BEGIN
open c_1;
loop
FETCH c_1 into c;
EXIT WHEN c_1%NOTFOUND;
--dbms_output.put_line(c.employee_id || ' '|| c .salary);
begin

if c.salary <5000 then RAISE  Sal_Below_MIN;
ELSE
DBMS_OUTPUT.PUT_LINE ('Salary ' || c .salary  ||' is fine.');

end if;
exception 
WHEN Sal_Below_MIN then 
dbms_output.put_line(c.employee_id || ' '|| c .salary );
end;
end loop;
exception 
when OTHERS THEN
dbms_output.put_line(c.employee_id || ' '|| c .salary );




CLOSE c_1;

end;
/
-----Q5
DROP TABLE log_error; -- in case you have that table created, otherwise ignore it

CREATE TABLE log_error (
  Occur_date  DATE DEFAULT SYSDATE,
  Username    VARCHAR2 (15) DEFAULT USER,
  Err_code    NUMBER,
  Err_msg     VARCHAR2 (255));
  
DECLARE
v_code  NUMBER;
v_errm  VARCHAR2(255);
 
BEGIN
DELETE from employees WHERE employee_id =104;
dbms_output.put_line('The employee 104 is deleted. ' );
--rollback;

DELETE from employees WHERE employee_id =123;
dbms_output.put_line('The employee 104 is deleted. ' );
--rollback;
EXCEPTION
when OTHERS then 
v_code := SQLCODE;
v_errm := SQLERRM;
INSERT into log_error( Occur_date ,  Username ,   Err_code ,Err_msg)VALUES (   SYSDATE, USER, v_code , v_errm  );

end;
/
 select * from log_error;



