/*
Restaurar solo el backup de base de datos del día domingo
y el defirencial del lunes.
*/


USE master;
go

drop database perudev;
go

restore headeronly from PDDEVICE 
go

-- Restaura la base de datos
RESTORE DATABASE perudev 
FROM PDDEVICE 
WITH File = 1, NORECOVERY;
go

-- Restaurar el diferencial
RESTORE DATABASE perudev 
FROM PDDEVICE 
WITH File = 2, RECOVERY;
go

select * from perudev..test;
go



