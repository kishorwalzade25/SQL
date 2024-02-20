--Demo Multi Attributes Join

-- Creating a new table based on [Person].[BusinessEntityAddress]
SELECT 
  [bea].[BusinessEntityID], 
  [bea].[rowguid], 
  [bea].[AddressID], 
  [bea].[ModifiedDate], 
  [bea].[AddressTypeID] 
INTO [Person].[BusinessEntityAddressArchive] 
FROM 
  [Person].[BusinessEntityAddress] AS [bea]

-- Removing an arbitrary 1,500 rows for the demo
DELETE TOP (1500)
FROM [Person].[BusinessEntityAddressArchive];

-- Which rows are in the production table that 
-- are NOT in the archive table?
SELECT 
  [bea].[BusinessEntityID], 
  [bea].[rowguid], 
  [bea].[AddressID], 
  [bea].[ModifiedDate], 
  [bea].[AddressTypeID],
  [abea].[BusinessEntityID]
FROM 
  [Person].[BusinessEntityAddress] AS [bea] 
  Left Outer Join [Person].[BusinessEntityAddressArchive] AS [abea] 
ON    [bea].[BusinessEntityID] = [abea].[BusinessEntityID] 
  AND [bea].[AddressID] = [abea].[AddressID] 
  AND [bea].[AddressTypeID] = [abea].[AddressTypeID] 
Where 
  [abea].[BusinessEntityID] is null;

-- Demo cleanup
DROP TABLE [Person].[BusinessEntityAddressArchive];


