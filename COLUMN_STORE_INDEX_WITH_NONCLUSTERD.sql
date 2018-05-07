
select SalesOrderID,ProductID from [Sales].[SalesOrderDetail] order by OrderQty
--Estimated I/O cost 0.918681  Primary Index
--Estimated I/O cost 0.203866
--Estimated I/O cost 0.023867

CREATE NONCLUSTERED INDEX MINDEX ON [Sales].[SalesOrderDetail]
(
	SalesOrderID,ProductID
)

CREATE NONCLUSTERED COLUMNSTORE INDEX MINDEXCL ON [Sales].[SalesOrderDetail]
(
	SalesOrderID,ProductID
)