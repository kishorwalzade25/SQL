--DEMO : DYNAMIC COMPOUNDING SET COLUMN
SELECT [ProductID]
      ,[LocationID]
      ,[Shelf]
      ,[Bin]
      ,[Quantity]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [Production].[ProductInventory]

--COMPOUND ASSIGMENT OPERATORS
  UPDATE [Production].[ProductInventory]
  SET [Quantity] *=2
  WHERE [ProductID]=316;