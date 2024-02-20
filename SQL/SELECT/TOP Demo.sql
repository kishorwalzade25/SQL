--Demo: TOP

--No Top
SELECT [edh].[FirstName],
       [edh].[LastName],
	   [edh].[StartDate],
	   [edh].[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [edh]
ORDER BY [edh].[StartDate] desc

--TOP ROWS
SELECT TOP(10)
       [edh].[FirstName],
       [edh].[LastName],
	   [edh].[StartDate],
	   [edh].[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [edh]
ORDER BY [edh].[StartDate]

--TOP PERCENTAGE
SELECT TOP(40) PERCENT
       [edh].[FirstName],
       [edh].[LastName],
	   [edh].[StartDate],
	   [edh].[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [edh]
ORDER BY [edh].[StartDate]

-- TOP WITH TIES
SELECT TOP(3) WITH TIES
       [edh].[FirstName],
       [edh].[LastName],
	   [edh].[StartDate],
	   [edh].[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [edh]
WHERE [edh].[StartDate]='2008-12-07'
ORDER BY [edh].[StartDate]

--WITHOUT TIES
SELECT TOP(3)
       [edh].[FirstName],
       [edh].[LastName],
	   [edh].[StartDate],
	   [edh].[EndDate]
FROM [HumanResources].[vEmployeeDepartmentHistory] AS [edh]
WHERE [edh].[StartDate]='2008-12-07'
ORDER BY [edh].[StartDate]



