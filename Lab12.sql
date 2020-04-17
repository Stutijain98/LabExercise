Exe-1
 Task 2: Add a Filegroup for Memory-Optimized Data

-->ALTER DATABASE InternetSales
   ADD FILEGROUP FG_DATA CONTAINS 
   MEMORY_OPTIMIZED_DATA;
   ALTER DATABASE InternetSales
   ADD FILE(NAME="Data",FILENAME="D:/DATA")
   TO FILEGROUP FG_DATA;

 Task 3: Create a Memory-Optimized Table

-->CREATE TABLE ShoppingCart(                   
   SessionID INT NOT NULL,
   TimeAdded DATETIME NOT NULL,
   CustomerKey INT NOT NULL,
   ProductKey INT NOT NULL,
   Quantity INT NOT NULL
   )
  PRIMARY KEY NONCLUSTERED (SessionID, ProductKey))
  WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA);


EXE-2 
   
-->CREATE PROCEDURE dbo.AddItemToCart
   @SessId INT,@TimeAdd DATETIME,@CusKey INT,@ProKey INT,@Quantity INT
   WITH NATIVE_COMPILATION,SCHEMABINDING,EXECUTE AS OWNER
   AS
   BEGIN ATOMIC WITH
    ( TRANSACTION ISOLATION LEVEL=SNAPSHOT
      LANGUAGE='US_ENGLISH')
   INSERT INTO dbo.ShoppingCart (SessionID,TimeAdded,CustomerKey,ProductKey,Quantity)
   VALUES (@SessId,@TimeAdd,@CusKey,@ProKey,@Quantity)
   END;
   GO

-->CREATE PROCEDURE dbo.DeleteItemFromCart
   @SessId INT,@ProKey INT
   WITH NATIVE_COMPILATION,SCHEMABINDING,EXECUTE AS OWNER
   AS
   BEGIN ATOMIC WITH
    ( TRANSACTION ISOLATION LEVEL=SNAPSHOT
      LANGUAGE='US_ENGLISH')
   DELETE FROM dbo.ShoppingCart WHERE SessionId=@SessId AND ProductKey=@ProKey
   END;
   GO

-->CREATE PROCEDURE dbo.EmptyCart
   @SessId INT
   WITH NATIVE_COMPILATION,SCHEMABINDING,EXECUTE AS OWNER
   AS
   BEGIN ATOMIC WITH
    ( TRANSACTION ISOLATION LEVEL=SNAPSHOT
      LANGUAGE='US_ENGLISH')
   DELETE FROM dbo.ShoppingCart WHERE SessionId=@SessId
   END;
   GO

