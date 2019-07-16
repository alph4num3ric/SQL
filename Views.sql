-==================================================
---------------CREATE VIEW---SYNTAX
-==================================================
CREATE VIEW view_name AS A
SELECT column1, column2, ...
FROM table_name
WHERE condition;
 
-==================================================
---------------CREATE VIEW---SAMPLE
-==================================================

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil";

-==================================================
---------------DROP VIEW---SYNTAX
-==================================================

DROP VIEW view_name;

-==================================================
---------------DROP VIEW---SAMPLE
-==================================================

DROP VIEW [Brazil Customers];

-==================================================
---------------CREATE VIEW---USING MS SQL SERVER TEMPLATE --- Sample 1
-- Go to Menu > Query > Specify Values for Template
-==================================================

USE AdventureWorks
GO

IF object_id(N'dbo.Top10Sales', 'V') IS NOT NULL
	DROP VIEW dbo.Top10Sales
GO

CREATE VIEW dbo.Top10Sales AS
SELECT TOP 10 * FROM Sales.SalesOrderHeader ORDER BY TotalDue DESC

-==================================================
---------------CREATE VIEW--- MANUAL sample 2
-==================================================

CREATE VIEW SalesQuote 
AS 
SELECT B.[TerritoryID],[Name],[Group],[SalesQuota],[Bonus]
FROM [Sales].[SalesTerritory] AS A
INNER JOIN [Sales].[SalesPerson] AS B
ON A.[TerritoryID] = B.[TerritoryID] 
WHERE [Group] LIKE 'North America'

-==================================================
---------------SOURCES
-==================================================

https://www.w3schools.com/sql/sql_view.asp