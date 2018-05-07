/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  SQL Server 2016 Sort Order Batch Processing Mode
Script: 2
=============================================
**/
ALTER DATABASE AdventureWorks2016CTP3 SET COMPATIBILITY_LEVEL = 130
GO
CREATE CLUSTERED COLUMNSTORE INDEX IXC_BatchTest ON BATCHMODE WITH (DROP_EXISTING = ON);  
GO

DBCC DROPCLEANBUFFERS();
GO
SET STATISTICS TIME ON
SELECT * FROM BATCHMODE WHERE Name like '%ad%' order by Name desc
SET STATISTICS TIME OFF


--DBCC DROPCLEANBUFFERS();
--GO
--SET STATISTICS TIME ON
--SELECT * FROM BatchTest WHERE  FirstName like 'Joh%' ORDER BY FirstName asc OPTION (QUERYTRACEON 9347)
--SET STATISTICS TIME OFF