/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description: Temporal Table SQL Server 2016
Script: 1
=============================================
**/
USE [AdventureWorks2016CTP3]
GO

CREATE TABLE dbo.TestTemporal
	(ID int primary key
	,A int
	,B int
	,C AS A * B
	,SysStartTime datetime2 GENERATED ALWAYS AS ROW START NOT NULL
	,SysEndTime datetime2 GENERATED ALWAYS AS ROW END NOT NULL
	,PERIOD FOR SYSTEM_TIME (SysStartTime,SysEndTime)) WITH(SYSTEM_VERSIONING = ON(HISTORY_TABLE = dbo.TestTemporal_History));

	-- Initial Load
INSERT INTO dbo.TestTemporal(ID, A, B)
VALUES	 (1,2,3)
		,(2,4,5)
		,(3,0,1);

SELECT * FROM [dbo].[TestTemporal_History]
-- Modify Data
DELETE FROM dbo.TestTemporal
WHERE ID = 3;

UPDATE dbo.TestTemporal
SET A = 5
WHERE ID = 3;