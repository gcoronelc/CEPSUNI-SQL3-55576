use northwind;
go


create procedure usp_backup
as
backup database northwind
to disk = 'e:\\northwind.bak'
with init;
go

use master;
go

exec northwind.dbo.usp_backup;
go
