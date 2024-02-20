/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [businessentityid],
       [nationalidnumber],
       [loginid],
       [organizationnode],
       [organizationlevel],
       [jobtitle],
       [birthdate],
       [maritalstatus],
       [gender],
       [hiredate],
       [salariedflag],
       [vacationhours],
       [sickleavehours],
       [currentflag],
       [rowguid],
       [modifieddate],
       [managerid]
INTO   [HumanResources].[employeev2]
FROM   [AdventureWorks2012].[HumanResources].[employee] 