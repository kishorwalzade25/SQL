---- Demo: INTERSECT and EXCEPT Operators

--INTERSECT and EXCEPT compare the results of two SELECT statements
-- INTERSECT returns distinct values returned by both the left and right sides,
--eliminating unmatched values
-- EXCEPT returns distinct values from the left SELECT that are not found in the
--right

-- We'll create some data discrepencies
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
INTO [Sales].[SalesOrderDetail_A]
FROM [Sales].[SalesOrderDetail];

SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
INTO [Sales].[SalesOrderDetail_B]
FROM [Sales].[SalesOrderDetail];

DELETE TOP (15) 
FROM [Sales].[SalesOrderDetail_A];

UPDATE TOP (750) [Sales].[SalesOrderDetail_B]
SET UnitPrice = 9.9999
WHERE OrderQty = 9;

-- Which rows match between the two tables?
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_A]
INTERSECT
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_B];

-- Which rows are in A but not B?
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_A]
EXCEPT
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_B];

-- Which rows are in B but not A?
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_B]
EXCEPT
SELECT SalesOrderID, SalesOrderDetailID, CarrierTrackingNumber, OrderQty, ProductID, SpecialOfferID, UnitPrice, UnitPriceDiscount, LineTotal, rowguid, ModifiedDate
FROM [Sales].[SalesOrderDetail_A];

-- Cleanup
DROP TABLE [Sales].[SalesOrderDetail_A];
DROP TABLE [Sales].[SalesOrderDetail_B];