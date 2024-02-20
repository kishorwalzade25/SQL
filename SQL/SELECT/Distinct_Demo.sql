--Demo: DISTINCT

--NO DISTINCT
SELECT [sod].[SalesOrderID],
       [sod].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber]='4911-403c-98';

--With Distinct
SELECT DISTINCT [sod].[SalesOrderID]
       --,[sod].[CarrierTrackingNumber]
FROM   [Sales].[SalesOrderDetail] AS [sod]
WHERE  [sod].[CarrierTrackingNumber]='4911-403c-98';

-- NULL handling
SELECT DISTINCT [sod].[CarrierTrackingNumber]
	   
FROM   [Sales].[SalesOrderDetail] AS [sod]
ORDER BY  [sod].[CarrierTrackingNumber]

-- Count of rows with NULL
SELECT COUNT(*)
FROM   [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber] IS NULL
