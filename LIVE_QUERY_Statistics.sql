/**
=============================================
Author: Mitul Panchal
Create date: 5/25/2018 
Description: Live Query State 
=============================================
**/
USE [AdventureWorks2016CTP3]
GO

-- SELECT RECORD FROM DIFFERENT TABLE THROUGH JOIN IT WILL TAKE  
SELECT 
	 TransactionMonth	= FORMAT(t.[TransactionDate],'yyyy-MM')
	,Color
	,SafetyStockLevel	
	,ReorderPoint
	,Quantity			= SUM(t.Quantity)
	,ActualCost			= SUM(t.ActualCost)
FROM [Production].[TransactionHistory]	t
	JOIN  [Production].[Product] p ON t.ProductID = p.ProductID
	JOIN [Production].[TransactionHistoryArchive] PA ON PA.TransactionType = t.TransactionType
--where t.Quantity= 88
GROUP BY 
FORMAT(t.[TransactionDate],'yyyy-MM'), Color,SafetyStockLevel,ReorderPoint
ORDER BY 
Color, Quantity
 
 --PH.StandardCost
 --JOIN [Production].[ProductCostHistory] PH on p.ProductID = PH.ProductID