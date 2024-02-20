--Demo: GROUP BY Clause


-- Group By single column (it isn't ordered)
SELECT [sod].[ProductID],
	   SUM([sod].[OrderQty]) AS [OderQtyTotal]
FROM   [Sales].[SalesOrderDetail] AS [sod]
Group By [sod].[ProductID]

-- Group By single column,with Ordering
SELECT [sod].[ProductID],
	   SUM([sod].[OrderQty]) AS [OderQtyTotal]
FROM   [Sales].[SalesOrderDetail] AS [sod]
Group By [sod].[ProductID]
Order By [sod].[ProductID] desc

--GROUP BY,multi-column,with odering
SELECT [sod].[ProductID],
       [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OderQtyTotal]
FROM   [Sales].[SalesOrderDetail] AS [sod]
--WHERE [sod].[ProductID]=707
Group By [sod].[ProductID],
         [sod].[SpecialOfferID]
Order By [sod].[ProductID],
         [sod].[SpecialOfferID]

--GROUPING SETS
SELECT [sod].[ProductID],
       [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OderQtyTotal]
FROM   [Sales].[SalesOrderDetail] AS [sod]
Group By GROUPING SETS
        (
		  (
		   [sod].[ProductID],
           [sod].[SpecialOfferID]
		   ),
		  ([sod].[SpecialOfferID])
		)
Order By [sod].[ProductID],
         [sod].[SpecialOfferID];







		