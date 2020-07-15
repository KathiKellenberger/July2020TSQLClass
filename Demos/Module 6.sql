--Module 6
--Demo 1 Using Aggregate Functions 
SELECT COUNT(*) AS CountOfRows,        
	MAX(TotalDue) AS MaxTotal,        
	MIN(TotalDue) AS MinTotal,        
	SUM(TotalDue) AS SumOfTotal,        
	AVG(TotalDue) AS AvgTotal    
FROM Sales.SalesOrderHeader;       

--You can also use MIN and MAX on dates and strings    
SELECT MIN(Name) AS MinName,        
	MAX(Name) AS MaxName,        
	MIN(SellStartDate) AS MinSellStartDate    
FROM Production.Product;       

--What's the difference in these?    
SELECT COUNT(*) AS CountOfRows,        
	COUNT(Color) AS CountOfColor,            
	COUNT(DISTINCT Color) AS CountOfDistinctColor    
FROM Production.Product;  


--Will fail
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader;    

--Using the GROUP BY Clause       
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID;      

--    
SELECT TerritoryID,AVG(TotalDue) AS AveragePerTerritory    
FROM Sales.SalesOrderHeader    
GROUP BY TerritoryID;   

--How to Group on an Expression 
--This query will return one row per date, not year
SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrderYear    
FROM Sales.SalesOrderHeader    
GROUP BY OrderDate;       

--Always use the exact expression to get the right results    
SELECT COUNT(*) AS CountOfOrders, YEAR(OrderDate) AS OrderYear    
FROM Sales.SalesOrderHeader    
GROUP BY YEAR(OrderDate); 

--Using ORDER BY 
--Order on a column   
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer          
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID   
ORDER BY CustomerID;   

--Order on an aggregate    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
ORDER BY MAX(TotalDue) DESC;

--Writing Aggregate Queries with Two Tables    
SELECT c.CustomerID, c.AccountNumber, COUNT(*) AS CountOfOrders,        
	SUM(TotalDue) AS SumOfTotalDue    FROM Sales.Customer AS c    
INNER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID    
GROUP BY c.CustomerID, c.AccountNumber    
ORDER BY c.CustomerID;  


--Demo 2: HAVING
--Using the WHERE Clause       
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
WHERE TerritoryID in (5,6)    
GROUP BY CustomerID; 

--Using the HAVING Clause    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING SUM(TotalDue) > 5000;       

--    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING COUNT(*) = 10 AND SUM(TotalDue) > 5000;       

--Still works, but incorrect method    
SELECT CustomerID,SUM(TotalDue) AS TotalPerCustomer    
FROM Sales.SalesOrderHeader    
GROUP BY CustomerID    
HAVING CustomerID > 27858;   


   