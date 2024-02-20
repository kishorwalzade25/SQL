--Demo inerting row through select 
use [AdventureWorks2012]
go
drop table [Production].[scrapreasonv2];
--create demo table
CREATE TABLE [Production].[scrapreasonv2]
  (
     scrapreasonid SMALLINT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
     NAME          NVARCHAR(50) NOT NULL DEFAULT 'Unknown',
     modifieddate  DATETIME NOT NULL DEFAULT Getdate()
  ) 

--Insert,Select
INSERT INTO [Production].[scrapreasonv2]
            ([name],
             [modifieddate])
SELECT TOP(10) [sr].[name],
               [sr].[modifieddate]
FROM   [Production].[scrapreason] AS [sr] 

SELECT [sr1].[scrapreasonid],
       [sr1].[name],
       [sr1].[modifieddate]
FROM   [Production].[scrapreason] AS [sr1]

SELECT [sr2].[scrapreasonid],
       [sr2].[name],
       [sr2].[modifieddate]
FROM   [Production].[scrapreasonv2] AS [sr2] 


exec [dbo].[uspGetManagerEmployees] @BusinessEntityID=2;
-- create table  for the procedure product

drop table [manageremployeesrptoutput];
CREATE TABLE [manageremployeesrptoutput]
  (
     [recursionlevel]   SMALLINT NULL,
     [organizationnode] NVARCHAR(50) NOT NULL,
     [managerlastname]  NVARCHAR(50) NOT NULL,
     [businessentityid] INT NOT NULL,
     [firstname]        NVARCHAR(50) NOT NULL,
     [lastname]         NVARCHAR(50) NOT NULL
  ); 

ALTER TABLE [dbo].[manageremployeesrptoutput]
  ADD [managerfirstname] NVARCHAR(50) NOT NULL

INSERT INTO [dbo].[manageremployeesrptoutput]
            ([recursionlevel],
             [organizationnode],
             [managerfirstname],
             [managerlastname],
             [businessentityid],
             [firstname],
             [lastname])
EXEC [dbo].[Uspgetmanageremployees]
  @BusinessEntityID=2; 

SELECT [MERO].[recursionlevel],
       [MERO].[organizationnode],
       [MERO].[managerfirstname],
       [MERO].[managerlastname],
       [MERO].[businessentityid],
       [MERO].[firstname],
       [MERO].[lastname]
FROM   [dbo].[manageremployeesrptoutput] AS [MERO] 