/* JASON CHAN CSC315 LAB 1 */

-- initialize db
CREATE DATABASE airtraffic;

-- go into db
USE airtraffic;

CREATE TABLE plane (
    ID INTEGER,
    Type CHAR(20),
    NumPassenger INTEGER,
    CargoSize INTEGER
);

INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (1,'Boeing 747',300,150);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (2,'Airbus A330',320,130);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (3,'DC-10',280,150);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (4,'Boeing 737',200,75);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (5,'Airbus A320',180,100);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (6,'Tu-204',150,150);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (7,'ATR 42',70,50);
INSERT INTO plane (ID,Type,NumPassenger,CargoSize) VALUES (8,'Saab 340',60,30);

CREATE TABLE city (
    Name CHAR(20),
    Nation CHAR(10),
    Population INTEGER
);

INSERT INTO city (Name,Nation,Population) VALUES ('Belfast','UK',330000);
INSERT INTO city (Name,Nation,Population) VALUES ('Chicago','USA',2700000);
INSERT INTO city (Name,Nation,Population) VALUES ('Denver','USA',680000);
INSERT INTO city (Name,Nation,Population) VALUES ('Edmonton','CA',900000);
INSERT INTO city (Name,Nation,Population) VALUES ('Kyoto','JP',1400000);
INSERT INTO city (Name,Nation,Population) VALUES ('London','UK',8700000);
INSERT INTO city (Name,Nation,Population) VALUES ('Lyon','FR',480000);
INSERT INTO city (Name,Nation,Population) VALUES ('Montreal','CA',1700000);
INSERT INTO city (Name,Nation,Population) VALUES ('Moscow','RS',12200000);
INSERT INTO city (Name,Nation,Population) VALUES ('New York','USA',8500000);
INSERT INTO city (Name,Nation,Population) VALUES ('Paris','FR',2200000);
INSERT INTO city (Name,Nation,Population) VALUES ('Perth','AU',1600000);
INSERT INTO city (Name,Nation,Population) VALUES ('Portland','USA',640000);
INSERT INTO city (Name,Nation,Population) VALUES ('Seattle','USA',700000);
INSERT INTO city (Name,Nation,Population) VALUES ('Sydney','AU',4000000);
INSERT INTO city (Name,Nation,Population) VALUES ('Tokyo','JP',13600000);
INSERT INTO city (Name,Nation,Population) VALUES ('Vancouver','CA',650000);

CREATE TABLE airport (
    Code CHAR(3),
    City_FK CHAR(20),
    Nation_FK CHAR(10),
    NumTracks INTEGER
);

INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('BFS','Belfast','UK',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('CDG','Paris','FR',6);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('DEN','Denver','USA',2);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('DME','Moscow','RS',10);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('JFK','New York','USA',8);
INSERT INTO airport (Code,City_FK,Nation_FK) VALUES ('KIX','Kyoto','JP');
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('LGA','New York','USA',3);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('LHR','London','UK',12);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('LTN','London','UK',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('LYS','Lyon','FR',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('NRT','Tokyo','JP',5);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('ORD','Chicago','USA',3);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('ORY','Paris','FR',2);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('PDX','Portland','USA',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('PER','Perth','AU',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('SEA','Seattle','USA',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('STN','London','UK',4);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('SYD','Sydney','AU',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('YEG','Edmonton','CA',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('YUL','Montreal','CA',1);
INSERT INTO airport (Code,City_FK,Nation_FK,NumTracks) VALUES ('YVR','Vancouver','CA',1);

CREATE TABLE flight (
    FlightID CHAR(10),
    DayOfWeek CHAR(10),
    DepartureAirport_FK CHAR(3),
    DepartureTime TIME,
    ArrivalAirport_FK CHAR(3),
    ArrivalTime TIME,
    Plane_FK INTEGER
);

INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('AZ101','Wednesday','DEN','22:00','CDG','6:00',1);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('AZ159','Thursday','SEA','9:00','DME','17:00',2);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('AZ178','Sunday','YUL','16:00','JFK','17:00',6);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('BA921','Monday','BFS','6:00','LHR','7:00',8);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('LH522','Wednesday','NRT','12:00','DEN','20:00',3);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('LH532','Friday','YUL','10:00','DEN','13:00',8);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('LH542','Thursday','YVR','22:00','PDX','23:00',3);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('LH575','Sunday','ORD','16:00','PDX','19:00',5);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('LH581','Sunday','ORD','6:00','KIX','14:00',1);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('TW211','Thursday','DEN','8:00','JFK','12:00',4);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('TW250','Monday','YEG','9:00','PDX','11:00',8);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA412','Thursday','SEA','16:00','SYD','2:00',1);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA431','Friday','PER','11:00','SYD','15:00',6);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA455','Saturday','ORD','15:00','DEN','17:00',5);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA465','Saturday','YUL','11:00','ORD','14:00',3);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA472','Tuesday','JFK','10:00','LHR','17:00',2);
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UA499','Wednesday','YEG','18:00','JFK','21:00',4);

-- Query all flights out of Chicago's ORD airport
SELECT * from flight WHERE ArrivalAirport_FK="ORD";
# OUTPUT
-- 02:36:35	SELECT * from flight WHERE ArrivalAirport_FK="ORD" LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec

-- Query all Thursday morning flights
SELECT * from flight where DayOfWeek="Thursday" AND DepartureTime < "12:00";
# OUTPUT
-- 02:38:00	SELECT * from flight where DayOfWeek="Thursday" AND DepartureTime < "12:00" LIMIT 0, 1000	2 row(s) returned	0.000 sec / 0.000 sec

-- Insert a new flight with a new flight ID
INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UwU69','Wednesday','JFK','18:00','DEN','21:00',4);
# OUTPUT
-- 02:39:19	INSERT INTO flight (FlightID,DayOfWeek,DepartureAirport_FK,DepartureTime,ArrivalAirport_FK,ArrivalTime,Plane_FK) VALUES ('UwU69','Wednesday','JFK','18:00','DEN','21:00',4)	1 row(s) affected	0.015 sec

-- Delete the Friday morning flight out of PER
DELETE from flight WHERE DayOfWeek="Friday" AND DepartureAirport_FK="PER" AND DepartureTime <"12:00";
# OUTPUT
-- 02:42:04	DELETE from flight WHERE DayOfWeek="Friday" AND DepartureAirport_FK="PER" AND DepartureTime <"12:00"	1 row(s) affected	0.000 sec

-- Alter each CREATE TABLE statement to add a Primary Key, selecting appropriate field
ALTER TABLE plane ADD PRIMARY KEY(ID);
ALTER TABLE city ADD PRIMARY KEY(Name);
ALTER TABLE airport ADD PRIMARY KEY(Code);
ALTER TABLE flight ADD PRIMARY KEY(FlightID);
SELECT * from flight;
# OUTPUT
-- 02:43:08	ALTER TABLE plane ADD PRIMARY KEY(ID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.062 sec
-- 02:43:13	ALTER TABLE city ADD PRIMARY KEY(Name)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.062 sec
-- 02:43:17	ALTER TABLE airport ADD PRIMARY KEY(Code)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.047 sec
-- 02:43:20	ALTER TABLE flight ADD PRIMARY KEY(FlightID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.032 sec
-- 02:43:23	SELECT * from flight LIMIT 0, 1000	17 row(s) returned	0.000 sec / 0.000 sec

-- Alter necessary CREATE TABLE statements to add a Foreign Key constraint for each field with the '_FK' suffix
ALTER TABLE airport ADD FOREIGN KEY(City_FK) REFERENCES city(name);
ALTER TABLE airport ADD FOREIGN KEY(Nation_FK) REFERENCES city(nation);
ALTER TABLE flight ADD FOREIGN KEY(DepartureAirport_FK) REFERENCES airport(Code);
ALTER TABLE flight ADD FOREIGN KEY(ArrivalAirport_FK) REFERENCES airport(Code);
ALTER TABLE flight ADD FOREIGN KEY(Plane_FK) REFERENCES plane(ID);
# OUTPUT
-- 02:44:55	ALTER TABLE airport ADD FOREIGN KEY(City_FK) REFERENCES city(name)	21 row(s) affected Records: 21  Duplicates: 0  Warnings: 0	0.078 sec
-- 02:45:05	ALTER TABLE airport ADD FOREIGN KEY(Nation_FK) REFERENCES city(nation)	Error Code: 1822. Failed to add the foreign key constraint. Missing index for constraint 'airport_ibfk_2' in the referenced table 'city'	0.000 sec
-- 02:45:15	ALTER TABLE flight ADD FOREIGN KEY(DepartureAirport_FK) REFERENCES airport(Code)	17 row(s) affected Records: 17  Duplicates: 0  Warnings: 0	0.078 sec
-- 02:45:28	ALTER TABLE flight ADD FOREIGN KEY(ArrivalAirport_FK) REFERENCES airport(Code)	17 row(s) affected Records: 17  Duplicates: 0  Warnings: 0	0.078 sec
-- 02:45:42	ALTER TABLE flight ADD FOREIGN KEY(Plane_FK) REFERENCES plane(ID)	17 row(s) affected Records: 17  Duplicates: 0  Warnings: 0	0.078 sec

-- when complete
DROP TABLE flight;
DROP TABLE airport;
DROP TABLE city;
DROP TABLE plane;
DROP DATABASE airtraffic;
