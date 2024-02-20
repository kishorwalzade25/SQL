--Demo: WHERE AND FROM CLAUSE WITH DELETE

--VALIDATE WHICH ROW WE ARE DELETING
SELECT [BEA].[businessentityid],
       [S].[name]
FROM   [Person].[businessentitycontact] AS [BEA]
       INNER JOIN [Sales].[store] AS [S]
               ON [S].[businessentityid] = [BEA].[businessentityid]
WHERE  [S].[name] IN ( N'Next-Door Bike Store',
                       N'Lubricant and Grease Suppliers' ); 

--DELETE ROWS
DELETE [BEA]
FROM   [Person].[businessentitycontact] AS [BEA]
       INNER JOIN [Sales].[store] AS [S]
               ON [S].[businessentityid] = [BEA].[businessentityid]
WHERE  [S].[name] IN ( N'Next-Door Bike Store',
                       N'Lubricant and Grease Suppliers' );

-- ALL OTHER ROW
SELECT [BEA].[businessentityid],
       [S].[name]
FROM   [Person].[businessentitycontact] AS [BEA]
       INNER JOIN [Sales].[store] AS [S]
               ON [S].[businessentityid] = [BEA].[businessentityid]
