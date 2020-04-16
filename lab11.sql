EXE-1

CREATE TABLE Production.ProductAudit(
ProductId INT NOT NULL,
UpdateTime DATETIME NOT NULL,
ModifyingUser NVARCHAR(50),
OriginalListPrice MONEY NOT NULL,
NewListPrice MONEY NOT NULL
)
GO

CREATE TRIGGER Production.TR_UpdatePrice
ON Production.Products
AFTER UPDATE
AS BEGIN
  SET NOCOUNTON;
  INSERT Production.ProductAudit(ProductId,UpdateTime,ModifyingUser,OriginalListPrice,NewListPrice)
  SELECT INSERTED.ProductId,ORIGINAL_LOGIN(),SYSDATETIME(),DELETED.ListPrice.INSERTED.ListPrice
  FROM DELETED
  INNER JOIN INSERTED
  ON
  DELETED.ProductId=Inserted.ProductId
  WHERE DELETED.ListPrice>1000 OR INSERTED.ListPrice>1000;
END;
GO


EXE-2

USE MarketDev
GO
ALTER TRIGGER Marketing.TR_CampaignBalance_Update
ON Mareketing.CampeignPrice
AFTER UPDATE
AS BEGIN
  SET NOCOUNTON;
  INSERT Marketing.CampeignAudit(AuditTime, ModifyingUser, RemainingBalance)  
  SELCT ORIGINAL_LOGIN(),SYSDATETIME(),INSERTED.RemainingBalance
  FROM DELETED
  INNER JOIN INSERTED
  ON DELETED.CampeignId=INSERTED.CampeignId
  WHERE(DELETED.RemainingBalance-INSERTED.RemainingBalance)>1000;
END;
GO

DELETE FROM Marketing.CampaignAudit;
GO  
  






