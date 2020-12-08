--Module 3
--Demo 1
--Query to see the columns in a table
SELECT  Col.TABLE_SCHEMA, Col.TABLE_NAME, Col.COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS AS Col
WHERE Col.TABLE_SCHEMA = 'Person' AND Table_Name = 'Person';

--=, <> , etc
SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName = 'Smith';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName <> 'Smith';

--The names that start with Ca or greater show up
SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName > 'C';

/*
C
Ca
Cb
Cad

C
Ca
Cad
Cb


*/


--Only names starting with A or B show up
SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName < 'C';

/*
C______ 
Cabello

*/

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName > 'Cai';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName >= 'Cai';

SELECT SalesOrderID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID > 75120;

SELECT SalesOrderID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID >= 75120;

--LIKE
SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName LIKE 'sm%';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName LIKE '%s';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName LIKE '%tt%';

/*
% only with LIKE
and PATINDEX function
*/

--in
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName IN ('Calafato','Caldwell');

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Calafato' OR LastName = 'Caldwell';

SELECT ProductID, Name
FROM Production.Product
WHERE ProductID IN (1,2,700,791,800);

--BETWEEN
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName BETWEEN 'A' AND 'C';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName BETWEEN 'A' AND 'Cai';

SELECT SalesOrderID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID BETWEEN 75120 AND 75122;

--Nothing comes back
SELECT SalesOrderID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID BETWEEN 75122 AND 75120;

--NOT
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName BETWEEN 'B' AND 'C';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName NOT BETWEEN 'B' AND 'C';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Calafato'
	OR LastName = 'Caldwell';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName IN ('Calafato','Caldwell');



SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName NOT IN ('Calafato','Caldwell');

SELECT (100 * 100)
SELECT -(100 * 100)



--AND OR
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' AND FirstName = 'Adam';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' OR FirstName = 'Adam';

--Find the people with last name Adams. 
--The first name could be Adam or Aaron
--57 rows
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' 
	AND FirstName = 'Adam' OR FirstName = 'Aaron';

--54 rows
SELECT LastName, FirstName 
FROM Person.Person 
WHERE FirstName = 'Adam' OR FirstName = 'Aaron'
	AND LastName = 'Adams';

--Best way to write
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' 
	AND (FirstName = 'Adam' OR FirstName = 'Aaron');

print 10 + 2 * 7
print (10 + 2) * 7

--In this case, can also do this
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' 
	AND FirstName  IN ('Adam','Aaron');

--Dates 
 --Listing 3-9. Table Setup for Date/Time Example
CREATE TABLE #DateTimeExample(
    ID INT NOT NULL IDENTITY PRIMARY KEY,
    MyDate DATETIME2(0) NOT NULL,
    MyValue VARCHAR(25) NOT NULL
);
GO
INSERT INTO #DateTimeExample
    (MyDate,MyValue)
VALUES ('2020-01-02 10:30','Bike'),
    ('2020-01-03 13:00','Trike'),
    ('2020-01-03 13:10','Bell'),
    ('2020-01-03 17:35','Seat');

SELECT * FROM #DateTimeExample;

select * from #datetimeexample 
where mydate BETWEEN '2020-01-03 13:00:00' and '2020-01-03 14:00:00'


--Listing 3-10. Filtering on Date and Time Columns
--1
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate = '2020-01-03';
 
--2
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate >= '2020-01-03' AND MyDate < '2020-01-04';

--2020-01-02
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate >= '2020-01-02' AND MyDate < '2020-01-03';


--WHERE clause practice
SELECT [AddressTypeID]       
	,[Name]       
FROM [Person].[AddressType] 
WHERE Name = 'Shipping' OR AddressTypeID = 1 

--WHERE clause practice
SELECT [AddressTypeID]       
	,[Name]       
FROM [Person].[AddressType] 

WHERE Name LIKE 'B%' 
WHERE Name NOT LIKE 'B%' 
WHERE Name LIKE '%B%' 
WHERE Name LIKE '%pp%' 
WHERE Name LIKE '%g' 
WHERE Name LIKE 'H%e%' 
WHERE Name >= 'Ma' 
WHERE Name > 'B' 
WHERE Name < 'H' 
WHERE AddressTypeID BETWEEN 1 AND 3 
WHERE Name BETWEEN 'A' AND 'B' 
WHERE Name BETWEEN 'A' AND 'Bi' 
WHERE Name BETWEEN 'A' AND 'Bu' 
WHERE AddressTypeID IN (1,2,3) 
WHERE Name IN ('Shipping','Home') 
WHERE Name NOT IN ('Shipping','Home') 
WHERE Name = 'Shipping' AND AddressTypeID = 1 
WHERE Name = 'Shipping' OR AddressTypeID = 1 



--Demo 2
SELECT ProductID, Name, Color, Size, Style 
FROM Production.Product
WHERE ListPrice > 0;

--Nulls cancel everything out
SELECT ProductID, Name, Color, Size, Style
,	Color + '-' + Size + '-' + Style AS Description  
FROM Production.Product
WHERE ListPrice > 0;

--Can use ISNULL to replace a null value
--Nulls cancel everything out
SELECT ProductID, Name, Color, Size, Style,
	ISNULL(Color,'N/A') + '-' + 
	ISNULL(Size,'N/A') + '-' + ISNULL(Style,'N') AS Description  
FROM Production.Product
WHERE ListPrice > 0;

--Use the COALSCE function to display the first non-NULL
SELECT ProductID, Name, Color, Size, Style,
	COALESCE(Color,'N/A') + '-' + 
	COALESCE(Size,'N/A') + '-' + COALESCE(Style,'N/A') AS Description  
FROM Production.Product
WHERE ListPrice > 0;

--Find the first non-Null in the list
SELECT ProductID, Name, Style,Size,Color,
	COALESCE(Style,Size,Color) AS Description  
FROM Production.Product
WHERE ListPrice > 0;

--Filtering with NULL
--504
SELECT ProductID, Name, Color 
FROM Production.Product;

--26
SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color = 'Blue';

PRINT 504 - 26 --478
--How many are not blue?
--230
SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color <> 'Blue';

SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color != 'Blue';

--478
SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color <> 'Blue' OR Color IS NULL;

SELECT ProductID, Name, Color 
FROM Production.Product
WHERE ISNULL(Color,'') <> 'Blue';

SELECT ProductID, Name, Color 
FROM Production.Product
WHERE COALESCE(Color,'') <> 'Blue';

--Find the products that have a color
SELECT ProductID, Name, Color 
FROM Production.Product
WHERE Color IS NOT NULL;


