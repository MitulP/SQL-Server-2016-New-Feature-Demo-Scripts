/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  Plan Forcing with the Query Store in SQL Server 2016
Script: 4
=============================================
**/
--Free plan cache
DBCC FREEPROCCACHE;
GO
USE [AdventureWorks2016CTP3];
GO

EXEC sp_executesql 
	N'SELECT * FROM Sales.[SalesOrderDetail] 
	WHERE [ProductID] = @ProductID;',N'@ProductID INT',@ProductID=897;
GO  -- returns 2 records

EXEC sp_executesql 
	N'SELECT * FROM Sales.[SalesOrderDetail] 
	WHERE [ProductID] = @ProductID;',N'@ProductID INT',@ProductID=870; 
GO -- returns 4688 records

--------------------------------------------------------------------------

DBCC FREEPROCCACHE;
GO
USE [AdventureWorks2016CTP3];
GO

EXEC sp_executesql 
	N'SELECT * FROM Sales.[SalesOrderDetail] 
	WHERE [ProductID] = @ProductID;',N'@ProductID INT',@ProductID=870;
GO  -- returns 4688 records

EXEC sp_executesql 
	N'SELECT * FROM Sales.[SalesOrderDetail] 
	WHERE [ProductID] = @ProductID;',N'@ProductID INT',@ProductID=897; 
GO -- returns 2 records