--Module 5 

--Demo 1
--Joining Two Tables 
SELECT s.SalesOrderID, s.OrderDate, s.TotalDue, d.SalesOrderDetailID,        
	d.ProductID, d.OrderQty    
FROM Sales.SalesOrderHeader AS s    
INNER JOIN Sales.SalesOrderDetail AS d ON s.SalesOrderID = d.SalesOrderID;   

--Writing an Incorrect Query 
SELECT s.SalesOrderID, OrderDate, TotalDue, SalesOrderDetailID,        
	d.ProductID, d.OrderQty    
FROM Sales.SalesOrderHeader AS s    
INNER JOIN Sales.SalesOrderDetail d ON 1 = 1;   


--Joining Two Tables with Different Column Names 
SELECT c.CustomerID, c.PersonID, p.BusinessEntityID, p.LastName    
FROM Sales.Customer AS c    
INNER JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID;   


--Joining Two Columns 
SELECT sod.SalesOrderID, sod.SalesOrderDetailID,        
	so.ProductID, so.SpecialOfferID, so.ModifiedDate    
FROM Sales.SalesOrderDetail AS sod    
INNER JOIN Sales.SpecialOfferProduct AS so        
	ON so.ProductID = sod.ProductID AND        
	so.SpecialOfferID = sod.SpecialOfferID    
WHERE sod.SalesOrderID IN (51116,51112); 


--Joining Three Tables 
SELECT soh.SalesOrderID, soh.OrderDate, p.ProductID, p.Name    
FROM Sales.SalesOrderHeader as soh    
INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID    
INNER JOIN Production.Product AS p ON sod.ProductID = p.ProductID    
ORDER BY soh.SalesOrderID;   


--Demo 2 OUTER JOIN
--Using LEFT OUTER JOIN 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE c.CustomerID IN (11028,11029,1,2,3,4); 

--Using RIGHT OUTER JOIN 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.SalesOrderHeader AS s    
RIGHT OUTER JOIN Sales.Customer AS c ON c.CustomerID = s.CustomerID    
WHERE c.CustomerID IN (11028,11029,1,2,3,4);   

--What happens when you add a second table to a LEFT join?
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID    
FROM Sales.Customer AS C    
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID    
INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID    
WHERE C.CustomerID IN (11028,11029,1,2,3,4); 

--Continue the LEFT path 
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID    
FROM Sales.Customer AS C    
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID    
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID    
WHERE C.CustomerID IN (11028,11029,1,2,3,4); 

--FULL OUTER JOIN Demonstration 
IF OBJECT_ID('Production.ProductColor') IS NOT NULL BEGIN        
	DROP TABLE Production.ProductColor;    
END    
CREATE table Production.ProductColor        
	(Color nvarchar(15) NOT NULL PRIMARY KEY);    
GO    
--Insert most of the existing colors    
INSERT INTO Production.ProductColor    
SELECT DISTINCT Color    
FROM Production.Product    
WHERE Color IS NOT NULL and Color <> 'Silver';
 
--Insert some additional colors    
INSERT INTO Production.ProductColor    
VALUES ('Green'),('Orange'),('Purple');       
--Here is the query:    
SELECT c.Color AS "Color from list", p.Color, p.ProductID    
FROM Production.Product AS p    
FULL OUTER JOIN Production.ProductColor AS c ON p.Color = c.Color    
ORDER BY p.ProductID;  


--Demo 3
--Using LEFT OUTER JOIN to Find the Rows with No Matches 
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE s.SalesOrderID IS NULL
	ORDER BY s.SalesOrderID;  

--A left join. Lots of customers with no order returned
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID 
ORDER BY s.SalesOrderID;

SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
WHERE s.SalesOrderID = 43659;  

--Add the right filter to the join
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate    
FROM Sales.Customer AS c    
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
	AND s.SalesOrderID = 43659
ORDER BY s.SalesOrderID;  