--Demo: Table Aliased

-- Table Alias
SELECT [Dept].[Name]
       FROM [HumanResources].[Department] AS [Dept];

--Compact table alias Example
SELECT [d].[Name]
       FROM [HumanResources].[Department] AS [d];	
