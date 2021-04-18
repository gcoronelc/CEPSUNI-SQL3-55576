-- Paso 1

use master 
go

drop database perudev;
go

create database perudev; 
go

alter database perudev 
set recovery FULL 
go 

select databasepropertyex( 'perudev','Recovery' ) 
go

use perudev;
go

-- Paso 2

exec sp_dropdevice 'PDDEVICE'
go

exec sp_addumpdevice 'disk', 'PDDEVICE', 'D:\Backup\PDDevice.bak' 
go

select * from master.dbo.sysdevices 
go


-- Paso 3

create table perudev..test( 
	id Int Identity Primary Key, 
	dato varchar(30) 
) 
go


declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) 
	values('Backup de Base de Datos') 
	commit tran 
	set @k = @k + 1 
end 
go


select * from perudev..test;
go


-- 4 REALIZAR EL BACKUP DE LA BASE DE BATOS


backup database perudev 
to PDDEVICE 
with 
	format, 
	name = 'BakBD', 
	description = 'Backup de la base de datos completa' 
go

restore headeronly from PDDEVICE 
go


-- 5 REALIZAR UN PRIMER BACKUP DIFERENCIAL

-- Datos del lunes

declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) 
	values('Datos del lunes') 
	commit tran 
	set @k = @k + 1 
end 
go

-- Backup diferencial del lunes

DBCC SHRINKFILE (perudev_LOG)
GO

backup database perudev 
to PDDEVICE 
with 
	differential, 
	name = 'BakDif01', 
	description = 'Backup diferencial del lunes' 
go

restore headeronly from PDDEVICE 
go


-- 6 REALIZAR UN SEGUNDO BACKUP DIFERENCIAL

-- Datos del martes

declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) 
	values('Datos del martes') 
	commit tran 
	set @k = @k + 1 
end 
go

-- Backup diferencial del martes

DBCC SHRINKFILE (perudev_LOG)
GO

backup database perudev 
to PDDEVICE 
with 
	differential, 
	name = 'BakDif02', 
	description = 'Backup diferencial del martes' 
go

restore headeronly from PDDEVICE 
go


-- 7 ERROR EN LA BASE DE DATOS

-- Datos del miercoles por la mañana

declare @k int 
set @k = 0 
while (@k < 100) 
begin 
	begin tran 
	insert into perudev..test(dato) 
	values('Datos del miercoles') 
	commit tran 
	set @k = @k + 1 
end 
go


select * from perudev..test;
go

-- backup del log

backup log perudev 
to PDDEVICE 
with 
	no_truncate, 
	name = 'BakLog', 
	description = 'Backup del log.' 
go

restore headeronly from PDDEVICE 
go


