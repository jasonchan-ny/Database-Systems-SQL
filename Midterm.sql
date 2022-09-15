/* JASON CHAN CSC315 Midterm */

CREATE DATABASE CSC315Midterm;
USE CSC315Midterm;

CREATE TABLE Professors(
	PID int, 
    PName varchar(50),
    Field varchar(50), 
    College varchar(50), 
    PhD_Date DATE,
    PRIMARY KEY(PID)
);

CREATE TABLE Flubs(
	FID int,
	Inventor int,
    Citation int,
    Content varchar(100), 
    Purpose varchar(50), 
    Moment varchar(50), 
	PRIMARY KEY(FID),
    FOREIGN KEY(Inventor) REFERENCES Professors(PID)
);

CREATE TABLE Colleagues(
	CID int, 
    PID int,
    PRIMARY KEY(CID),
    FOREIGN KEY(PID) REFERENCES Professors(PID)
);

CREATE TABLE Bounces(
	BID int, 
    FID int,
    PID int,
    PRIMARY KEY(BID),
	FOREIGN KEY(FID) REFERENCES Flubs(FID),
    FOREIGN KEY(PID) REFERENCES Professors(PID)
);

-- adding a new professor
INSERT INTO Professors VALUES (1, 'firstname lastname', 'Computer Science', 'CSI', '2016-3-27');

-- changing a specific professor's name
UPDATE Professors SET PName = 'jason chan'
WHERE PName = 'firstname lastname';

-- removing a flub
DELETE FROM Flubs
WHERE FID = 1;

-- show a portfolio of the flubs by a professors in reverse chronological order
SELECT * FROM Flubs
WHERE Inventor = 1
ORDER BY FID DESC;

-- show a flub along with how many bounces and citations it has
SELECT COUNT(Bounces.BID) AS Bounces, Flubs.*
FROM Flubs, Bounces
WHERE Flubs.FID = 1 AND Bounces.FID = 1;

-- show a portfolio of flubs & bounces by a professors colleagues in reverse chronological order
SELECT Flubs.*, Bounces.*
FROM Flubs, Bounces
WHERE Flubs.FID IN (SELECT CID FROM Colleagues WHERE PID = 1)
AND Bounces.FID IN (SELECT CID FROM Colleagues WHERE PID = 1)
ORDER BY Flubs.FID DESC;

-- extra credit
CREATE VIEW Flubbergasting AS
   SELECT PName, Field, College, PhD_Date,
       (SELECT COUNT(*) FROM Flubs WHERE Flubs.Inventor = P.PID) AS Flub_Count,
       (SELECT AVG (Bounce_Count) FROM
           (SELECT COUNT(*) AS Bounce_Count, Flubs.FID FROM Flubs INNER JOIN Bounces ON Flubs.FID = Bounces.FID WHERE Flubs.Inventor = P.PID
                   GROUP BY Flubs.FID) AS temp) AS Avg_Bounce_Count,
       (SELECT COUNT(*) FROM Flubs WHERE Flubs.FID IN
           (SELECT Flubs.FID FROM Flubs WHERE Flubs.inventor = P.PID)) AS Citation_Count
   FROM Professors P;

DROP DATABASE CSC315Midterm;

-- sample data
INSERT INTO Flubs VALUES (1, 1, 23, 'text', 'text2', 'text3');
INSERT INTO Flubs VALUES (2, 3, 29, 'text', 'text2', 'text3');
INSERT INTO Flubs VALUES (3, 2, 26, 'text', 'text2', 'text3');
INSERT INTO Flubs VALUES (4, 1, 26, 'text', 'text2', 'text3');

INSERT INTO Colleagues VALUES (1, 1);
INSERT INTO Colleagues VALUES (2, 2);
INSERT INTO Colleagues VALUES (3, 3);
INSERT INTO Colleagues VALUES (4, 1);

INSERT INTO Bounces VALUES (1, 1, 1);
INSERT INTO Bounces VALUES (2, 2, 2);
INSERT INTO Bounces VALUES (3, 3, 3);
INSERT INTO Bounces VALUES (4, 1, 3);

INSERT INTO Professors VALUES (1, 'firstname lastname', 'Computer Science', 'CSI', '2016-3-27');
INSERT INTO Professors VALUES (2, 'firstname lastname', 'Computer Science', 'CSI', '2016-3-27');
INSERT INTO Professors VALUES (3, 'firstname lastname', 'Computer Science', 'CSI', '2016-3-27');