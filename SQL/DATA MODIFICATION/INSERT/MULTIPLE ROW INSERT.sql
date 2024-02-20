--demo multiple row-insert(Row Constructor)

EXEC sys.sp_help '[Production].[Culture]';

SELECT [c].[cultureid],
       [c].[name],
       [c].[modifieddate]
FROM   [Production].[culture] AS [c]
ORDER BY [C].[ModifiedDate]

--INSERT THREE ROW INTO IN ONE STATEMENT
INSERT INTO [Production].[culture]
            ([cultureid],
             [name],
             [modifieddate])
VALUES      (N'AF',
             N'AFRICAN',
             DEFAULT),
            (N'HY',
             N'ARMENIA',
             DEFAULT),
            (N'SD',
             N'SINDHI',
             DEFAULT) 