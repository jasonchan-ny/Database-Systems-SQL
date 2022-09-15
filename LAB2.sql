/* JASON CHAN CSC315 LAB 2 */

-- PART A

-- Initialize db
CREATE DATABASE CSC315Lab2;

-- Go into db
USE CSC315Lab2;

-- Initialize following schema:
-- Suppliers(sid: integer, sname: string, address: string)
CREATE TABLE Suppliers(
	sid integer,
	sname varchar(40),
	address varchar(40),
    PRIMARY KEY (sid)
);
-- Parts(pid: integer, pname: string, color: string)
CREATE TABLE Parts(
	pid integer,
	pname varchar(40),
	color varchar(40),
    PRIMARY KEY (pid)
);
-- Catalog(sid: integer, pid: integer, cost: real)
CREATE TABLE Catalog (
	sid integer,
	pid integer,
	cost real,
    FOREIGN KEY(sid) REFERENCES suppliers(sid),
    FOREIGN KEY(pid) REFERENCES parts(pid)
);

-- Populate the following tables with sample data:
-- sid, sname, address
INSERT INTO Suppliers VALUES (20, 'Acme Widget Suppliers', '13 Mad Dog Lane');
INSERT INTO Suppliers VALUES (21, 'Apple', '112 Psycho Path');
INSERT INTO Suppliers VALUES (22, 'Nvidia', '420 Bigfoot Rd');
INSERT INTO Suppliers VALUES (23, 'Amazon', '53 Chicken In The Woods Rd');
-- real street names btw^^

-- pid, pname, color
INSERT INTO Parts VALUES(30, 'widget', 'green');
INSERT INTO Parts VALUES(31, 'phone', 'red');
INSERT INTO Parts VALUES(32, 'graphic card', 'green');
INSERT INTO Parts VALUES(33, 'ps5', 'red');

-- sid, pid, cost
INSERT INTO Catalog VALUES(20, 30, 30.50);
INSERT INTO Catalog VALUES(21, 31, 749.99);
INSERT INTO Catalog VALUES(22, 32, 549.99);
INSERT INTO Catalog VALUES(23, 30, 21.00);
INSERT INTO Catalog VALUES(23, 31, 649.99);
INSERT INTO Catalog VALUES(23, 32, 1250.00);
INSERT INTO Catalog VALUES(23, 33, 999.99);

SELECT * FROM CATALOG;

-- Part B

--  Write the following queries in SQL:
-- 1. Find the pnames of parts for which there is some supplier.
SELECT DISTINCT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;

-- 2. Find the snames of suppliers who supply every part.
SELECT S.sname
FROM Suppliers S
INNER JOIN Catalog C ON S.sid = C.sid
GROUP BY S.sname
HAVING COUNT(DISTINCT(C.pid)) >= (SELECT COUNT(DISTINCT(P.pid)) FROM Parts P);

-- 3. Find the snames of suppliers who supply every red part.
SELECT S.sname
FROM Suppliers S
WHERE S.sid=C.sid
and C.pid=P.pid
and P.color = 'red'
GROUP BY S.sname
HAVING COUNT(DISTINCT(C.pid)) >= (SELECT COUNT(*) FROM Parts P WHERE P.color = 'red');

-- 4. Find the pnames of parts supplied by Acme Widget Suppliers and no one else.
SELECT P.pname
FROM Parts P, Catalog C, Suppliers S
WHERE P.pid = C.pid 
AND C.sid = S.sid 
AND S.sname = 'Acme Widget Suppliers'
AND NOT EXISTS 
(SELECT * FROM Catalog C1, Suppliers S1 
 WHERE P.pid = C1.pid 
 AND C1.sid = S1.sid 
 AND S1.sname <> 'Acme Widget Suppliers');

-- 5. Find the sids of suppliers who charge more for some part than the avg cost of that part
-- 	 (averaged over all the suppliers who supply that part)      
SELECT DISTINCT C.sid
FROM Catalog C
WHERE C.cost > (SELECT AVG (C1.cost) FROM Catalog C1 WHERE C1.pid = C.pid);

-- 6. For each part, ﬁnd the sname of the supplier who charges the most for that part.
SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX(C1.cost) FROM Catalog C1 WHERE C1.pid = P.pid);

-- 7. Find the sids of suppliers who supply only red parts.
SELECT DISTINCT C.sid
FROM Catalog C
WHERE NOT EXISTS (SELECT * FROM Parts P WHERE P.pid = C.pid AND P.color <> 'red');

-- 8. Find the sids of suppliers who supply a red part and a green part.
SELECT S.sid
FROM Suppliers S
JOIN Catalog ON C.sid = S.sid
JOIN Parts ON P.pid = C.pid
WHERE P.color IN ('red', 'green')
GROUP BY S.sid
HAVING COUNT(DISTINCT P.color) = 2;
 
-- 9. Find the sids of suppliers who supply a red part or a green part.
SELECT DISTINCT C.sid
FROM Catalog C, Parts P
WHERE C.pid = P.pid AND P.color = 'red'
UNION
SELECT DISTINCT C1.sid
WHERE C1.pid = P1.pid AND P1.color = 'green';

-- 10. For every supplier that only supplies green parts, print the name of the supplier and the total number of parts that she supplies.
SELECT S.sname, COUNT(*) as Part_Count
FROM Suppliers S, Parts P, Catalog C
WHERE P.pid = C.pid AND C.sid = S.sid
GROUP BY S.sname, S.sid
HAVING EVERY(P.color = 'green');
                     
-- 11. For every supplier that supplies a green part and a red part, print the name and price of the most expensive part that she supplies.
SELECT S.sname, MAX(C.cost) as Max_Cost
FROM Suppliers S, Parts P, Catalog C
WHERE P.pid = C.pid AND C.sid = S.sid
GROUP BY S.sname, S.sid
HAVING ANY (P.color = 'green') AND ANY (P.color = 'red');