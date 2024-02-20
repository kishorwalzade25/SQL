--Demo Inner join
--Given two data sources, inner joins return all matching pairs of rows
-- Unmatched rows are discarded
--rows from either table that are unmatched in the other table are not returned

--inner join
SELECT 
  [p].[Name], 
  [sod].[ProductID], 
  [sod].[OrderQty], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  INNER JOIN [Sales].[SalesOrderDetail] AS [sod]
  ON [p].[ProductID] = [sod].[ProductID] 
ORDER BY 
  [P].[Name], 
  [sod].[SalesOrderDetailID]


--Inner is optional,but can help readability
SELECT 
  [p].[Name], 
  [sod].[ProductID], 
  [sod].[OrderQty], 
  [sod].[SalesOrderDetailID] 
FROM 
  [Production].[Product] AS [p] 
  JOIN [Sales].[SalesOrderDetail] AS [sod]
  ON [p].[ProductID] = [sod].[ProductID] 
ORDER BY 
  [P].[Name], 
  [sod].[SalesOrderDetailID]
