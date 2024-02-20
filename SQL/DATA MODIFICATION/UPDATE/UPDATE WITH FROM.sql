--DEMO : UPDATE WITH FROM

USE [AdventureWorks2012]
GO

-- START WITH UNDERSTANDING WHICH ROWS WILL BE IMPACTED
SELECT [P].[businessentityid],
       [P].[emailpromotion]
FROM   [Person].[person] AS [P]
       INNER JOIN [Person].[businessentityaddress] AS [BEA]
               ON [P].[businessentityid] = [BEA].[businessentityid]
       INNER JOIN [PERSON].[address] AS [A]
               ON [A].[addressid] = [BEA].[addressid]
WHERE  [A].[city] = 'Darmstadt'; 

--UPDATE WITH FROM
UPDATE [P]
SET [EmailPromotion]=2
FROM   [Person].[person] AS [P]
       INNER JOIN [Person].[businessentityaddress] AS [BEA]
               ON [P].[businessentityid] = [BEA].[businessentityid]
       INNER JOIN [PERSON].[address] AS [A]
               ON [A].[addressid] = [BEA].[addressid]
WHERE  [A].[city] = 'Darmstadt'; 