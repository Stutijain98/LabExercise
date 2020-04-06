Exersize-1
   Task 3: Alter the Direct Marketing Table
    
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN OpportunityId int NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN ProspectId int NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN DateRaised datetime NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN Likelihood tinyint NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN Rating char(1) NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN EstimatedClosingDate datetime NOT NULL;
   GO
-->ALTER TABLE DirectMarketing.Opportunity
   ALTER COLUMN EstimatedRevenue money NOT NULL;
   GO


*Adding a composite key.

-->ALTER TABLE DirectMarketing.Opportunity
   ADD CONSTRAINT DM_Opportunity PRIMARY KEY CLUSTERED (OpportunityId,ProspectId);
   GO


*Adding Reference from prospect table to Opportunity table

-->ALTER TABLE DirectMarketing.Opportunity
   ADD CONSTRAINT FK_Opportunity FOREIGN KEY(ProspectId) REFERENCES DirectMarketing.Prospect(ProspectId);
   GO

*Adding a default constraint to DateRaised column

-->ALTER TABLE DirectMarketing.Opportunity
   ADD CONSTRAINT DM_Date
   DEFAULT (SYSDATETIME()) FOR DateRaised;
   GO


Exersize-2
  
  Task 1: Test the Data Types and Default Constraints

--> INSERT INTO DirectMarketing.Opportunity(OpportunityId,ProspectId,DateRaised,Likelihood,Rating,EstimatedClosingDate,EstimatedRevenue)
    VALUES(1,1,8,’A’,’12/12/2013’,123000.00);
    SELECT*FROM DirectMarketing.Opportunity;
    GO
   
Task 2: Test the Primary Key BY ADDING SAME VALUE AGAIN

--> INSERT INTO DirectMarketing.Opportunity(OpportunityId,ProspectId,DateRaised,Likelihood,Rating,EstimatedClosingDate,EstimatedRevenue)
    VALUES(1,1,8,’A’,’12/12/2013’,123000.00);
    SELECT*FROM DirectMarketing.Opportunity;
    GO

Task 3: Test to Ensure the Foreign Key is Working as Expected

--> INSERT INTO DirectMarketing.Opportunity(OpportunityId,ProspectId,DateRaised,Likelihood,Rating,EstimatedClosingDate,EstimatedRevenue)
    VALUES(3,2,6,’A’,’12/12/2013’,123000.00);
    SELECT*FROM DirectMarketing.Opportunity;
    GO