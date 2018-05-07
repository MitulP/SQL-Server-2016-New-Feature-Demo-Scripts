/**
=============================================
Author: Mitul Panchal
Create date: 5/1/2018 
Description:  Columnstore index in SQL Server 2016
Script: 1
=============================================
**/



-- b-tree index
CREATE NONCLUSTERED INDEX IX_SampleData_Reg 
 ON SampleData (VarcharColumn1,FloatColumn1);
GO

-- column store index
drop index IX_SampleData_ColStore on SampleData
create NONCLUSTERED COLUMNSTORE INDEX IX_SampleData_ColStore 
 ON SampleData (VarcharColumn1,FloatColumn1,[VarcharColumn2]);
GO

-- column store query
SELECT VarcharColumn1,avg(FloatColumn1),[VarcharColumn2]
  FROM SampleData GROUP BY VarcharColumn1,[VarcharColumn2]
GO

-- b-tree query
SELECT VarcharColumn1,avg(FloatColumn1),[VarcharColumn2]
  FROM SampleData GROUP BY VarcharColumn1,[VarcharColumn2]
  OPTION (TABLE HINT(SampleData, INDEX (IX_SampleData_Reg)))
GO