--Demo:where Clause

--one predicate
SELECT [sod].[SalesOrderID],
       [sod].[SalesOrderDetailID],
	   [sod].[CarrierTrackingNumber]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber]='4911-403c-98';

-- Two predicates with AND
SELECT [sod].[SalesOrderID],
       [sod].[SalesOrderDetailID],
	   [sod].[CarrierTrackingNumber],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber]='4911-403c-98' AND
      [sod].[SpecialOfferID]=1;

-- Two predicates with OR
SELECT [sod].[SalesOrderID],
       [sod].[SalesOrderDetailID],
	   [sod].[CarrierTrackingNumber],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE [sod].[CarrierTrackingNumber]='4911-403c-98' OR
      [sod].[SpecialOfferID]=1;

-- Three predicates AND and OR
SELECT [sod].[SalesOrderID],
       [sod].[SalesOrderDetailID],
	   [sod].[CarrierTrackingNumber],
	   [sod].[SpecialOfferID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE ([sod].[CarrierTrackingNumber]='4911-403c-98' AND
      [sod].[SpecialOfferID]=1) OR
	  [sod].[ProductID]=711;

--Negating a boolean expression
SELECT [sod].[SalesOrderID],
       [sod].[SalesOrderDetailID],
       [sod].[ProductID]
FROM [Sales].[SalesOrderDetail] AS [sod]
WHERE NOT [sod].[ProductID]=711;