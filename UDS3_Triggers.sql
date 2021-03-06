/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ShiftID]
      ,[Name]
      ,[StartTime]
      ,[EndTime]
      ,[ModifiedDate]
  FROM [AdventureWorks2012].[HumanResources].[Shift]

  /****************-TRIGGERS  (3 ways)********************
 
  1.  go to table, a file with TRIGGERS right click new
  2. from VIEW menu > TEMPLATE EXPLORER > TRIGGER choose and then edit with QUERY menu > SPECIFY VALUES
  3. manual
  ********************************************************/
  -- we create a trigger to roll back (not account for) if a change in shift  
  
  CREATE TRIGGER Demo_Trigger --any name
  ON [HumanResources].[Shift] -- Where do you want to create the trigger
  AFTER INSERT  --options are AFTER/BEFORE  and INSERT/UPDATE/DELETE
  AS
  BEGIN
  PRINT 'INSERT IS NOT ALLOWD, YOU NEED APPROVAL'
  ROLLBACK TRANSACTION
  END
  GO
  --- right click REFRESH folder to see codefile under HumanReources.Shiift/triggers file
  --- TO VIEW code RIghtClick on above file then SCRIPT..>CREATE..>NEW...

 /**********************TEST of PREVIOUS TRIGGER*************************/
  INSERT INTO [HumanResources].[Shift]
  (
  [Name],
  [StartTime],
  [EndTime],
  [ModifiedDate]
  )
  VALUES
  ('Gustavo',
  '07:00:00.0000000',
  '08:00:00.0000000',
  getdate() --to get current date 
  )
  ---- The result will be the message "						INSERT IS NOT ALLOWD, YOU NEED APPROVAL"

  SELECT * FROM [HumanResources].[Shift]

  /**************************DATA BASE LEVEL TRIGGER *****************************
  DB can contain many tables... if went to write a trigger for the whole DB
  ********************************************************************************/

  CREATE TRIGGER demoTrigger
  ON DATABASE   --This instead of the name of table as above example
  AFTER CREATE_TABLE  --option asre AFTER/BEFORE  and INSERT/UPDATE/DELETE
  AS
  BEGIN
  PRINT 'CREATING OF NEW TABLES NOT ALLOWED'
  ROLLBACK TRANSACTION
  END
  GO

  ------------TEST-------------
  CREATE TABLE MYDEMOTABLE(col1 varchar(10))

  --  the error message will be "CREATING OF NEW TABLES NOT ALLOWED"










