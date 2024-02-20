-- Demo: Merge
-- Remove "count of number of rows" messages
SET nocount ON;

go

-- Let's create a new staging table
SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
INTO   [Production].[transactionhistorystaging]
FROM   [Production].[transactionhistory];

go

-- Create some variations in staging that must
-- eventually be reflected in the "live" version
DELETE [Production].[transactionhistorystaging]
WHERE  [transactionid] BETWEEN 100000 AND 100004

go

UPDATE [Production].[transactionhistorystaging]
SET    [quantity] = 10,
       [modifieddate] = Getdate()
WHERE  [transactionid] = 100019

go

INSERT INTO [Production].[transactionhistorystaging]
            ([productid],
             [referenceorderid],
             [referenceorderlineid],
             [transactiondate],
             [transactiontype],
             [quantity],
             [actualcost],
             [modifieddate])
VALUES      (328,
             72592,
             1,
             '2012-09-04 14:40:33.040',
             N'W',
             99,
             0.21,
             Getdate());

go

-- Now perform I/U/D on [Production].[TransactionHistory]
-- based on [Production].[TransactionHistoryStaging]
MERGE INTO [Production].[transactionhistory] AS [t]
using [Production].[transactionhistorystaging] AS [s]
ON [s].[TransactionID] = [t].[transactionid]
WHEN matched AND ( [s].[quantity]<>[t].[quantity]) THEN
  UPDATE SET [t].[quantity] = [s].[quantity],
             [t].[modifieddate] = [s].[modifieddate]

WHEN NOT matched BY target THEN
  INSERT ( [productid],
           [referenceorderid],
           [referenceorderlineid],
           [transactiondate],
           [transactiontype],
           [quantity],
           [actualcost],
           [modifieddate] )
  VALUES ( [s].[productid],
           [s].[referenceorderid],
           [s].[referenceorderlineid],
           [s].[transactiondate],
           [s].[transactiontype],
           [s].[quantity],
           [s].[actualcost],
           [s].[modifieddate] )

WHEN NOT matched BY source THEN
  DELETE;

go

-- Where the rows removed?
SELECT Count(*) AS [rowcount]
FROM   [Production].[transactionhistory]
WHERE  [transactionid] BETWEEN 100000 AND 100004;

go

-- Another method for comparing table contents
SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistory]
EXCEPT
SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistorystaging];

go

SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistorystaging]
EXCEPT
SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistory];

go

SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistorystaging]
INTERSECT
SELECT [transactionid],
       [productid],
       [referenceorderid],
       [referenceorderlineid],
       [transactiondate],
       [transactiontype],
       [quantity],
       [actualcost],
       [modifieddate]
FROM   [Production].[transactionhistory];

go 