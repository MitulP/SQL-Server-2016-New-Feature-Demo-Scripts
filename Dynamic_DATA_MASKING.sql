/**
=============================================
Author: Mitul Panchal
Create date: 5/2/2018 
Description:  Dynamic Data Masking Example
=============================================
**/
USE tempdb
GO

---CREATE DDM TABLE FOR DEMO TABLE INTO TEMPDB
SELECT TOP (10) 
	  ID        = IDENTITY(INT, 1, 1),
	  FirstName = RIGHT(o.name, 8), 
	  LastName  = LEFT(o.name, 12), 
	  Email     = LEFT(o.name, 9) + '@' + RIGHT(o.name, 11) + '.net',
	  SSN       = STUFF(STUFF(RIGHT('000000000' 
				+ RTRIM(ABS(CHECKSUM(NEWID()))),9),4,0,'-'),7,0,'-'),
	  BirthDate = DATEADD(DAY, -ABS(CHECKSUM(NEWID())%10000), o.modify_date)
INTO dbo.DDM
FROM sys.all_objects AS o
	ORDER BY NEWID();

---SELECT THE DATA AND VERIFYING RECORD

SELECT *
  FROM [tempdb].[dbo].[DDM]

  --APPLYING MASKING FOR DIFFERENT COLUMN 

ALTER TABLE dbo.DDM ALTER COLUMN FirstName 
	ADD MASKED WITH (FUNCTION = 'partial(1, "XXXXX", 0)');
    -- show only the first character of the first name

ALTER TABLE dbo.DDM ALTER COLUMN LastName  
    ADD MASKED WITH (FUNCTION = 'partial(2, "XXXXXXXX", 1)');
    -- show the first two characters and the last character of the last name

ALTER TABLE dbo.DDM ALTER COLUMN Email     
    ADD MASKED WITH (FUNCTION = 'email()');
    -- all addresses will show as nXXX@XXXX.com

ALTER TABLE dbo.DDM ALTER COLUMN SSN       
    ADD MASKED WITH (FUNCTION = 'partial(1,"XX-XX-XXX",1)');
    -- SSNs will become nXX-XX-XXXn

ALTER TABLE dbo.DDM ALTER COLUMN BirthDate 
    ADD MASKED WITH (FUNCTION = 'default()');
    -- all Birthdates will show as 2000-01-01 
GO
SELECT * FROM dbo.DDM;
GO

--SYSADMIN OR DB_OWNER, THERE IS NO MASKING IMPLEMENTED 

--CREATED a TESTMASK USER FOR TO SEE THE MASKING EFFECT
CREATE USER TEMPUSER WITHOUT LOGIN;
GRANT SELECT ON dbo.DDM TO TEMPUSER;
GO

SELECT SUSER_NAME(), USER_NAME(); 

EXECUTE AS USER = N'TEMPUSER';
GO

SELECT SUSER_NAME(), USER_NAME();  
GO

SELECT * FROM dbo.DDM;
REVERT;
GO

SELECT * FROM dbo.DDM;
GO

--DROP USER TEMPUSER;  
--DROP TABLE if exists dbo.DDM; 
GO