DROP TABLE GRADING;
CREATE TABLE GRADING
(
CNumber CHAR(7),
CTitle VARCHAR(20),
SID CHAR(3),
SName VARCHAR(20),
Grade VARCHAR(2),
CONSTRAINT PK_GRADING
PRIMARY KEY (CNumber, SID)
);
INSERT INTO GRADING
VALUES ('CSC 355', 'Database Systems', '111', 'Tanner', 'A-');
INSERT INTO GRADING
VALUES ('CSC 352', 'Database Programming', '111', 'Tanner', 'A-');
INSERT INTO GRADING
VALUES ('CSC 370', 'Intro to Robotics', '222', 'Tanner', 'B+');
INSERT INTO GRADING
VALUES ('CSC 452', 'Database Programming', '333', 'Gibler', 'A');
INSERT INTO GRADING
VALUES ('CSC 355', 'Database Systems', '444', 'Katsopolis', 'A-');
SELECT * FROM GRADING;
-- This anonymous PL/SQL block defines three variables to hold
-- the values of a single record returned by a query, executes the
-- query and stores the results in the variables, and then
-- displays them...
declare
c GRADING.CNumber%type;
s GRADING.SName%type;
g GRADING.Grade%type;
targetID GRADING.SID%type := &targetID;
begin
DBMS_OUTPUT.PUT( 'Querying GRADING table for SID ' || targetID || ' ... ');
-- This statement stores the result of the query in the three variables
SELECT CNumber, SName, Grade
INTO c, s, g
FROM GRADING
WHERE SID = targetID;
DBMS_OUTPUT.PUT_LINE( 'Query done!' );
DBMS_OUTPUT.PUT_LINE('');
DBMS_OUTPUT.PUT_LINE( 'For SID ' || targetID || ':');
DBMS_OUTPUT.PUT_LINE( 'Name is ' || s ||
', Course is ' || c ||
', Grade is ' || g );
end;
/
    
    
        