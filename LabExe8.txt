Exercise 1: Creating Standard Views


-->USE AdventureWorks2016CTP3;
   GO
   CREATE VIEW Production,vOnlineProducts
   AS
   SELECT P.ProductId,P.Name,P.ProductNumber AS [Product Number],P.Color
   CASE P.DaysToManufacture
   WHEN 0 THEN "IN STOCK" 
   WHEN 1 THEN "OVERNIGHT"
   WHEN 2 THEN "2 to 3 days delivery"
   ELSE "Call us for a quote"
   END AS Availability,
   P.Size,P.SizeUnitMeasureCode AS [Unit of Measure],P.ListPrice AS Price,P.Weight
   FROM Production.Product AS P
   WHERE P.SellEndDate IS NULL AND P.SellStartDate IS NOT NULL;
   GO


//Production.AvailableModels view:

-->USE AdventureWorks2016CTP3;
   GO
   CREATE VIEW Production.vAvailableModels
   AS
   SELECT A.ProductId AS [Product ID],A.Name AS [Product Name],PM.ProductModelId AS [Product Model ID],PM.Name AS [Product Model Name]
   FROM Production.Product AS A
   INNER JOIN Production.ProductModel AS PM
   ON
   A.ProductModelId=PM.ProductModelId
   WHERE A.SellEndDate IS NULL
   AND A.SellStartDate IS NOT NULL;
   GO


Exercise 2: Creating an Updateable View

-->USE AdventureWorks2016CTP3;
   GO
   CREATE VIEW Sales.NewCustomer
   AS
   SELECT CustomerID, FirstName, LastName
   FROM Sales.CustomerPII;
   GO