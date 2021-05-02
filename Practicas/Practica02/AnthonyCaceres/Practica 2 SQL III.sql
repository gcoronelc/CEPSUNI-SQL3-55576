use master
go
create database Fashion;
go/* colocar la BD en modo de recuperacion*/alter database Fashion
set recovery FULL
go
select databasepropertyex( 'Fashion_store','Recovery' )
go

/* crear dispositivo de almacenamiento */

exec sp_addumpdevice 'disk', 'Fashion_store','C:\Backup\Fashion_store.bak'
go/* se verifica */select * from master.dbo.sysdevices
go

/* crear la tabla de prueba */
create table Fashion..test(
id Int Identity Primary Key,
dato varchar(30)
)
go

/*se cargan datos */

declare @k int
set @k = 0
while (@k < 600)
begin
begin tran
insert into Fashion..test(dato) values('Backup de Base de Datos')
commit tran
set @k = @k + 1
end
go

/* realizacion del backup domingo por la noche */

backup database Fashion
to Fashion
with
format,
name = 'BakfashionDomingo',
description = 'Backup de la base de datos completa, domingo'
go

/* verificacion del backup */

restore headeronly from Fashion
go

/* REALIZACION DEL PRIMER BACKUP DIFERENCIAL, en el enunciado nos dice que 
atiende solo hasta las 10 pm es por eso que se toma esa hora de referencia*/


--se realiza el backup

backup database Fashion
to Fashion
with
format,
name = 'Bakfashiondif01',
description = 'Primer backup diferencial dela base de datos'
go

-- Se verifica 

restore headeronly from Fashion
go

/*SE REALIZA EL SEGUNDO BACKUP DIFERENCIAL DEL DIA MARTES A LAS 10:00 PM */

declare @k int
set @k = 0
while (@k < 600)
begin
begin tran
insert into Fashion..test(dato) values('2do. Backup Diferencial,martes')
commit tran
set @k = @k + 1
end
go

/* Se realiza el backup */

backup database Fashion
to Fashion
with
differential,
name = 'Bakfashiondif02',
description = 'Segundo backup diferencial de la base de datos'
go
-- se verifica

restore headeronly from Fashion
go

/*Supongamos que ocurre un error el dia miercoles a las 11 am*/

declare @k int
set @k = 0
while (@k < 600)
begin
begin tran
insert into Fashion..test(dato) values('Que pasa con mis datos')
commit tran
set @k = @k + 1
end
go-- En ese momento se tiene que hacer una copia de respaldo backup log Fashion
to Fashion
with
no_truncate,
name = 'BakLog',
description = 'Backup del log Fashion.'
go-- se verificarestore headeronly from Fashion
go

-- Se elimina la BD FASHION

drop database Fashion


/* PROCESO DE RESTAURACIÓN */

use Fashion
select * from test

-- RESTAURAR PRIMERO LA BASE DE DATOS
USE master
RESTORE DATABASE Fashion
FROM Fashion
WITH NORECOVERY

--LIMPIEZA DEL LOG PARA RESTAURAR LOS ARCHIVOS Y QUE NO SE DUPLIQUEN
DBCC SHRINKFILE (Fashion_LOG)
GO
-- RESTAURAR DE UNA COPIA DE SEGURIDAD DIFERENCIAL DEL LUNES
USE master
RESTORE LOG Fashion
FROM Fashion
WITH FILE = 3, RECOVERYselect * from Fashion..testgo