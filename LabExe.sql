Module-2
Exercise 2: Creating Schemas

--> CREATE SCHEMA DirectMarketing
    AUTHORIZATION dbo;
    GO


Exercise 3: Creating Tables
  Task 1: Create the Competitor Table


--> Create table DirectMarketing.Competitors(
    CompetitorId int NOT NULL,
    CompetitorName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    CompetitionBrand VARCHAR(50) NOT NULL,
    CompetitionRating VARCHAR(50) NULL,
    IsActive bit NOT NULL
    );
    GO

 Task 2: Create the TVAdvertisement Table
 

--> Create table DirectMarketing.TVAdvertisements(
    AdId int NOT NULL,
    AdName VARCHAR(50) NOT NULL,
    AdBrand VARCHAR(50) NOT NULL,
    TVChannel VARCHAR(50) NOT NULL,
    Repeatition int NOT NULL,
    AdLength VARCHAR(30) NOT NULL,
    Cost MONEY NOT NULL,
    ADSchedule VARCHAR(50) NOT NULL,
    Date DATETIMEOFFSET(7) NOT NULL,
    IsActive bit NOT NULL
    );
    GO
    
 Task 3: Create the CampaignResponse Table   


--> Create table CampaignResponses(
    CampaignId int NOT NULL,
    CampaignName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    StartDate DATETIMEOFFSET(7) NOT NULL,
    EndDate DATETIMEOFFSET(7) NOT NULL,
    NumberOfResponses int NOT NULL,
    Lead VARCHAR(30) NOT NULL,
    InterestedTenant VARCHAR(50) NOT NULL,
    ConfirmTenant VARCHAR(50) NOT NULL,
    IsActive bit NOT NULL,
    Invested MONEY NOT NULL,
    Revenue MONEY NOT NULL,
    ResponseProfit(Invested-Revenue) PERSISTED
    );
    GO
    
    
    
    