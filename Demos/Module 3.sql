--Module 3
--Demo 1

--=, <> , etc
SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName = 'Smith';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName <> 'Smith';

SELECT LastName
	,FirstName 
FROM Person.Person 
WHERE LastName > 'C';


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
WHERE LastName LIKE '%bb%';

--in
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName IN ('Calafato','Caldwell');


--BETWEEN
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName BETWEEN 'A' AND 'C';

SELECT SalesOrderID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID BETWEEN 75120 AND 75122;

--NOT
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName NOT BETWEEN 'B' AND 'C';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName NOT IN ('Calafato','Caldwell');

--AND OR
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' AND FirstName = 'Adam';

SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' OR FirstName = 'Adam';

--Find the people with last name Adams. The first name could be Adam or Aaron
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

--In this case, can also do this
SELECT LastName, FirstName 
FROM Person.Person 
WHERE LastName = 'Adams' 
	AND FirstName  IN ('Adam','Aaron');

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
SELECT ProductID, Name, Color, Size, Style,
	Color + '-' + Size + '-' + Style AS Description  
FROM Production.Product
WHERE ListPrice > 0;

--Can use ISNULL to replace a null value
--Nulls cancel everything out
SELECT ProductID, Name, Color, Size, Style,
	ISNULL(Color,'N/A') + '-' + 
	ISNULL(Size,'N/A') + '-' + ISNULL(Style,'N/A') AS Description  
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

