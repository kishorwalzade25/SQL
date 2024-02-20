-- Demo: UNION OPERATOR

--Combines two or more SELECT statements into a single result set
-- UNION eliminates duplicates
-- UNION ALL retains each data set, including duplicates
-- Tip: When UNION ALL is acceptable, specify it (eliminating a potentially
--unnecessary de-duplication and thus helping query performance)
-- Requirements of UNION:
-- Same number of expressions
-- Columns / expressions / aggregates
-- Data types can differ, but aligned columns must allow for implicit data
--conversion, for example:
-- decimal and numeric = OKAY
-- datetime2 and varbinary = NOT OKAY

-- UNION EXAMPLE
SELECT 
  [sod].[ProductID], 
  [sod].[UnitPrice] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
WHERE 
  [sod].[ProductID] BETWEEN 1 
  AND 799 
UNION 
SELECT 
  [sod].[ProductID], 
  [sod].[UnitPrice] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
WHERE 
  [sod].[ProductID] BETWEEN 800 
  AND 1000;

-- UNION ALL EXAMPLE
SELECT 
  [sod].[ProductID], 
  [sod].[UnitPrice] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
WHERE 
  [sod].[ProductID] BETWEEN 1 
  AND 799 
UNION ALL
SELECT 
  [sod].[ProductID], 
  [sod].[UnitPrice] 
FROM 
  [Sales].[SalesOrderDetail] AS [sod] 
WHERE 
  [sod].[ProductID] BETWEEN 800 
  AND 1000;
