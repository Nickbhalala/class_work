
/*
Nikhil Bhalala
CSC 355 Section :401T
Assignment 2
Date: 09/23/2021,
*/


drop table Assignment;
drop table Route;
drop table Truck;


create table Truck
(
 TID		char(2),
 company	varchar(20),
 year		number(4),
 PRIMARY KEY(TID)
 );
 create table Route
(
 RID		char(4),
 FromCity	varchar(20),
 Tocity		varchar(20),
 TruckId	char(2),
 PRIMARY KEY(RID),
 FOREIGN KEY(TruckId) references Truck(TID)
);
create table Assignment
(
 RouteId	char(4),
 DriverId	char(6),
 DriverName	varchar(20),
 DepartureDate	Date,
 
 PRIMARY KEY(RouteId, DriverId),
 FOREIGN Key(RouteId) references Route(RID)
);


insert into Truck values ('11', 'Brother Trucking', 2015);
insert into Truck values( '12','Rpm Express Inc',2014);
insert into Truck values( '13', 'ABC Trucking Inc',2019);


insert into Route values('R011', 'chicago',  'New York City','11');
insert into Route values('R012', 'Los Angeles',  ' Chicago', '12');
insert into Route values('R013', 'Houston',  'Los Angeles',  '12');
insert into Route values('R014', 'Philadelphia', 'chicago', '13');



insert into Assignment values('R011', '111123','nikhil',Date'2020-09-15');
insert into Assignment values('R013', '111234','kash',Date'2020-06-13');
insert into Assignment values('R014', '111123','nikhil',Date'2020-05-15');
insert into Assignment values('R012', '111123','rrr',Date'2020-07-16');
insert into Assignment values('R014', '111567','neel',Date'2020-08-18');
SELECT
    * FROM Truck;
COMMIT;
SELECT
    * FROM Route;
COMMIT;

SELECT
    * FROM assignment;
COMMIT;
