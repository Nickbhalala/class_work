DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
CREATE TABLE EMPLOYEE
(
	EmployeeID	CHAR(4)		PRIMARY KEY,
	EmployeeName	VARCHAR2(12),
	EmployeeSalary	NUMBER(8,2)
);
INSERT INTO EMPLOYEE VALUES ('4115', 'A', 32000);
INSERT INTO EMPLOYEE VALUES ('9002', 'B', 62000);
INSERT INTO EMPLOYEE VALUES ('3321', 'C', 15000);
INSERT INTO EMPLOYEE VALUES ('3099', 'D', 70000);
INSERT INTO EMPLOYEE VALUES ('1011', 'E', 50000);
INSERT INTO EMPLOYEE VALUES ('8908', 'F', 25000);
INSERT INTO EMPLOYEE VALUES ('2900', 'G', 10000);
SELECT * FROM EMPLOYEE;
DROP TABLE TAXINFO CASCADE CONSTRAINTS;
CREATE TABLE TAXINFO
(
	TaxRate		NUMBER(3,2),
	MaxTax		NUMBER(6,2)
);
INSERT INTO TAXINFO VALUES (0.05, 2500.00);
SELECT * FROM TAXINFO;
--

declare
einto employee%rowtype; 
TAX TAXINFO.TaxRate%TYPE;
MTAX TAXINFO.MaxTax%TYPE;
taxn  INTEGER;
netTotal  INTEGER;
wtax integer;
totalw INTEGER;
i INTEGER;
j INTEGER;

cursor employeestable is select  * from Employee;   
begin
select* into tax,mtax from taxinfo;

DBMS_OUTPUT.PUT_line( 'tax rate: ' || TAX );
DBMS_OUTPUT.PUT_line( 'maxTax: ' || MTAX);
dbms_output.put_line('');
--OPEN Employeestable;
j:=0;
i:=0;
for einto in employeestable loop
taxn:=einto.employeesalary *tax;


if taxn >=MTAX then 
wtax:= einto.employeesalary-Mtax;
dbms_output.put_line( einto.employeeid||':'||''|| einto.employeesalary||' '||Mtax ||' '||wtax ||'*'  );
i:=i+mtax;
else
nettotal:= einto.employeesalary -taxn;
dbms_output.put_line( einto.employeeid||':'||''|| einto.employeesalary||' '||taxn ||' '||nettotal  );
j:=j + taxn;
end if;
dbms_output.put_line(' ');
end loop;
totalw:=i+j;
 
dbms_output.put_line('Total tax withheld:'||' ' ||totalw );
   
   -- close Employeestable;
    
    


END;
/