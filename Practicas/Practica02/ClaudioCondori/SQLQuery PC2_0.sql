/*CON ESTE SCRIPT CREAREMOS LA BD,
EL DISPOSITIVO DE ALMACENAMIENTO Y
LA PRIMERA COPIA DE SEGURIDAD COMPLETA*/

----------------------------
--CREANDO LA BASE DE DATOS--
--FASHION_STORE_X         --
----------------------------

USE master 
GO

drop database FASHION_STORE_0; --elimina la BD del mismo nombre, si existiera
GO

create database FASHION_STORE_0; --crea la BD
GO

alter database FASHION_STORE_0
set recovery FULL --establece el modo de recuperacíon a FULL (el más seguro)
GO

USE FASHION_STORE_0
GO

CREATE TABLE FASHION_STORE_0..Test( 
	dato varchar(30) 
) 
GO

BEGIN TRAN
insert into FASHION_STORE_0..test(dato) 
values('DATOS INICIALES') 
COMMIT TRAN
GO

select * from FASHION_STORE_0..test;
GO

-----------------------------------
--CREANDO EL DISPOSITIVO DE COPIA--
--DE SEGURIDAD PARA FASHION STORE--
-----------------------------------

exec sp_dropdevice 'FS_DEVICE' --elimina el device del mismo nombre, si existiera
go

exec sp_addumpdevice 'disk', 'FS_DEVICE', 'D:\Backup\FS_Device.bak' --crea el device
go

select * from master.dbo.sysdevices --muestra todos los device existentes
go

---------------------
--CREANDO EL PRIMER--
--BACKUP COMPLETO  --
---------------------

backup database FASHION_STORE_0
to FS_DEVICE 
with 
	format, 
	name = 'BakBD', 
	description = 'Backup COMPLETO' 
go

restore headeronly from FS_DEVICE 
go