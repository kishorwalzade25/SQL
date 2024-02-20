-- BASIC INSERT DEMO
INSERT INTO [Production].[productcategory]
            ([name])
VALUES      (N'software')

SELECT [PC].[productcategoryid],
       [PC].[name],
       [PC].[rowguid],
       [PC].modifieddate
FROM   [Production].[productcategory] AS [PC]

EXEC Sp_help
  N'Production.ProductCategory' 