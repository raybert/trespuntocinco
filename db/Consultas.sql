--SELECT * FROM Planificacion
--INSERT INTO  Planificacion (Fecha, IdConductor, IdCliente, IdRuta, IdUnidad, IdUnidadMedida) 
--	VALUES (GETDATE(), 2, 2, 2, 2, 2)


SELECT PLA.Fecha, 
	   COL.Nombre + ' ' + COL.Apellidos AS Conductor,
	   CLI.RazonSocial AS Cliente,
	   RUT.NombreRuta AS Ruta,
	   UNI.Placa AS Unidad,
	   MED.Medida AS UnidadMedida
  FROM Planificacion PLA
  JOIN Colaborador COL
    ON PLA.IdConductor = COL.IdColaborador
  JOIN Cliente CLI
    ON PLA.IdCliente = CLI.IdCliente 
  JOIN Ruta RUT
    ON PLA.IdRuta = RUT.IdRuta
  JOIN Unidad UNI
    ON PLA.IdUnidad = UNI.IdUnidad
  JOIN UnidadMedida MED
    ON PLA.IdUnidadMedida = MED.IdUnidadMedida
 WHERE Fecha BETWEEN GETDATE() - 2 AND GETDATE() + 2
 
 
INSERT INTO Capacitacion
 SELECT COL.IdColaborador AS Colaborador,
		NEWID() AS Capacitacion,
		GETDATE() + ROUND(((1000 - 10 -1) * RAND() + 10), 0) AS Fecha,
		NEWID() AS Institucion
   FROM Colaborador COL
---	 ON CAP.Colaborador = COL.IdColaborador
 
 
 
---- Create the variables for the random number generation
DECLARE @Random INT;
DECLARE @Upper INT;
DECLARE @Lower INT

---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 999 ---- The highest random number
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
SELECT @Random


SELECT RAND( (DATEPART(mm, GETDATE()) * 100000 )
+ (DATEPART(ss, GETDATE()) * 1000 )
+ DATEPART(ms, GETDATE()) )

Method 3 : Random Numbers Quick Scripts
---- random float from 0 up to 20 - [0, 20)
SELECT 20*RAND()

SELECT * FROM Capacitacion