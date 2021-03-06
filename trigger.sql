CREATE TRIGGER UP_vEMPLOYEEDETAILS
ON vGetEmployee
INSTEAD OF UPDATE
AS BEGIN
 DECLARE @EMPID INT,
 DECLARE @EMPNAME VARCHAR,
 DECLARE @EMPDEP VARCHAR
 
SELECT @EMPID=EmployeeId,@EMPNAME=Name,@EMPDEP=Department FROM INSERTED
UPDATE vGetEmployee SET Name=@EMPNAME FROM INSERTED WHERE INSERTED.EmployeeId=@EMPID
UPDATE vGetEmployee SET Department=@EMPDEP FROM INSERTED WHERE INSERTED.EmployeeId=@EMPID
END;
GO
