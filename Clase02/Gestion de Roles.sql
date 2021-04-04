USE [EUREKABANK]
GO
CREATE ROLE [ROL_VENTAS]
GO


/* ROL_VENTAS */
/*
	- Registra nuevos clientes.
	- Crea nuevas cuentas.
	- Registra el primer depósito de apertura
*/


-- Que permisos debe tener
/*
- Cliente: SELECT (x), INSERT (x), UPDATE (), DELETE ()
- Sucursal: SELECT (x), INSERT (), UPDATE (x), DELETE ()
- Cuenta: SELECT (), INSERT (x), UPDATE (), DELETE ()
- Movimiento: SELECT (), INSERT (x), UPDATE (), DELETE ()
- CostoMovimiento: SELECT (x), INSERT (), UPDATE (), DELETE ()
- Moneda: SELECT (x), INSERT (), UPDATE (), DELETE ()
- TipoMovimiento: SELECT (x), INSERT (), UPDATE (), DELETE ()
*/

use [EUREKABANK]
GO

GRANT SELECT, INSERT ON [dbo].[Cliente] TO [ROL_VENTAS]
GO
GRANT SELECT, UPDATE ON [dbo].[Sucursal] TO [ROL_VENTAS]
GO
GRANT INSERT ON [dbo].[Cuenta] TO [ROL_VENTAS]
GO
GRANT INSERT ON [dbo].[Movimiento] TO [ROL_VENTAS]
GO
GRANT SELECT ON [dbo].[CostoMovimiento] TO [ROL_VENTAS]
GO
GRANT SELECT ON [dbo].[Moneda] TO [ROL_VENTAS]
GO
GRANT SELECT ON [dbo].[TipoMovimiento] TO [ROL_VENTAS]
GO

-- CREACION DE PEDRO

USE [master]
GO

CREATE LOGIN [pedro] 
WITH PASSWORD=N'admin', DEFAULT_DATABASE=[EUREKABANK]
GO

USE [EUREKABANK]
GO

CREATE USER [pedro] FOR LOGIN [pedro]
GO

ALTER ROLE [ROL_VENTAS] ADD MEMBER [pedro]
GO

