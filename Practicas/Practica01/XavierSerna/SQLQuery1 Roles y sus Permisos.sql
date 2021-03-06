--CREACION DE ROLES Y PERMISOS--

USE [Northwind]
GO

CREATE ROLE [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Employees] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Customers] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Orders] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Order Details] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Products] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Categories] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Suppliers] TO [ROL_ADMINISTRADOR]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR]
GO

CREATE ROLE [ROL_VICEPRESIDENTE]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Employees] TO [ROL_VICEPRESIDENTE]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Orders] TO [ROL_VICEPRESIDENTE]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Order Details] TO [ROL_VICEPRESIDENTE]
GO

CREATE ROLE [ROL_VENDEDOR_CORPORATIVO]
GO
GRANT SELECT, INSERT ON [dbo].[Customers] TO [ROL_VENDEDOR_CORPORATIVO]
GO
GRANT INSERT, UPDATE, DELETE ON [dbo].[Orders] TO [ROL_VENDEDOR_CORPORATIVO]
GO
GRANT INSERT, UPDATE, DELETE ON [dbo].[Order Details] TO [ROL_VENDEDOR_CORPORATIVO]
GO
GRANT SELECT ON [dbo].[Products] TO [ROL_VENDEDOR_CORPORATIVO]
GO
GRANT SELECT ON [dbo].[Categories] TO [ROL_VENDEDOR_CORPORATIVO]
GO

CREATE ROLE [ROL_GERENTE_DE_VENTAS]
GO
GRANT SELECT, DELETE ON [dbo].[Orders] TO [ROL_GERENTE_DE_VENTAS]
GO
GRANT SELECT, DELETE ON [dbo].[Order Details] TO [ROL_GERENTE_DE_VENTAS]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Products] TO [ROL_GERENTE_DE_VENTAS]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Categories] TO [ROL_GERENTE_DE_VENTAS]
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[Suppliers] TO [ROL_GERENTE_DE_VENTAS]
GO

CREATE ROLE [ROL_VENDEDOR_LOCAL]
GO
GRANT SELECT, INSERT, UPDATE ON [dbo].[Customers] TO [ROL_VENDEDOR_LOCAL]
GO
GRANT INSERT, UPDATE ON [dbo].[Orders] TO [ROL_VENDEDOR_LOCAL]
GO
GRANT INSERT, UPDATE, DELETE ON [dbo].[Order Details] TO [ROL_VENDEDOR_LOCAL]
GO
GRANT SELECT ON [dbo].[Products] TO [ROL_VENDEDOR_LOCAL]
GO
GRANT SELECT ON [dbo].[Categories] TO [ROL_VENDEDOR_LOCAL]
GO

CREATE ROLE [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT ON [dbo].[Orders] TO [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT ON [dbo].[Order Details] TO [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT, INSERT, UPDATE ON [dbo].[Products] TO [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT, INSERT, UPDATE ON [dbo].[Categories] TO [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT, INSERT, UPDATE ON [dbo].[Suppliers] TO [ROL_ADMINISTRADOR_INTERNO]
GO
GRANT SELECT, INSERT, UPDATE ON [dbo].[Shippers] TO [ROL_ADMINISTRADOR_INTERNO]
GO

CREATE ROLE [ROL_VENDEDOR_DE_TIENDA]
GO
GRANT SELECT, INSERT ON [dbo].[Customers] TO [ROL_VENDEDOR_DE_TIENDA]
GO
GRANT INSERT, UPDATE, DELETE ON [dbo].[Orders] TO [ROL_VENDEDOR_DE_TIENDA]
GO
GRANT INSERT, UPDATE, DELETE ON [dbo].[Order Details] TO [ROL_VENDEDOR_DE_TIENDA]
GO
GRANT SELECT ON [dbo].[Products] TO [ROL_VENDEDOR_DE_TIENDA]
GO
GRANT SELECT ON [dbo].[Categories] TO [ROL_VENDEDOR_DE_TIENDA]
GO