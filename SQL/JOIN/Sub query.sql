-- Demo: Using Sub-queries

---- Joining to a sub-query
SELECT 
  [sod].[SalesOrderDetailID], 
  [sod].[SalesOrderID], 
  [soh].[SalesPersonID] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
  INNER JOIN (
    SELECT 
      [isoh].[SalesOrderID], 
      [isoh].[SalesPersonID] 
    FROM 
      [Sales].[SalesOrderHeader] AS [isoh] 
    WHERE 
      AccountNumber = '10-4020-000510'
  ) AS [soh] 
on [sod].[SalesOrderID] = [soh].[SalesOrderID]

-- This could be re-written as follows
SELECT 
  sod.SalesOrderDetailID, 
  sod.SalesOrderID, 
  soh.SalesPersonID 
FROM 
  [Sales].[SalesOrderDetail] AS sod 
  INNER JOIN [Sales].[SalesOrderHeader] AS soh 
ON sod.SalesOrderID = soh.SalesOrderID 
WHERE 
  AccountNumber = '10-4020-000510';

-- Non-correlated sub-query in a predicate
SELECT 
  [sod].[SalesOrderDetailID], 
  [sod].[SalesOrderID] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
WHERE 
  [sod].[SalesOrderID] IN (
    SELECT 
      [soh].[SalesOrderID] 
    FROM 
      [Sales].[SalesOrderHeader] AS [soh] 
    WHERE 
      [soh].[AccountNumber] = '10-4020-000510'
  )

-- Correlated sub-query join
SELECT 
  [soh].[SalesOrderID] 
FROM 
  [Sales].[SalesOrderHeader] AS [soh] 
WHERE 
  [soh].[SalesOrderID] IN (
    SELECT 
      [sod].[SalesOrderDetailID] 
    FROM 
      [Sales].[SalesOrderDetail] AS [sod] 
    where 
      [sod].[SalesOrderDetailID] = [soh].[SalesOrderID] 
      AND [sod].[OrderQty] > 2
  )



