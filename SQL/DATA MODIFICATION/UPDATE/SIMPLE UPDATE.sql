-- DEMO : SIMPLE UPDATE
USE [AdventureWorks2012]

go

--updating all rows
UPDATE [Production].[product]
SET    [sellenddate] = '12/31/2018',
       [modifieddate] = Getdate();

go

SELECT [P].[productid],
       [P].[sellenddate],
       [P].[modifieddate]
FROM   [Production].[product] AS [P]

go

-- UPDATE ROWS WITH SPECIFIC CONDITION
UPDATE [Production].[product]
SET    [sellenddate] = '12/31/2020',
       [modifieddate] = Getdate()
WHERE  [productid] = 324;

go

SELECT [P].[productid],
       [P].[sellenddate],
       [P].[modifieddate]
FROM   [Production].[product] AS [P]
WHERE  [productid] = 324;

go

--USE DEFAULT AND NULL
SELECT [P].[productid],
       [P].[sellenddate],
       [P].[modifieddate]
FROM   [Production].[product] AS [P]
WHERE  [productid] = 329;

UPDATE [Production].[product]
SET    [sellenddate] = NULL,
       [modifieddate] = DEFAULT
WHERE  [productid] = 329 