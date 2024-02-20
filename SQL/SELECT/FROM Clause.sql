--Demo:FROM	CLAUSE

--FROM Clause(table)
SELECT [Name] AS [NAME]
       FROM [HumanResources].[Department]

--Table variable
Declare @order TABLE
   (OrderID int not null primary key,
    OrderDT datetime not null);

Insert @order (OrderID,OrderDT)
values (1,GETDATE());

select [OrderID],[OrderDT]
       FROM @order