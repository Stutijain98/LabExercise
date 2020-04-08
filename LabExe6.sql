Exercise 1: Using Query Store
 Task 1: Use Query Store to Monitor Query Performance
 
--Inorder to monitor the query performance we need to set the QUERY STORE ON
   -->ALTER DATABASE AdventureWorks2016CTP3
      SET QUERY_STORE=ON;
      GO

Exercise 2: Heaps and Clustered Indexes
 Task 1: Compare a Heap with a Clustered Index

--Creating a heap
   --> CREATE TABLE AdventureWorks.Tourists(
       TouristId INT NOT NULL,
       CountryId INT NOT NULL,
       Name VARCHAR(50) NOT NULL,
       ArrivalDate DATETIME NOT NULL,
       DepartureDate DATETIME NOT NULL,
       TourPackage MONEY NOT NULL
       );

--adding a clustered index and enabeling statistics ON
   -->ALTER TABLE AdventureWorks.Tourists ADD CONSTRAINT TO_CONSTRAINT UNIQUE CLUSTERED(TouristId);

   -->ALTER DATABASE AdventureWorks2016CTP3
      SET AUTO_UPDATE_STATISTICS ON;
      GO