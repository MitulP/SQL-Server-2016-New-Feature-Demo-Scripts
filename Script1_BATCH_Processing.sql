/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  SQL Server 2016 Sort Order Batch Processing Mode
Script: 1
=============================================
**/


USE AdventureWorks2016CTP3 
GO

DROP TABLE IF EXISTS [dbo].BATCHMODE

select ProductModelID,Name,rowguid into BATCHMODE from  [Production].[ProductModel]

 
CREATE CLUSTERED INDEX IXC_BatchTest ON BATCHMODE (Name);  
GO  


USE master 
GO
ALTER DATABASE AdventureWorks2016CTP3 SET COMPATIBILITY_LEVEL = 120
GO

USE AdventureWorks2016CTP3
GO
DBCC DROPCLEANBUFFERS();
GO

SET STATISTICS TIME ON
SELECT * FROM BATCHMODE WHERE Name like '%ad%'  order by Name desc
SET STATISTICS TIME OFF

--DROP INDEX IXC_BatchTest   
--    ON BATCHMODE;  
--GO 