/*IMPLEMENTACIÓN DE NUESTRA ESTRATEGIA DE COPIA DE SEGURIDAD*/

-----------------------------------------
-- SUPONIENDO QUE INICIAMOS EL LUNES Y --
--TENIENDO YA CREADO UN BACKUP COMPLETO--
-----------------------------------------

--INGRESAMOS DATOS DEL DÍA LUNES
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Lunes') 
commit tran 
go

--HACEMOS UN BACKUP DIFERENCIAL AL FINAL DEL DÍA
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
-- LOS DÍAS SIGUIENTES HASTA EL SÁBADO --
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

--MIÉRCOLES--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Miércoles') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif03', 
	description = 'Backup DIFERENCIAL Miércoles' 
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

--SÁBADO--
begin tran 
insert into FASHION_STORE_0..test(dato) 
values('Datos Sábado') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	differential, 
	name = 'BakDif06', 
	description = 'Backup DIFERENCIAL Sábado' 
go

--COMPROBANDO DATOS:
select * from FASHION_STORE_0..test;
go

restore headeronly from FS_DEVICE 
go

---------------------------------------------
--EL DÍA DOMINGO HAREMOS UN BACKUP COMPLETO--
--EL CUAL ELIMINARA A LOS BAK DIFERENCIALES--
-- QUE FUIMOS CREANDO CADA DÍA HASTA AHORA --
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