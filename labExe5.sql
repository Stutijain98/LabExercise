Module-5

 Task 3: Create the Tables
 
-->CREATE TABLE Sales.MediaOutlet(
   MediaOutletId INT NOT NULL,
   MediaOutletName NVARCHAR(50) NOT NULL,
   SourcePoint NVARCHAR(50) NOT NULL,
   DestinationPoint NVARCHAR(50) NOT NULL,
   NumberOfCheckpoints INT NULL
   );

--> CREATE TABLE Sales.PrintMediaPlacement(
    PrintMediaPlacementId INT NOT NULL,
    MediaOutletId INT NOT NULL,
    NumberOfPlacement INT,
    PublicationDate DATETIME NOT NULL,
    Cost MONEY NOT NULL
    );

Exercise 2: Creating a Clustered Index
  Task 1: Add a Clustered Index to Sales.MediaOutlet

-->ALTER TABLE Sales.MediaOutlet ADD CONSTRAINT MO_CONSTRAINT UNIQUE CLUSTERED(MediaOutletId);
 
  Task 2: Add a Clustered Index to Sales.PrintMediaPlacement
-->ALTER TABLE Sales.PrintMediaOutlet ADD CONSTRAINT PO_CONSTRAINT UNIQUE CLUSTERED(PrintMediaPlacementId);