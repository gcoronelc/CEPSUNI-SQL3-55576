

EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL01', 
@recipients = 'xav13soul@gmail.com;sebastiansolismiranda@gmail.com;claudiocondori03@gmail.com', 
@body = 'Enviando de correo desde SQL Server cpn procedimiento.', 
@subject = 'Prueba 03 - SP'; 
GO


EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL01', 
@recipients = 'xav13soul@gmail.com;sebastiansolismiranda@gmail.com;claudiocondori03@gmail.com',  
@query = 'SELECT * FROM Northwind.dbo.Customers', 
@subject = 'Listado Clientes', 
@attach_query_result_as_file = 1; 
GO



DELETE FROM msdb.dbo.sysmail_event_log; 
GO