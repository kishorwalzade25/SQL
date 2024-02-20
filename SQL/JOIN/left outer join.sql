--Demo Left Outer Join

--LEFT OUTER returns all rows from the left table that match the right
--table and also rows from the left table that do NOT match
-- 1. Output columns for unmatched rows are returned as NULL

SELECT 
  [p].[Name], 
  [sod].[OrderQty], 
  [sod].[ProductID], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Sales].[SalesOrderDetail] AS [sod]
  on [p].[ProductID] = [sod].[ProductID] 
order by 
  [p].[Name], 
  [sod].[SalesOrderDetailID]

 --what is difference?
SELECT 
  [p].[Name], 
  [sod].[OrderQty], 
  [sod].[ProductID], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Sales].[SalesOrderDetail] AS [sod] 
  on [p].[ProductID] = [sod].[ProductID] 
where 
  [sod].[ProductID] is null 
order by 
  [p].[Name], 
  [sod].[SalesOrderDetailID]

-- Predicatment placement in on
SELECT 
  [p].[Name], 
  [sod].[OrderQty], 
  [sod].[ProductID], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Sales].[SalesOrderDetail] AS [sod] 
  on [p].[ProductID] = [sod].[ProductID] 
     AND [sod].[OrderQty] > 2 
order by 
  [p].[Name], 
  [sod].[SalesOrderDetailID]


-- Predicate placement in where
SELECT 
  [p].[Name], 
  [sod].[OrderQty], 
  [sod].[ProductID], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Sales].[SalesOrderDetail] AS [sod] 
  on [p].[ProductID] = [sod].[ProductID] 
where 
  [sod].[OrderQty] > 2 
order by 
  [p].[Name], 
  [sod].[SalesOrderDetailID]

