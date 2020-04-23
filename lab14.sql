
Exercise 5: Creating a Stored Procedure to Return XML

-->CREATE PROCEDURE Production.GetAvailableModelsAsXML
   AS BEGIN
   SELECT P.ProductId
          P.ProductName
          PListPrice,
          P.Color,
          P.SellStartDate,
          M.ProductModelID,
          M.Name as ProductModel
   FROM Production.Product AS P
   INNER JOIN Production.ProductModel AS M
   ON P.ProductModelID=M.ProductModelID
   WHERE P.SellStartDate IS NOT NULL AND P.SellEndDate IS NULL
   ORDER BY P.SellStartDate, P.ProductName DESC
   FOR XML RAW('AvailableModel'), ROOT('AvailableModels');
   END;
   GO
   

EXEC Production.GetAvailableModelsAsXML;
GO       





   