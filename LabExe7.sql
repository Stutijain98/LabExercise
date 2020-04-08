Module-7
  Exercise 1: Create a Columnstore Index on the FactProductInventory Table
 
-->CREATE TABLE FactProductInventory(
   ProductId INT NOT NULL,
   ConsignmentId INT NOT NULL,
   ProductName VARCHAR(30) NOT NULL,
   SalesDate DATETIME NOT NULL,
   TotalCost MONEY NOT NULL
   );

-->ALTER TABLE FactProductInventory ADD CONSTRAINT FPI_CONSTRAINT UNIQUE CLUSTERED(ProductId);

-->CREATE NONCLUSTERED COLUMNSTORE INDEX NCI_FactProductInventory ON
   FactProductInventory
   (
   ProductId,
   ConsignmentId,
   TotalCost
   )
   GO

 Exercise 2: Create a Columnstore Index on the FactInternetSales Table

-->CREATE TABLE FactInternetSales(
   InternetSalesId INT NOT NULL,
   ProductId INT NOT NULL,
   ProductName VARCHAR(30) NOT NULL,
   SalesDate DATETIME NOT NULL,
   Reviews INT,
   Hits INT,
   TotalCost MONEY NOT NULL
   );

-->ALTER TABLE FactInternetSales ADD CONSTRAINT FIS_CONSTRAINT UNIQUE CLUSTERED(InternetSalesId );

-->CREATE NONCLUSTERED COLUMNSTORE INDEX NCI_FactInternetSales ON
   FactInternetSales
   (
   InternetSalesId,
   ProductId,
   SalesDate,
   TotalCost
   )
   GO


