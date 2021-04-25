USE [NORTHWIND]
GO
/* 1. Usted es el administrador de la base de datos Northwind. Su cuenta está
formada por la inicial de su nombre y su apellido. Como administrador de
Northwind solo tiene acceso a la metadata, pudiendo crear objetos en la base de
datos según las indicaciones del diseñador de la aplicación.*/ 

CREATE ROLE [Administrador]
GO

CREATE LOGIN [CACC] 
WITH PASSWORD=N'admin', DEFAULT_DATABASE=[NORTHWIND]
GO

CREATE USER [CACC]   FOR LOGIN [CACC] 
GO

ALTER ROLE [Administrador] ADD MEMBER [CACC] 
GO

/* 2. Andrew Fuller (afuller) es el Vicepresidente, y además administra directamente
las ventas corporativas, por lo que puede efectuar tareas de mantenimiento de
empleados. También necesita obtener información acerca de los pedidos, pero él
no se encarga de ingresar los pedidos al sistema.*/ 

CREATE ROLE [ROL_VICEPRESIDENTE]
GO

GRANT SELECT,UPDATE,INSERT,DELETE ON EMPLOYEES TO [ROL_VICEPRESIDENTE]
GO

GRANT SELECT ON ORDERS TO [ROL_VICEPRESIDENTE]
GO

-- CREACION DE Afuller

USE [master]
GO

CREATE LOGIN [Afuller] 
WITH PASSWORD=N'Afuller', DEFAULT_DATABASE=[NORTHWIND]
GO

USE [NORTHWIND]
GO

CREATE USER [Afuller]  FOR LOGIN [Afuller]
GO

ALTER ROLE [ROL_VICEPRESIDENTE] ADD MEMBER [Afuller] 
GO

/* 3. Janet Leverling (jleverling) y Margaret Peacock (mpeacock) son Vendedores
Corporativos, reportan a Andrew Fuller, y deben registrar sus pedidos en el
sistema; también pueden eventualmente eliminar pedidos o corregir algún dato
de los mismos. */

CREATE ROLE [ROL_VENDEDORES_CORPORATIVOS]
GO

GRANT SELECT,UPDATE,INSERT,DELETE ON ORDERS TO [ROL_VENDEDORES_CORPORATIVOS]
GO

-- CREACION DE jleverling Y mpeacock

USE [master]
GO

CREATE LOGIN [jleverling] 
WITH PASSWORD=N'jleverling', DEFAULT_DATABASE=[NORTHWIND]
GO

CREATE LOGIN [mpeacock] 
WITH PASSWORD=N'mpeacock', DEFAULT_DATABASE=[NORTHWIND]
GO

USE [NORTHWIND]
GO

CREATE USER [jleverling]  FOR LOGIN [jleverling]
GO

ALTER ROLE [ROL_VENDEDORES_CORPORATIVOS] ADD MEMBER [jleverling] 
GO

CREATE USER [mpeacock]  FOR LOGIN [mpeacock]
GO

ALTER ROLE [ROL_VENDEDORES_CORPORATIVOS] ADD MEMBER [mpeacock] 
GO

/* 4. Steve Buchanan (sbuchanan) es el Gerente de Ventas, y como tal se encarga de
darle mantenimiento al catálogo de productos de la empresa.*/

CREATE ROLE [ROL_GERENTE_VENTAS]
GO
GRANT SELECT,UPDATE,INSERT,DELETE ON PRODUCTS TO [ROL_GERENTE_VENTAS]
GO

-- CREACION DE sbuchanan

USE [master]
GO
CREATE LOGIN [sbuchanan] 
WITH PASSWORD=N'sbuchanan', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO
CREATE USER [sbuchanan]  FOR LOGIN [sbuchanan]
GO
ALTER ROLE [ROL_GERENTE_VENTAS] ADD MEMBER [sbuchanan] 
GO

/* 5. Michael Suyama (msuyama), Robert King (rking), y Anne Dodsworth
(adodsworth) son Vendedores Locales, reportan a Steve Buchanan, y deben
registrar sus pedidos en el sistema. Una vez que han ingresado un pedido,
pueden corregir algún dato, pero no pueden eliminarlo. Quien se encarga de
eliminar algún pedido de los Vendedores Locales es el Gerente de Ventas. Los
Vendedores Locales pueden registrar a sus clientes nuevos, y modificar los datos
de algún cliente, pero no pueden eliminarlos del sistema.*/

