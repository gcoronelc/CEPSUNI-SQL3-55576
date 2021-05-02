CREATE DATABASE [NORWIN]
ON  PRIMARY 
(
	NAME = N'NORWIN', 
	FILENAME = N'D:\AA_SQL III propio\Clases 2 yo\PC1\BD_ALFA.mdf' , 
	SIZE = 8192KB , 
	FILEGROWTH = 65536KB 
)
LOG ON 
( 
	NAME = N'NORWIN_log', 
	FILENAME = N'D:\AA_SQL III propio\Clases 2 yo\PC1\BD_ALFA_log.ldf' , 
	SIZE = 8192KB , 
	FILEGROWTH = 65536KB 
)
GO


/* 1) TENGO ACCESO A LA METADATA CREAR Y DISE�AR OBJETOS*/

CREATE ROLE [administrador]
GO
CREATE LOGIN [CCV] 
WITH PASSWORD=N'1234', DEFAULT_DATABASE=[NORWIN]
GO
CREATE USER [CCV] FOR LOGIN [CCV]
GO
ALTER ROLE [administrador] ADD MEMBER [CCV]
GO
-------

--CREAR USER, ROLE fuller--
USE [master]
go
CREATE LOGIN [fuller] 
WITH PASSWORD=N'fuller', DEFAULT_DATABASE=[NORWIN]
GO
use [NORWIN]
go
CREATE USER [fuller] FOR LOGIN [fuller]
GO
ALTER ROLE [ROL_VICEPRESI] ADD MEMBER [fuller]
GO

/*FULLER VICEPRESIDENTE ADMINISTRA VENTAS CORP, MANTENIM 
DE EMPLEADOS, INFO DE PEDIDOS, NO INGRESA PEDIDOS*/
CREATE ROLE [ROL_VICEPRESI]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON EMPLEADOS TO [ROL_VICEPRESI]
GO
GRANT SELECT ON ORDENES TO [ROL_VICEPRESI]
GO

--CREAR USER, ROLE lever y pea--
CREATE ROLE [ROL_VENTAS_CORP]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON ORDENES TO [ROL_VENTAS_CORP]
GO
--
USE [master]
go
CREATE LOGIN [lever] 
WITH PASSWORD=N'lever', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [pea] 
WITH PASSWORD=N'pea', DEFAULT_DATABASE=[NORWIN]
GO
use [NORWIN]
go
CREATE USER [lever] FOR LOGIN [lever]
GO
ALTER ROLE [ROL_VENTAS_CORP] ADD MEMBER [lever]
GO

CREATE USER [pea] FOR LOGIN [pea]
GO
ALTER ROLE [ROL_VENTAS_CORP] ADD MEMBER [pea]
GO

--CREAR ROLE, USER Buchanan--
CREATE ROLE [ROL_GER_VENTAS]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON PRODUCTOS TO [ROL_GER_VENTAS]
GO
--
USE [master]
go
CREATE LOGIN [buchanan] 
WITH PASSWORD=N'buchanan', DEFAULT_DATABASE=[NORWIN]
GO
use [NORWIN]
go
CREATE USER [buchanan] FOR LOGIN [buchanan]
GO
ALTER ROLE [ROL_GER_VENTAS] ADD MEMBER [buchanan]
GO

------VENDEDORES LOCALES--------

CREATE ROLE [ROL_VENTAS_LOC]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON ORDENES TO [ROL_VENTAS_LOC]
GO
GRANT SELECT, UPDATE, INSERT, DELETE ON CLIENTES TO [ROL_VENTAS_LOC]
GO
---CREAR ROLE, USER suyama, king y dodswoth--
USE [master]
go
CREATE LOGIN [suyama] 
WITH PASSWORD=N'suyama', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [king] 
WITH PASSWORD=N'king', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [dod] 
WITH PASSWORD=N'dod', DEFAULT_DATABASE=[NORWIN]
GO
use [NORWIN]
go
CREATE USER [suyama] FOR LOGIN [suyama]
GO
ALTER ROLE [ROL_VENTAS_LOC] ADD MEMBER [suyama]
GO
CREATE USER [king] FOR LOGIN [king]
GO
ALTER ROLE [ROL_VENTAS_LOC] ADD MEMBER [king]
GO
CREATE USER [dod] FOR LOGIN [dod]
GO
ALTER ROLE [ROL_VENTAS_LOC] ADD MEMBER [dod]
GO

---ADM INTERNO---

CREATE ROLE [ROL_ADMI_INTERNO]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON ORDENES TO [ROL_ADMI_INTERNO]
GO
GRANT SELECT, UPDATE, INSERT, DELETE ON PRODUCTOS TO [ROL_ADMI_INTERNO]
GO
GRANT SELECT, UPDATE, INSERT, DELETE ON ENVIOS TO [ROL_ADMI_INTERNO]
GO

-----CREAR ROLE, USER callahan-----
USE [master]
go
CREATE LOGIN [calla] 
WITH PASSWORD=N'calla', DEFAULT_DATABASE=[NORWIN]
GO
use [NORWIN]
go
CREATE USER [calla] FOR LOGIN [calla]
GO
ALTER ROLE [ROL_ADMI_INTERNO] ADD MEMBER [calla]
GO

----ROL_VENTAS_TIENDA----
CREATE ROLE [ROL_VENTAS_TIENDA]
go
GRANT SELECT, UPDATE, INSERT, DELETE ON ORDENES TO [ROL_VENTAS_TIENDA]
GO

-----CREAR ROLE, USER Perez, Smith, Vanels y Martinez-----
USE [master]
go
CREATE LOGIN [perez] 
WITH PASSWORD=N'perez', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [smith] 
WITH PASSWORD=N'smith', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [vane] 
WITH PASSWORD=N'vane', DEFAULT_DATABASE=[NORWIN]
GO
CREATE LOGIN [marti] 
WITH PASSWORD=N'marti', DEFAULT_DATABASE=[NORWIN]
GO
--
use [NORWIN]
go
CREATE USER [perez] FOR LOGIN [perez]
GO
ALTER ROLE [ROL_VENTAS_TIENDA] ADD MEMBER [perez]
GO
CREATE USER [smith] FOR LOGIN [smith]
GO
ALTER ROLE [ROL_VENTAS_TIENDA] ADD MEMBER [smith]
GO
CREATE USER [vane] FOR LOGIN [vane]
GO
ALTER ROLE [ROL_VENTAS_TIENDA] ADD MEMBER [vane]
GO
CREATE USER [marti] FOR LOGIN [marti]
GO
ALTER ROLE [ROL_VENTAS_TIENDA] ADD MEMBER [marti]
GO