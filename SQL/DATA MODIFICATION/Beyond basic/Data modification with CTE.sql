--Demo: Data modification with CTE'S

--The rows we wish to change, using SQL server 2012's OFFSET AND FETCH

SELECT   [wor].[WorkOrderID],
         [wor].[ProductID],
         [wor].[OperationSequence],
         [wor].[LocationID],
         [wor].[ActualResourceHrs],
         [wor].[PlannedCost],
         [wor].[ActualCost],
         [wor].[ModifiedDate]
FROM     [Production].[WorkOrderRouting] AS [wor]
ORDER BY [wor].[WorkOrderID] offset 50 rows 
FETCH next 5 rows only;
go

--OFFSET and Fetch can't be specified directly in
--Insert,update,merge,and deletestatements
UPDATE [Production].[WorkOrderRouting]
SET      [ActualCost] *=1.2
ORDER BY [WorkOrderID] offset 50 rowsFETCH next 5 rows only;

--USE a CTE instead
WITH [CTE_WorkOrderRouting] AS
(
         SELECT   [wor].[WorkOrderID],
                  [wor].[ProductID],
                  [wor].[OperationSequence],
                  [wor].[LocationID],
                  [wor].[ActualResourceHrs],
                  [wor].[PlannedCost],
                  [wor].[ActualCost],
                  [wor].[ModifiedDate]
         FROM     [Production].[WorkOrderRouting] AS [wor]
         ORDER BY [wor].[WorkOrderID] offset 50 rows
         FETCH next 5 rows only)
UPDATE [CTE_WorkOrderRouting]
SET    [ActualCost]*=1.2,
       [ModifiedDate]=getdate();
go

--The rows we wish to change, using SQL server 2012's OFFSET AND FETCH
SELECT   [wor].[WorkOrderID],
         [wor].[ProductID],
         [wor].[OperationSequence],
         [wor].[LocationID],
         [wor].[ActualResourceHrs],
         [wor].[PlannedCost],
         [wor].[ActualCost],
         [wor].[ModifiedDate]
FROM     [Production].[WorkOrderRouting] AS [wor]
ORDER BY [wor].[WorkOrderID] offset 50 rows 
FETCH next 5 rows only;
go