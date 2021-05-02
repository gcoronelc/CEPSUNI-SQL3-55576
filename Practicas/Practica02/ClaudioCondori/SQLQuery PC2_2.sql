/*CON ESTE SCRIPT SIMULAREMOS LA PERDIDA DE NUESTRA
BD EN UN DÍA JUEVES Y DEMOSTRAREMOS COMO RECUPERARLA*/

--REHACEMOS LA BD FASHION_STORE PARA LA SIMULACION
use master 
drop database FASHION_STORE_0
create database FASHION_STORE_0
alter database FASHION_STORE_0 set recovery FULL
GO

CREATE TABLE FASHION_STORE_0..Test( dato varchar(30) ) 
BEGIN TRAN
insert into FASHION_STORE_0..test(dato) values('DATOS INICIALES') 
COMMIT TRAN
GO

---------------------------
--APLICAMOS LA ESTRATEGIA--
-- DE COPIAS DE SEGURIDAD--
---------------------------

USE FASHION_STORE_0
GO

backup database FASHION_STORE_0 to FS_DEVICE 
with format, name = 'BakBD', description = 'Backup COMPLETO' 
go

--lunes
begin tran 
insert into FASHION_STORE_0..test(dato) values('Datos Lunes') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0 to FS_DEVICE 
with differential, name = 'BakDif01', description = 'Backup DIFERENCIAL Lunes' 
go

--martes
begin tran 
insert into FASHION_STORE_0..test(dato) values('Datos Martes') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0 to FS_DEVICE 
with differential, name = 'BakDif02', description = 'Backup DIFERENCIAL Martes' 
go

--miercoles
begin tran 
insert into FASHION_STORE_0..test(dato) values('Datos Miercoles') 
commit tran 
go

DBCC SHRINKFILE (FASHION_STORE_0_log)
GO

backup database FASHION_STORE_0 to FS_DEVICE 
with differential, name = 'BakDif03', description = 'Backup DIFERENCIAL Miercoles' 
go

--jueves
begin tran 
insert into FASHION_STORE_0..test(dato) values('Datos Jueves') 
commit tran 
go

backup log FASHION_STORE_0 to FS_DEVICE 
with no_truncate, name = 'BakLog', description = 'Backup del log.' 
go

---------------------------------
--SIMULAMOS LA PERDIDA DE LA BD--
---------------------------------

USE master;
drop database FASHION_STORE_0;
go

-------------------------------------
--PROCEDEMOS A RESTAURAR NUESTRA BD--
-------------------------------------

--COMPROBAMOS NUESTROS BACKUPS
restore headeronly from FS_DEVICE 
go

--restauramos el último backup completo
RESTORE DATABASE FASHION_STORE_0
FROM FS_DEVICE 
WITH File = 1, NORECOVERY;
go

--restauramos el último backup diferencial
--(día miercoles position 5)
RESTORE DATABASE FASHION_STORE_0 
FROM FS_DEVICE 
WITH File = 5, NORECOVERY;
go

--restauramos el último log
RESTORE LOG FASHION_STORE_0 
FROM FS_DEVICE 
WITH FILE = 5, RECOVERY;
go

--------------------------------------------------
--COMPROBAMOS LOS DATOS DE NUESTRA BD RESTAURADA--
--------------------------------------------------
select * from FASHION_STORE_0..test;
go
