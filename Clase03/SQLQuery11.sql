
USE master;
go


EXEC sp_addumpdevice 'disk', 'mybackupfile', 'E:\Backup\MyBackupFile.bak'
GO

select * from master.dbo.sysdevices 
go


BACKUP DATABASE EDUTEC
TO DISK = 'E:\BACKUP\BAK-EDUTEC.bak';
GO

RESTORE VERIFYONLY FROM DISK = 'E:\BACKUP\BAK-EDUTEC.bak';
GO


BACKUP DATABASE Northwind TO mybackupfile;
GO

UPDATE NORTHWIND..Products
SET UnitPrice = UnitPrice * 1.3;


BACKUP DATABASE Northwind TO mybackupfile 
WITH DIFFERENTIAL,
	name = 'DIFERENCIAL',
	description = 'Segundo backup diferencial de la base de datos';
GO


RESTORE HEADERONLY FROM mybackupfile;
GO

BACKUP LOG Northwind to mybackupfile
WITH name = 'LOG',
	 description = 'Backup del log';
GO


RESTORE HEADERONLY FROM mybackupfile;
GO

