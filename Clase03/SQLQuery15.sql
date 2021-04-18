/*
El backup del log abarca todo, desde el bak full de la bd?
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

-- Restaurar el log del miercoles
RESTORE LOG perudev 
FROM PDDEVICE 
WITH FILE = 4, RECOVERY;
go


select * from perudev..test;
go
