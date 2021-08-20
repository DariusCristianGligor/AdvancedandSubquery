Select *
from Reviews

delete 
from Reviews

Select *
from Reviews

 delete 
from Users

Select *
from Users

INSERT INTO Users(UserId,NameUser,Age,Mail,AddressUser,PasswordUser)
VALUES
(1,'Gligor',22,'darius@gmail','Alba,VintudeJos','LPX22211xaasas'),
(2,'Lup',32,'marian@gmail','Alba,VintudeJos','LPX22211CCCSs'),
(3,'Florin',33,'florin@gmail','Timis,Giroc','LPsssX22211xaasas'),
(4,'Marcu',22,'marcudarius@gmail','Alba,Orastie','LPX22211xaasas');


INSERT INTO Reviews(Note,Price,Place,UserId)
VALUES
(7,'Affordable','Cetatea Alba',1),
(8,'Expensive','Cetatea Alba',3),
(9,'Expensive','Cetatea Alba',2),
(9,'Expensive','Cetatea Alba',4),
(8,'Cheap','Restaurant Martinuzzi',4),
(10,'Cheap','Restaurant Martinuzzi',3),
(7,'Cheap','Restaurant Martinuzzi',2),
(10,'Cheap','Restaurant Martinuzzi',1),
(8,'Expensive','Piata 700',4),
(7,'Expensive','Piata 700',2),
(5,'Expensive','Piata 700',3);

--write several grouping queries.Include having clause.
SELECT Place,AVG(Note) as AVG --,AVG(Note) 
FROM Reviews
GROUP BY Place
HAVING  AVG(Note)>7;


SELECT UserId,AVG(Note) as AVG 
FROM Reviews
GROUP BY UserId
HAVING  UserId IN (1,2,3);

SELECT Place,AVG(Note) as AVG --,AVG(Note) 
FROM Reviews
GROUP BY Place
HAVING  AVG(Note)>7
ORDER BY AVG(Note),Place DESC;

-- TRY OUT INSERT SELECT STATEMENT
CREATE TABLE LuxPlaces
(IdReview INT IDENTITY(1,1) PRIMARY KEY,
Place VARCHAR(30) NOT NULL,
Note INT DEFAULT 0,
);
--set IDENTITY_INSERT LuxReview ON;
INSERT INTO LuxPlaces(Place,Note)
SELECT Place,AVG(Note) as AVG --,AVG(Note) 
FROM Reviews
GROUP BY Place
HAVING  AVG(Note)>7
ORDER BY AVG(Note),Place DESC;

SELECT * FROM LuxPlaces;
--set IDENTITY_INSERT LuxReview OF;

--try out a delete based on join with a where clause;
DELETE R
FROM Reviews AS R
LEFT JOIN
LuxPlaces AS L
on R.Place=L.Place
WHERE R.Note<L.Note

SELECT * FROM Reviews

--TRY AN UPDATE BASED ON JOIN

UPDATE  R
SET R.Note+=1
FROM REVIEWS AS R
LEFT JOIN
LuxPlaces AS L
on R.Place=L.Place
WHERE R.NOTE>L.NOTE

SELECT * FROM Reviews

--WRITE 3 CORRELATED SUBQUERIES:

-- IN SELECT:

SELECT TOP 2 IdReview,price,place,
(
select 
SUM(r.Note*l.Note)
from Reviews as r
INNER JOIN
LuxPlaces AS l
on R.Place=L.Place
) AS Score
from Reviews
--IN WHERE:

SELECT IdReview,price,place,Note
FROM Reviews
WHERE Note<(
select 
AVG(l.Note)
from Reviews as r
INNER JOIN
LuxPlaces AS l
on R.Place=L.Place
)

--IN HAVING
SELECT place,AVG(Note) AS AVGG
FROM Reviews
GROUP BY Place
HAVING AVG(Note)<(
select 
AVG(l.Note)
from Reviews as r
INNER JOIN
LuxPlaces AS l
on R.Place=L.Place
)

--COMBINE QUERIES USING IN,EXISTS OR NOT IN;

SELECT Place,Note,IdReview
FROM Reviews
WHERE Place IN (
SELECT Place
FROM LuxPlaces
WHERE Note>7
)
order by Place

--write one query using case in a select statement

SElECT Place,CASE Note
WHEN 8 THEN  Note*10
WHEN 11 THEN Note-1
ELSE Note
END as Note,
IdReview
from Reviews

--try out truncate statement

TRUNCATE table Reviews;









CREATE TABLE dbo.GRADES
(
NAME VARCHAR(30) NOT NULL,
CODE VARCHAR(30) PRIMARY KEY,
MARK INT
)

INSERT INTO dbo.GRADES(NAME,CODE,MARK) 
VALUES('Gligor','gl11',98),
('Marina','mri1',90),
('Florin', 'fli11',67)
INSERT INTO dbo.GRADES(NAME,CODE,MARK) 
VALUES('Gligor','gl111',97),
('Marina','mri11',11),
('Florin', 'fli111',33)
INSERT INTO dbo.GRADES(NAME,CODE,MARK) --BEST PRACTICE
VALUES('Fabian','gfffl111',97),
('Florean','fffmri11',11),
('Alex', 'alx111',33)
SELECT 
COUNT(DISTINCT NAME) AS Count
from dbo.GRADES
SELECT 
COUNT( NAME) AS Count
from dbo.GRADES


SELECT 
SUM(MARK)
FROM 
GRADES

SELECT 
MAX(MARK)
FROM GRADES

SELECT 
MAX(MARK)- MIN(MARK)
FROM GRADES
--
SELECT 
NAME, AVG(MARK) AS AVERAGE
FROM  GRADES
GROUP BY NAME

SELECT 
NAME, AVG(MARK) AS AVERAGE
FROM  GRADES
GROUP BY NAME
HAVING AVG(MARK)>77
ORDER BY AVG(MARK),NAME DESC

--HAVING REFRES TO THE GROUP OF ROWS FROM A TABLE INSTATED OF WHERE WHICH REFERS TO A SINGLW ROW

SELECT NAME,
		MARK
INTO CRSS
FROM GRADES
WHERE NAME='GLIGOR';

SELECT * FROM CRSS
UPDATE GRADES
SET MARK = 100
WHERE NAME LIKE 'G%';
SELECT *
FROM GRADES

SELECT NAME,
CASE NAME
WHEN 'Gligor' then mark*2
when 'Fabian' then mark*3
else mark
end as 'New marks'
from GRADES
