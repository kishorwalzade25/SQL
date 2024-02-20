--eXECUTION ORDER PREFERNCES
--1.FROM
--2.ON
--3.JOIN
--4.WHERE
--5.GROUP BY
--6.WITH CUBE OR WITHOUT ROLLUP
--7.HAVING
--8.SELECT
--9.DISTINCT
--10.ORDER BY
--11.TOP

--Demo  Binding order

--can I reference total cost?
SELECT  [pt].[TransactionID],
        [pt].[ProductID],
		[pt].[Quantity],
		[pt].[ActualCost],
		([pt].[Quantity]*[pt].[ActualCost]) as [TotalCost] 
FROM [Production].[TransactionHistory] AS [pt]
where [TotalCost] >=100;

-- can I reference totalCost?
SELECT  [pt].[TransactionID],
        [pt].[ProductID],
		[pt].[Quantity],
		[pt].[ActualCost],
		([pt].[Quantity]*[pt].[ActualCost]) as [TotalCost] 
FROM [Production].[TransactionHistory] AS [pt]
order by [TotalCost]
