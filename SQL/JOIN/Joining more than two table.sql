--Demo Joining more than two Table

-- INNER JOIN multi-table join example
-- Show actual execution plan (compare logical to physical)

SELECT 
  p.Name AS [ProductName], 
  pc.Name AS [CategoryName], 
  ps.Name AS [SubcategoryName] 
FROM 
  [Production].[Product] AS p 
  INNER JOIN [Production].[ProductSubcategory] AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID 
  INNER JOIN [Production].[ProductCategory] AS pc ON ps.ProductCategoryID = pc.ProductCategoryID 
ORDER BY 
  [ProductName], 
  [CategoryName], 
  [SubcategoryName];

-- OUTER JOIN multi-table join example with logical issue
SELECT 
  [p].[Name] AS [ProductName], 
  [pc].[Name] as [CategoryName], 
  [psc].[Name] AS [SubCategoryName] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Production].[ProductSubcategory] AS [psc] 
  on [p].[ProductSubcategoryID] = [psc].[ProductSubcategoryID] 
  Inner join [Production].[ProductCategory] AS [pc] 
  on [pc].[ProductCategoryID] = [psc].[ProductCategoryID] 
order by 
  [ProductName], 
  [CategoryName], 
  [SubCategoryName]

-- Fixing the logical issue
SELECT 
  [p].[Name] AS [ProductName], 
  [pc].[Name] as [CategoryName], 
  [psc].[Name] AS [SubCategoryName] 
FROM 
  [Production].[Product] AS [p] 
  Left outer join [Production].[ProductSubcategory] AS [psc] 
  on [p].[ProductSubcategoryID] = [psc].[ProductSubcategoryID] 
  Left outer join [Production].[ProductCategory] AS [pc] 
  on [pc].[ProductCategoryID] = [psc].[ProductCategoryID] 
order by 
  [ProductName], 
  [CategoryName], 
  [SubCategoryName]