-- Demo: Introduction to Common Table Expressions

-- Simple CTE reference
--WITH ProductQty AS(
--  SELECT 
--    [pi].[ProductID], 
--    [pi].[LocationID], 
--    [pi].[Shelf], 
--    [pi].[Bin], 
--    [pi].[Quantity] 
--  FROM 
--    [Production].[ProductInventory] AS [pi]
--) 
--SELECT 
--  [pq].[ProductID], 
--  SUM([pq].[Quantity]) AS SumQuantity 
--FROM 
--  ProductQty AS [pq] 
--Group by 
--  [pq].[ProductID]
--


---- Optional target column list
--WITH ProductQty(PID, LID, Shelf, Bin, Qty) AS(
--  SELECT 
--    [pi].[ProductID], 
--    [pi].[LocationID], 
--    [pi].[Shelf], 
--    [pi].[Bin], 
--    [pi].[Quantity] 
--  FROM 
--    [Production].[ProductInventory] AS [pi]
--) 
--SELECT [pq].[PID],[pq].[LID],[pq].[Shelf],[pq].[Bin],[pq].[Qty]
  
--FROM 
--  ProductQty AS [pq] 

-- Multiple references to the same CTE
--WITH ProductQty(PID, LID, Shelf, Bin, Qty) AS(
--  SELECT 
--    [pi].[ProductID], 
--    [pi].[LocationID], 
--    [pi].[Shelf], 
--    [pi].[Bin], 
--    [pi].[Quantity] 
--  FROM 
--    [Production].[ProductInventory] AS [pi]
--) 
--SELECT 
--  [p1].[PID], 
--  SUM([p1].[Qty]) AS [ShelfQty_A], 
--  SUM([p2].[Qty]) AS [ShelfQty_B] 
--FROM 
--  ProductQty AS [p1] 
--  Inner Join ProductQty AS [p2] 
--  on [p1].[PID] = [p2].[PID] 
--WHERE 
--  [p1].[shelf] = 'A' 
--  AND [p2].[shelf] = 'B' 
--Group by 
--  [p1].[PID]

-- Multiple CTEs per statement
WITH ProductQty(PID, LID, Shelf, Bin, Qty) AS(
  SELECT 
    [pi].[ProductID], 
    [pi].[LocationID], 
    [pi].[Shelf], 
    [pi].[Bin], 
    [pi].[Quantity] 
  FROM 
    [Production].[ProductInventory] AS [pi]
), 
ListPriceHistory AS(
  SELECT 
    [plh].[ProductID], 
    [plh].[StartDate], 
    [plh].[EndDate], 
    [plh].[ListPrice] 
  FROM 
    [Production].[ProductListPriceHistory] AS [plh] 
  WHERE 
    [plh].[ListPrice] > 10.00
) 
SELECT 
  [pq].[PID], 
  SUM([pq].[Qty]) AS [SumQuantity] 
FROM 
  ProductQty AS [pq] 
  inner join ListPriceHistory AS [lp] 
  on [pq].[PID] = [lp].[ProductID] 
Group by 
  [pq].[PID]




