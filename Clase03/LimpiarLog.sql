
DBCC SQLPERF(LOGSPACE)
go

-- EDUTEC	4.617188	16.48689	0
-- EDUTEC	1.039063	38.58083	0

ALTER DATABASE EDUTEC 
SET RECOVERY SIMPLE
GO

DBCC SQLPERF(LOGSPACE)
go

USE SSISDB;
GO

DBCC SHRINKFILE (LOG)
GO

ALTER DATABASE EDUTEC 
SET RECOVERY FULL
GO

