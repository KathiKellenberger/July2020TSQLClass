--Module 2
--Demo 1

--Use SELECT to return a string
SELECT 'This is a test';

--Return all rows and columns from a table
SELECT * 
FROM Person.Person;

--Specify the columns 
SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee;


--Aliases
SELECT Pers.FirstName AS [First Name]
	, Pers.LastName AS "Last Name"
	, 'A literal string' AS AString
FROM Person.Person AS Pers;

--Top 
SELECT TOP(50) PERCENT DepartmentID, Name 
FROM HumanResources.Department;

SELECT TOP(3) DepartmentID, Name 
FROM HumanResources.Department;

--Distinct 
SELECT DISTINCT Color 
FROM Production.Product;


--Demo 2
SELECT ProductID, LocationID
FROM Production.ProductInventory
ORDER BY LocationID;
 
SELECT ProductID, LocationID
FROM Production.ProductInventory
ORDER BY ProductID, LocationID DESC;

SELECT Pers.FirstName AS [First Name]
	, Pers.LastName AS "Last Name"
FROM Person.Person AS Pers
ORDER BY [First Name];
 






