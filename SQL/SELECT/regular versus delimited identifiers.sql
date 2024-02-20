-- Demo:regular versus delimited identifiers

--Regular versus Delimited
SELECT NAME,
       [NAME]
	   FROM [HumanResources].[Department];

--CREATE A Temporary Table
CREATE TABLE #DEPARTMENT
       ([DEPARTMENT ID] int not null)
Go

-- will this work
SELECT DEPARTMENT ID 
       FROM #DEPARTMENT;

-- HOW ABOUT THIS
SELECT [DEPARTMENT ID]
       FROM #DEPARTMENT;

DROP TABLE #DEPARTMENT;