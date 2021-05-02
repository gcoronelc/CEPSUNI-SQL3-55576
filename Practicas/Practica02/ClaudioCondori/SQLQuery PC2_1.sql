/*IMPLEMENTACI�N DE NUESTRA ESTRATEGIA DE COPIA DE SEGURIDAD*/

-----------------------------------------
-- SUPONIENDO QUE INICIAMOS EL LUNES Y --
--TENIENDO YA CREADO UN BACKUP COMPLETO--
-----------------------------------------

--INGRESAMOS DATOS DEL D�A LUNES
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Lunes') 
commit tran 
go

--HACEMOS UN BACKUP DIFERENCIAL AL FINAL DEL D�A
DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif01', 
	description = 'Backup DIFERENCIAL Lunes' 
go

--COMPROBAMOS
select * from FASHION_STORE_0..test;
go

restore headeronly from FS_DEVICE 
go

-----------------------------------------
--REPETIMOS EL MISMO PROCEDIMIENTO PARA--
-- LOS D�AS SIGUIENTES HASTA EL S�BADO --
-----------------------------------------

--MARTES--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Martes') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif02', 
	description = 'Backup DIFERENCIAL Martes' 
go

--MI�RCOLES--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Mi�rcoles') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif03', 
	description = 'Backup DIFERENCIAL Mi�rcoles' 
go

--JUEVES--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Jueves') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif04', 
	description = 'Backup DIFERENCIAL Jueves' 
go

--VIERNES--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Viernes') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif05', 
	description = 'Backup DIFERENCIAL Viernes' 
go

--S�BADO--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos S�bado') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif06', 
	description = 'Backup DIFERENCIAL S�bado' 
go

--COMPROBANDO DATOS:
select * from FASHION_STORE_0..test;
go

restore headeronly from FS_DEVICE 
go

---------------------------------------------
--EL D�A DOMINGO HAREMOS UN BACKUP COMPLETO--
--EL CUAL ELIMINARA A LOS BAK DIFERENCIALES--
-- QUE FUIMOS CREANDO CADA D�A HASTA AHORA --
---------------------------------------------

--DOMINGO--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Domingo') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	format, 
	name = 'BakBD', 
	description = 'BACKUP COMPLETO' 
go

--COMPROBANDO DATOS:
select * from FASHION_STORE_0..test;
go

restore headeronly from FS_DEVICE 
go

/*REPETIMOS EL PROCESO CADA SEMANA*/