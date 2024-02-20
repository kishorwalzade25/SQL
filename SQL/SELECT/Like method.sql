USE AdventureWorks2012;
GO
DECLARE @find VARCHAR(30);
/* Also allowed:
DECLARE @find VARCHAR(30) = 'Man%';
*/
SET @find = 'Man%';
SELECT p.LastName, p.FirstName, ph.PhoneNumber
FROM Person.Person AS p
JOIN Person.PersonPhone AS ph ON p.BusinessEntityID = ph.BusinessEntityID
WHERE LastName LIKE @find;