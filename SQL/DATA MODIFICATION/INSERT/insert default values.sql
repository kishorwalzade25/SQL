--DEMO: INSERTING DEFAULT
EXEC sys.Sp_help
  '[Production].[ProductCategoryV2]'

-- WILL THIS WORK?
INSERT [Production].[productcategoryv2]
DEFAULT VALUES;

SELECT [PC].[productcategoryid],
       [PC].[name],
       [PC].[rowguid],
       [PC].[modifieddate],
       [PC].[enabled]
FROM   [Production].[productcategoryv2] AS [PC]

ALTER TABLE [Production].[productcategoryv2]
ADD CONSTRAINT df_enable
DEFAULT '1' FOR [ENABLED]
--ALTER COLUMN [ENABLED] BIT NOT NULL DEFAULT '1'  

-- Alternet method
--ALTER TABLE [Production].[ProductCategoryV2] ADD   DEFAULT ('1') FOR [ENABLED]
--GO