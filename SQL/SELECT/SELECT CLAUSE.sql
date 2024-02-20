use AdventureWorks2012;

-- No data Sources

select '1' as [col 1],
       'A' as [col 2]

--check available data source column

execute sp_help '[Production].[TransactionHistory]'

-- one data source

select [TransactionID],
       [ProductID],
	   [Quantity],
	   [ActualCost],
	   'Batch 1' AS [BATCHID],
	   ([Quantity]*[ActualCost]) AS [TOTAL COST]
	   FROM [Production].[TransactionHistory]