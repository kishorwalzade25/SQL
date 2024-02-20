--Demo HAVING CLAUSE

--Applying a predicates to a group
SELECT [sod].[ProductID],
       [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQtyByProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
Group By [sod].[ProductID],
         [sod].[SpecialOfferID]
Having SUM([sod].[OrderQty]) >=100
Order By [sod].[ProductID],
         [sod].[SpecialOfferID]

--Having or Where
SELECT [sod].[ProductID],
       [sod].[SpecialOfferID],
	   SUM([sod].[OrderQty]) AS [OrderQtyByProductID]
FROM     [Sales].[SalesOrderDetail] AS [sod]
--where  [sod].[SpecialOfferID]=1  or [sod].[SpecialOfferID]=2 or [sod].[SpecialOfferID]=3
Group By [sod].[ProductID],
         [sod].[SpecialOfferID]
Having   [sod].[SpecialOfferID] IN (1,2,3)
Order By [sod].[ProductID],
         [sod].[SpecialOfferID]