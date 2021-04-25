

EXEC msdb.dbo.sp_send_dbmail 
@profile_name = 'PERFIL01', 
@recipients = 'egcc.uni@gmail.com', 
@body = 'Enviando de correo desde con procedimiento desde una tarea.', 
@subject = 'Prueba Correo SP'; 
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