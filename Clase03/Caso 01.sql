/*
Restaurar solo el backup de base de datos del día domingo.
*/


USE master;
go

drop database perudev;
go

restore headeronly from PDDEVICE 
go

RESTORE DATABASE perudev 
FROM PDDEVICE 
WITH File = 1, RECOVERY;
go

select * from perudev..test;
go