CREATE ROLE [ROL_VENDEDORES_LOCALES]
GO
GRANT SELECT,UPDATE,INSERT ON ORDERS TO [ROL_VENDEDORES_LOCALES]
GO
GRANT SELECT,UPDATE,INSERT ON CUSTOMERS TO [ROL_VENDEDORES_LOCALES]
GO

-- CREACION DE msuyama,rking y adodsworth

USE [master]
GO
CREATE LOGIN [msuyama] 
WITH PASSWORD=N'msuyama', DEFAULT_DATABASE=[NORTHWIND]
GO
CREATE LOGIN [rking] 
WITH PASSWORD=N'rking', DEFAULT_DATABASE=[NORTHWIND]
GO
CREATE LOGIN [adodsworth] 
WITH PASSWORD=N'adodsworth', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO
CREATE USER [msuyama]  FOR LOGIN [msuyama]
GO
ALTER ROLE [ROL_VENDEDORES_LOCALES] ADD MEMBER [msuyama] 
GO
CREATE USER [rking]  FOR LOGIN [rking]
GO
ALTER ROLE [ROL_VENDEDORES_LOCALES] ADD MEMBER [rking] 
GO
CREATE USER [adodsworth]  FOR LOGIN [adodsworth]
GO
ALTER ROLE [ROL_VENDEDORES_LOCALES] ADD MEMBER [adodsworth] 
GO


/* 6. Laura Callahan (lcallahan) es la Administradora Interna y se encarga de la
gestión de las ventas en la tienda. Ella también le da mantenimiento al catálogo
de productos de la empresa. También es responsable del mantenimiento del
registro de transportistas.*/

CREATE ROLE [ROL_ADMINISTRADOR_INTERNA]
GO
GRANT SELECT,UPDATE,INSERT,DELETE ON ORDERS TO [ROL_ADMINISTRADOR_INTERNA]
GO
GRANT SELECT,UPDATE,INSERT,DELETE ON PRODUCTS TO [ROL_ADMINISTRADOR_INTERNA]
GO
GRANT SELECT,UPDATE,INSERT,DELETE ON SHIPPERS TO [ROL_ADMINISTRADOR_INTERNA]
GO

-- CREACION DE lcallahan

USE [master]
GO
CREATE LOGIN [lcallahan] 
WITH PASSWORD=N'lcallahan', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO
CREATE USER [lcallahan]  FOR LOGIN [lcallahan]
GO
ALTER ROLE [ROL_ADMINISTRADOR_INTERNA] ADD MEMBER [lcallahan] 
GO

/* 7. Ursula Pérez (uperez), George Smith (gsmith), Peter Vannels (pvannels), y Peter
Martinez (pmartinez) son Vendedores de Tienda. Ellos necesitan registrar sus pedidos en el sistema. 
También pueden eliminar pedidos o corregir datos del pedido.*/

CREATE ROLE [ROL_VENDEDORES_TIENDA]
GO
GRANT SELECT,UPDATE,INSERT,DELETE ON ORDERS TO [ROL_VENDEDORES_TIENDA]
GO

-- CREACION DE uperez,gsmith,pvannels y pmartinez

USE [master]
GO
CREATE LOGIN [uperez] 
WITH PASSWORD=N'uperez', DEFAULT_DATABASE=[NORTHWIND]
GO
CREATE LOGIN [gsmith] 
WITH PASSWORD=N'gsmith', DEFAULT_DATABASE=[NORTHWIND]
GO
CREATE LOGIN [pvannels] 
WITH PASSWORD=N'pvannels', DEFAULT_DATABASE=[NORTHWIND]
GO
CREATE LOGIN [pmartinez] 
WITH PASSWORD=N'pmartinez', DEFAULT_DATABASE=[NORTHWIND]
GO
USE [NORTHWIND]
GO

CREATE USER [uperez]  FOR LOGIN [uperez]
GO

ALTER ROLE [ROL_VENDEDORES_TIENDA] ADD MEMBER [uperez] 
GO

CREATE USER [gsmith]  FOR LOGIN [gsmith]
GO

ALTER ROLE [ROL_VENDEDORES_TIENDA] ADD MEMBER [gsmith] 
GO

CREATE USER [pvannels]  FOR LOGIN [pvannels]
GO

ALTER ROLE [ROL_VENDEDORES_TIENDA] ADD MEMBER [pvannels] 
GO

CREATE USER [pmartinez]  FOR LOGIN [pmartinez]
GO

ALTER ROLE [ROL_VENDEDORES_TIENDA] ADD MEMBER [pmartinez] 
GO
