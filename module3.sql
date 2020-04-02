Module-3
Exersize 1
  Task-1 Creating a HumanResources Database
      
--> CREATE DATABASE HumanResourceDB;


Task-2 Implementing a partition strategy.
 
--> Creating a partition function..
      
   CREATE PARTITION FUNCTION YearlySalaryFunction (smalldatetime)
   AS RANGE LEFT
   FOR VALUES ('2017-12-31 00:00', '2018-12-31 00:00', '2019-12-31 00:00');
   GO

--> Creating partition schemas
    
    CREATE PARTITION SCHEME SalaryByYear
    AS PARTITION YearlySalaryFunction
    TO (salary1, salary2, salary3);
    GO


-->Creating a Partitioned Table

    CREATE TABLE Salaries
    (
    SalaryID int IDENTITY(1,1) PRIMARY KEY,
    EmployeeID int NOT NULL,
    DepartmentID int NOT NULL,
    SalaryDate smalldatetime NOT NULL
    )
    ON SalaryByYear(SalaryDate);
    GO