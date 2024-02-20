-- Demo: Logical Functions (2)
SELECT [PCH].[productid],
       [PCH].[startdate],
       [PCH].[standardcost],
       CASE [PCH].[productid]
         WHEN 707 THEN 'Platinum Collection'
         WHEN 711 THEN 'Silver Collection'
         WHEN 713 THEN 'GOLDEN COLLECTION'
         ELSE 'STANDARD COLLECTION'
       END AS 'PRODUCT STATUS'
FROM   [Production].[productcosthistory] AS [PCH]; 

-- Searched CASE
SELECT [PCH].[productid],
       [PCH].[startdate],
       CASE
         WHEN [PCH].[startdate] BETWEEN '2011-05-31 00:00:00.000' AND '2011-05-31 00:00:00.000' THEN
         'OWNED BY K-TECH'
         WHEN [PCH].[startdate] BETWEEN '2011-05-31 00:00:00.000' AND '2011-05-31 00:00:00.000' THEN
         'OWNED BY Z-TECH'
         ELSE 'UNKNOWN OWNERSHIP'
       END AS [PRODUCT STATUS],
	   [PCH].[StandardCost]
FROM   [Production].[productcosthistory] AS [PCH] 