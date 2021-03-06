/****** Script for SelectTopNRows command from SSMS  ******/
-- There are 3 ways to create views---

SELECT TOP (1000) [TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[CostYTD]
      ,[CostLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[Sales].[SalesTerritory]
  
  /********************************************************** 
  1. Right click on view > new view > select tables and run
  2. From Template browser.   Go to menu VIEW > TEMPLATE EXPLORER > VIEW
  3. Manually. Check following samples
  ***************************************************/
  
---VIEW (CREATE)
CREATE VIEW myUSterritory
AS
SELECT * FROM [AdventureWorks2012].[Sales].[SalesTerritory]
WHERE [CountryRegionCode] LIKE 'US'

SELECT * FROM  myUSterritory

--VIEW 2 USING JOIN

CREATE VIEW myjoinview
AS
SELECT [Name],[Group],[SalesQuota],[Bonus]
FROM [AdventureWorks2012].[Sales].[SalesTerritory] A 
INNER JOIN [Sales].[SalesPerson] B
ON A.TerritoryID = B.TerritoryID
WHERE [Group]  LIKE 'North America'

SELECT * FROM myjoinview




