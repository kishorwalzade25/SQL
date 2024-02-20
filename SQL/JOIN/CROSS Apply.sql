-- Demo: CROSS and OUTER APPLY Operator

-- TVF that returns first name, last name, job title and business
--  entity type for the specified contact

SELECT 
  [c].[BusinessEntityType], 
  [c].[FirstName], 
  [c].[LastName], 
  [c].[JobTitle], 
  [c].[PersonID] 
FROM 
  [dbo].[ufnGetContactInformation] (3) AS [c];

-- Try to INNER JOIN with a TVF
SELECT 
  [c].[BusinessEntityID], 
  [c].[FirstName], 
  [c].[LastName], 
  [c].[JobTitle] 
FROM 
  [Person].[Person] AS [p] 
  INNER JOIN [dbo].[ufnGetContactInformation] ([p].[BusinessEntityID]) AS C 
where 
  [p].[LastName] like 'abo%';

-- Now try CROSS APPLY
-- CROSS APPLY only return left-input rows that produce TVF results
SELECT 
  [c].[BusinessEntityType], 
  [c].[FirstName], 
  [c].[LastName], 
  [c].[JobTitle] 
FROM 
  [Person].[Person] AS [p] 
  CROSS APPLY [dbo].[ufnGetContactInformation] ([p].[BusinessEntityID]) AS C 
where 
  [p].[LastName] like 'abo%';

--OUTER APPLY returns matched and unmatched left-input rows
--Unmatched TVF columns set to NULL
SELECT
  [p].[FirstName],
  [p].[LastName],
  [c].[BusinessEntityType], 
  [c].[FirstName], 
  [c].[LastName], 
  [c].[JobTitle] 
FROM 
  [Person].[Person] AS [p] 
  OUTER APPLY [dbo].[ufnGetContactInformation] ([p].[BusinessEntityID]) AS C 
where 
  [p].[LastName] like 'abo%';

