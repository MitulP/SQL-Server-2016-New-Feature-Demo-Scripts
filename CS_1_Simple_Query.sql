/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  Column store index simple table create in SQL Server 2016
Script: 1
=============================================
**/

USE [AdventureWorks2016CTP3]
GO

-- Create SampleData table
CREATE TABLE [dbo].[SampleData]( 
	[RowKey] [int] NOT NULL, 
	[CreateDate] [int] NOT NULL,
	[OtherDate] [int] NOT NULL,
	[VarcharColumn1] [varchar](20) NULL,
	[VarcharColumn2] [varchar](20) NULL,
	[VarcharColumn3] [varchar](20) NULL,
	[VarcharColumn4] [varchar](20) NULL,
	[VarcharColumn5] [varchar](20) NULL,
	[IntColumn1] int NULL,
	[IntColumn2] int NULL,
	[IntColumn3] int NULL,
	[IntColumn4] int NULL,
	[IntColumn5] int NULL,
	[IntColumn6] int NULL,
	[IntColumn7] int NULL,
	[IntColumn8] int NULL,
	[IntColumn9] int NULL,
	[IntColumn10] int NULL,
	[FloatColumn1] float NULL,
	[FloatColumn2] float NULL,
	[FloatColumn3] float NULL,
	[FloatColumn4] float NULL,
	[FloatColumn5] float NULL	
)
GO

-- Load sample data into table
DECLARE @val INT
SELECT @val=1
WHILE @val < 5000000
BEGIN  
   INSERT INTO SampleData  
       VALUES (@val,
       CAST(CONVERT(varchar,DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365),
          '2015-01-01'),112) as integer),
       CAST(CONVERT(varchar,DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365),
          '2015-01-01'),112) as integer),
       'TEST' + cast(round(rand()*100,0) AS VARCHAR),
       'TEST' + cast(round(rand()*100,0) AS VARCHAR),
       'TEST' + cast(round(rand()*100,0) AS VARCHAR),
       'TEST' + cast(round(rand()*100,0) AS VARCHAR),
       'TEST' + cast(round(rand()*100,0) AS VARCHAR),
       round(rand()*100000,0), 
       round(rand()*100000,0), 	   
       round(rand()*100000,0), 	   
       round(rand()*100000,0), 	   
       round(rand()*100000,0),
       round(rand()*100000,0),
       round(rand()*100000,0),
       round(rand()*100000,0),
       round(rand()*100000,0),
       round(rand()*100000,0),
	   round(rand()*10000,2),
	   round(rand()*10000,2),
	   round(rand()*10000,2),
	   round(rand()*10000,2),
	   round(rand()*10000,2))
   SELECT @val=@val+1
END
GO