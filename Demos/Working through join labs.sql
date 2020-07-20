/*
1.	The HumanResources.Employee table does not contain the employee name. Join that table to the Person.Person 
table on the BusinessEntityID column. Display the BusinessEntityID, first and last names, 
job title, and birth date.
*/

--290
SELECT EMP.BusinessEntityID, EMP.JobTitle, EMP.BirthDate
FROM HumanResources.Employee AS EMP

--19,972
SELECT * 
FROM Person.Person 

SELECT EMP.BusinessEntityID, EMP.JobTitle, EMP.BirthDate, 
    P.FirstName, P.MiddleName, P.LastName
FROM HumanResources.Employee AS EMP
INNER JOIN Person.Person AS P 
ON EMP.BusinessEntityID = P.BusinessEntityID;

/*
2.	Join the Production.Product table to the Production.ProductSubCategory table. 
Then join to the Production.ProductCategory. Return the ProductID. Return the Name of the product, 
subcategory and category. Be sure to use aliases. See if you can figure out the keys to join on. 
*/
SELECT * FROM Production.ProductSubcategory
SELECT * FROM Production.ProductCategory
--504
--295
SELECT Prod.ProductID, Prod.Name AS ProductName, Prod.ProductSubcategoryID,
    SubCat.Name AS SubCategoryName, Cat.Name AS CategoryName
FROM Production.Product AS PROD 
INNER JOIN Production.ProductSubcategory AS SubCat
ON Prod.ProductSubcategoryID = SubCat.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS Cat 
ON SubCat.ProductCategoryID = Cat.ProductCategoryID

--You can change the order of the joins, but the hierarchy must
--stay in place. You can't join Product to Category
SELECT Prod.ProductID, Prod.Name AS ProductName, Prod.ProductSubcategoryID,
    SubCat.Name AS SubCategoryName, Cat.Name AS CategoryName
FROM Production.ProductCategory AS Cat 
INNER JOIN Production.ProductSubcategory AS SubCat 
ON Cat.ProductCategoryID = Subcat.ProductCategoryID 
INNER JOIN Production.Product AS Prod 
ON Prod.ProductSubcategoryID = SubCat.ProductSubcategoryID


/*
1.	Write a query that displays all the products along with the SalesOrderID even if an order has never 
been placed for that product. Join to the Sales.SalesOrderDetail table using the ProductID column. 
Include the ProductID, name, SalesOrderID, and OrderQty.
*/
SELECT Prod.ProductID, Prod.Name, SOD.SalesOrderID, SOD.OrderQty
FROM Production.Product AS Prod 
LEFT OUTER JOIN Sales.SalesOrderDetail 
AS SOD ON Prod.ProductID = SOD.ProductID 
ORDER BY SOD.SalesOrderID;

/*
1.	Change the query written in Lab 2 Question 1 so that only products that have not been ordered show up 
in the results of the query.
*/

SELECT Prod.ProductID, Prod.Name, SOD.SalesOrderID, SOD.OrderQty
FROM Production.Product AS Prod
LEFT JOIN Sales.SalesOrderDetail AS SOD 
ON Prod.ProductID = SOD.ProductID 
WHERE SalesOrderID IS NULL
ORDER BY SOD.SalesOrderID