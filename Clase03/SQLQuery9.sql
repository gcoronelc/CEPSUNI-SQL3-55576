
USE master;
GO

EXEC sp_addumpdevice 'disk', 'mydevice', 'D:\Backup\MyDevice2021.bak';
go

select * from master.dbo.sysdevices;
go

BACKUP DATABASE [EUREKABANK] TO  mydevice; 
GO

BACKUP DATABASE NORTHWIND 
TO  mydevice
WITH INIT; 
GO

RESTORE DATABASE EUREKABANK 
FROM mydevice WITH FILE = 2;
GO

restore headeronly from mydevice;
go

restore VERIFYONLY from mydevice;
go
