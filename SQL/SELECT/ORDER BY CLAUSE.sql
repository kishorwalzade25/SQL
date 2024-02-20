--Demo ORDER BY CLAUSE

-- ORDER BY ASCENDING AND DESCAENDING
SELECT [sod].[ProductID],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
order by [sod].[ProductID] Desc,
		 [sod].[SpecialOfferID] ASC

-- NOT RECOMMENED
SELECT [SOD].[ProductID],
       [SOD].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [SOD]
ORDER BY 1,2;