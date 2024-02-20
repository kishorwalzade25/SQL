-- Demo :Basic delete

drop table [HumanResources].[employeev2];

--create table based on humanresources employee
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
       [modifieddate]
       --,[managerid]
INTO   [HumanResources].[employeev2]
FROM   [AdventureWorks2012].[HumanResources].[employee]

--validating row count on table
SELECT Count(*) AS [Rowcount]
FROM   [HumanResources].[employeev2] 

--Deleting all rows
DELETE [HumanResources].[employeev2]

go 

--validating row count on table
SELECT Count(*) AS [Rowcount]
FROM   [HumanResources].[employeev2]

--Repopulate
insert into [HumanResources].[employeev2]
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
       [modifieddate]
	  -- ,[managerid]
FROM   [AdventureWorks2012].[HumanResources].[employee]

--validate rows to be removed
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
       [modifieddate]
    
FROM   [AdventureWorks2012].[HumanResources].[employeev2]
where [JobTitle]='Sales Representative'

--Deleting rows
delete [HumanResources].[employeev2]
where [JobTitle]='Sales Representative';