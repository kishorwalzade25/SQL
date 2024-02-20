-- Demo Query Paging

--Returning first 25 rows only
SELECT [e].[FirstName],
       [e].[LastName],
	   [e].[AddressLine1]
FROM [HumanResources].[vEmployee] AS [e]
order by [e].[FirstName],[e].[LastName]
         OFFSET 0 ROWS
		 FETCH NEXT 25 ROWS ONLY;

--Paging through the next 25 rows
SELECT [e].[FirstName],
       [e].[LastName],
	   [e].[AddressLine1]
FROM [HumanResources].[vEmployee] AS [e]
order by [e].[FirstName],[e].[LastName]
         OFFSET 25 ROWS
		 FETCH NEXT 25 ROWS ONLY;