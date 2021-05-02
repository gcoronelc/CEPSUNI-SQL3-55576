
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



select * 
into Curso5
from Curso
where 1=2;
go


select * from Curso5;
go


BULK INSERT dbo.Curso5
FROM 'D:\bcp\Curso-nat.Dat' 
WITH (DATAFILETYPE='native'); 
GO

select * from Curso5;
go



select * into Curso6
from Curso where 1=2;
go

INSERT INTO dbo.Curso6 
SELECT a.* 
FROM OPENROWSET( BULK 'D:\bcp\Curso_A.dat', FORMATFILE = 'D:\bcp\Curso.fmt') AS a;
go

select * from Curso6;
go


-- CONSULTAS DISTRIBUIDAS
-- ======================


sp_configure 'show advanced options', 1; 
go


RECONFIGURE; 
go


sp_configure 'Ad Hoc Distributed Queries', 1; 
go


RECONFIGURE;
go


SELECT a.* 
FROM OPENROWSET('SQLNCLI', 
		'Server=localhost;
		Trusted_Connection=yes;', 
		'SELECT * FROM EDUTEC.dbo.curso') AS a;
go


SELECT a.* 
FROM OPENROWSET('SQLNCLI', 
		'Server=localhost;userid=sa;password=sql', 
		'SELECT * FROM EDUTEC.dbo.curso') AS a;
go


