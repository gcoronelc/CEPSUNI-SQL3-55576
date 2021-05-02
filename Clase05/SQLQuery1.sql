
select * 
into Curso4
from Curso
where 1=2;
go

select * from curso4;
go

bulk insert EduTec.dbo.Curso4 
from 'D:\bcp\Curso_A.dat' 
with (formatfile='D:\bcp\Curso.xml');
go

select * from curso4;
go


select NomProfesor, ApeProfesor 
into dbo.Profesor2 
from dbo.Profesor 
where 1=2;
go

select * from Profesor2;
go


bulk insert dbo.Profesor2 
from 'D:\bcp\Profesores.txt' 
with (fieldterminator='\t',rowterminator='\n'); 
go


select * from Profesor2;
go




