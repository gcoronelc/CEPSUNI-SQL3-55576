/*
Restaurar solo el backup de base de datos del día domingo
y el defirencial del martes.
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

-- Restaurar el diferencial del martes
RESTORE DATABASE perudev 
FROM PDDEVICE 
WITH File = 3, RECOVERY;
go

select * from perudev..test;
go



