-- Demo equi join vs non-equi join

SELECT 
  [sod].[salesorderid], 
  [sod].[salesorderdetailid], 
  [sod].[orderqty], 
  [sod].[productid], 
  [so].[specialofferid], 
  [so].[startdate], 
  [sod].[modifieddate], 
  [so].[enddate], 
  [so].[description] 
FROM 
  [Sales].[salesorderdetail] AS [sod] 
  INNER JOIN [Sales].[specialoffer] AS [so] 
  ON [sod].specialofferid = [so].[specialofferid] 
  AND [sod].[modifieddate] >= [so].[startdate] 
  AND [sod].[modifieddate] < [so].[enddate] 
WHERE 
  [so].[specialofferid] > 1;

