--Inserting data into table column wise

--creating table 
CREATE TABLE [Production].[productcategoryv2]
  (
     [productcategoryid] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
     [name]              VARCHAR(50) NOT NULL DEFAULT 'UNKNOWN',
     [rowguid]           [UNIQUEIDENTIFIER] DEFAULT Newid(),
     [modifieddate]      DATETIME NOT NULL DEFAULT Getdate()
  ) ;

-- WILL THIS WORK
INSERT INTO [Production].[productcategoryv2]
VALUES      (N'APPLIANCES'); 

--An explicit value for the identity column in table 'Production.productcategoryv2' can only be specified 
--when a column list is used and IDENTITY_INSERT is ON.

SET IDENTITY_INSERT [Production].[productcategoryv2] ON

--WHAT ABOUT THIS?
INSERT INTO [Production].[productcategoryv2] ([productcategoryid],[name],[rowguid],[modifieddate])
VALUES (1,N'Appliances',NEWID(),GETDATE());

SET IDENTITY_INSERT [Production].[productcategoryv2] OFF

SELECT [PCV2].[productcategoryid],
       [PCV2].[name],
	   [PCV2].[rowguid],
	   [PCV2].[modifieddate],
	   [PCV2].[ENABLED]
FROM [Production].[ProductCategoryV2] AS [PCV2]

--NOW LET'S MODIFY THE ORIGINAL TABLE DEFINATION
ALTER TABLE [Production].[ProductCategoryV2]
ADD [ENABLED] BIT NULL;

SET IDENTITY_INSERT [Production].[productcategoryv2] ON

-- WILL THIS WORK?
INSERT INTO [Production].[productcategoryv2] ([productcategoryid],[name],[rowguid],[modifieddate])
VALUES (2,N'Appliances',NEWID(),GETDATE());

-- WILL THIS WORK?
INSERT INTO [Production].[productcategoryv2] 
VALUES (3,N'e-BOOK',NEWID(),GETDATE());

-- WILL THIS WORK?
INSERT INTO [Production].[productcategoryv2] ([productcategoryid],[name],[rowguid],[modifieddate],[ENABLED])
VALUES (3,N'Appliances',NEWID(),GETDATE(),1);

SELECT [PCV2].[productcategoryid],
       [PCV2].[name],
	   [PCV2].[rowguid],
	   [PCV2].[modifieddate],
	   [PCV2].[ENABLED]
FROM [Production].[ProductCategoryV2] AS [PCV2]

SET IDENTITY_INSERT [Production].[productcategoryv2] OFF

INSERT INTO [Production].[ProductCategoryV2] ([name])
VALUES (N'TEXTBOOK');

drop table [Production].[ProductCategoryV2];