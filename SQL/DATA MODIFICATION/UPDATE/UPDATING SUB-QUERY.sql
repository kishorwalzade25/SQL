--DEMO: UPDATING SUB-QUERY

SELECT Min([PLPH].[listprice]) AS MINLISTPRICE
FROM   [AdventureWorks2012].[Production].[productlistpricehistory] AS [PLPH]
WHERE  [PLPH].[productid] = 707;

--What is current list price of another product
SELECT [PLPH].[listprice] AS MINLISTPRICE
FROM   [AdventureWorks2012].[Production].[productlistpricehistory] AS [PLPH]
WHERE  [PLPH].[productid] = 708
       AND [enddate] IS NULL;

-- UPDATE PRODUCT 708 TO HAVE 707'S MINIMUM PRICE
UPDATE [Production].[productlistpricehistory]
SET    [listprice] = (SELECT Min([PLPH].[listprice]) AS MINLISTPRICE
                      FROM
              [AdventureWorks2012].[Production].[productlistpricehistory] AS
              [PLPH]
                      WHERE  [PLPH].[productid] = 707)
WHERE  [productid] = 708
       AND [enddate] IS NULL;

--WILL THIS WORK?
UPDATE [Production].[productlistpricehistory]
SET    [listprice] = (SELECT [PLPH].[listprice] AS MINLISTPRICE
                      FROM
              [AdventureWorks2012].[Production].[productlistpricehistory] AS
              [PLPH]
                      WHERE  [PLPH].[productid] = 707)
WHERE  [productid] = 708
       AND [enddate] IS NULL; 