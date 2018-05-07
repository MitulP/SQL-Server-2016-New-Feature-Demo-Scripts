/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  Plan Forcing with the Query Store in SQL Server 2016
Script: 1
=============================================
**/

USE [AdventureWorks2016CTP3];
GO
SELECT * FROM Sales.[SalesOrderDetail] WHERE [ProductID] = 897; -- returns 2 records
GO 100

SELECT * FROM Sales.[SalesOrderDetail] WHERE [ProductID] = 870; -- returns 4690 records
GO


SELECT * FROM Sales.[SalesOrderDetail] WHERE [ProductID] = 870; -- returns 4690 records
GO
