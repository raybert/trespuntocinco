USE TresPuntoCinco
GO


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'ObtenerPlanificacion')
BEGIN
	DROP PROCEDURE ObtenerPlanificacion;
END 
GO

CREATE PROCEDURE ObtenerPlanificacion
	@FechaInicio DATE,
	@FechaFin DATE
AS
BEGIN
	
	SELECT dbo.DiaSemana(PLA.FechaInicio) AS NombreDia, 
		   COL.Nombre AS Conductor,
		   UNI.Placa AS Unidad
	  FROM Planificacion PLA
	  JOIN Colaborador COL
	    ON COL.IdCOlaborador = PLA.IdConductor
	  JOIN Unidad UNI
		ON UNI.IdUnidad = PLA.IdUnidad
	
	 WHERE PLA.FechaInicio BETWEEN @FechaInicio AND @FechaFin;
	
END
GO


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'ObtenerColorPorPlanificacion')
BEGIN
	DROP FUNCTION ObtenerColorPorPlanificacion;
END 
GO

/*CREATE FUNCTION dbo.ObtenerColorPorPlanificacion (@Fecha DATE, @IdUnidad INTEGER)
RETURNS VARCHAR(3)
AS
BEGIN
	
	--SET DATEFIRST 1;
	
	SELECT DATEPART(weekday, getdate()), DATEPART(month, 0), DATEPART(day, 0);
	
    RETURN ( CASE SUBSTRING(UPPER(DATENAME(dw, @Fecha)), 1, 3)
				WHEN 'SUN' THEN 'DOM'
				WHEN 'MON' THEN 'LUN'
				WHEN 'TUE' THEN 'MAR'
				WHEN 'WED' THEN 'MIE'
				WHEN 'THU' THEN 'JUE'
				WHEN 'FRI' THEN 'VIE'
				WHEN 'SAT' THEN 'SAB'
				ELSE ''
		     END );
END;
GO
*/

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'DiaSemana')
BEGIN
	DROP FUNCTION DiaSemana;
END 
GO

CREATE FUNCTION dbo.DiaSemana (@Fecha DATE)
RETURNS VARCHAR(3)
AS
BEGIN

    RETURN ( CASE SUBSTRING(UPPER(DATENAME(dw, @Fecha)), 1, 3)
				WHEN 'SUN' THEN 'DOM'
				WHEN 'MON' THEN 'LUN'
				WHEN 'TUE' THEN 'MAR'
				WHEN 'WED' THEN 'MIE'
				WHEN 'THU' THEN 'JUE'
				WHEN 'FRI' THEN 'VIE'
				WHEN 'SAT' THEN 'SAB'
				ELSE ''
		     END );
END;
GO


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'ObtenerPlanificacionPorSemana')
BEGIN
	DROP PROCEDURE ObtenerPlanificacionPorSemana;
END 
GO

CREATE PROCEDURE ObtenerPlanificacionPorSemana
	@FechaInicio DATE
AS

SET DATEFIRST 1;

DECLARE 
	@Lunes DATE = DATEADD(DAY, 1 - DATEPART(WEEKDAY, @FechaInicio), @FechaInicio),
	@Domingo DATE;

BEGIN

	SET @Domingo = DATEADD(DAY, 6, @Lunes);
	
		WITH TABLA0 AS (SELECT 1 AS number UNION ALL SELECT 1),
	TABLA1 AS (SELECT 1 AS number FROM TABLA0 t1, TABLA0 t2),
	TABLA2 AS (SELECT 1 AS number FROM TABLA1 t1, TABLA1 t2),
	TABLA3 AS (SELECT 1 AS number FROM TABLA2 t1, TABLA2 t2),
	Numeros(numero) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT 0)) - 1 AS number FROM TABLA3),
	PlanificacionTemporal
	AS
	(
		SELECT DATEADD(d, NUM.numero, PLA.FechaInicio) Fecha, 
			   PLA.IdPlanificacion, 
			   PLA.IdConductor, 
			   PLA.IdCliente, 
			   PLA.IdRuta, 
			   PLA.IdUnidad, 
			   PLA.IdUnidadMedida, 
			   PLA.Carga, 
			   PLA.FormaPago, 
			   PLA.Recorrido
		  FROM Planificacion PLA
		  JOIN Numeros NUM
			ON NUM.numero BETWEEN 0 AND DATEDIFF(d, PLA.FechaInicio, PLA.FechaFin)
		 WHERE PLA.FechaInicio BETWEEN @Lunes AND @Domingo
	),
	PlanificacionFinal
	AS
	(
		SELECT UNI.Placa AS Unidad, 
			   COL.Nombre AS Conductor, 
			   PLA.Fecha AS FechaInicio,
			   dbo.DiaSemana(PLA.Fecha) AS Dia, 
				'<span class="label label-info" style="width: 90%">' + 
				'<i class="icon-building"></i>&nbsp; ' + ISNULL(CLI.RazonSocial, '--') + '<br />' + 
				'<i class="icon-road"></i>&nbsp; ' + ISNULL(RUT.NombreRuta, '--') + ' <br />' +
				'<i class="icon-tags"></i>&nbsp; ' + ISNULL(UNM.Medida, '--') + ' <br />' + 
				'<i class="icon-th-large"></i>&nbsp; ' + ISNULL(PLA.Carga, '--') + ' <br /> </span>' AS Texto
		  FROM PlanificacionTemporal PLA
		  JOIN Colaborador COL
			ON PLA.IdConductor = COL.IdColaborador
		  JOIN Ruta RUT
			ON RUT.IdRuta = PLA.IdRuta
		  JOIN Unidad UNI
			ON UNI.IdUnidad = PLA.IdUnidad
		  JOIN Cliente CLI
			ON CLI.IdCliente = PLA.IdCliente
		  JOIN UnidadMedida UNM
			ON UNM.IdUnidadMedida = PLA.IdUnidadMedida
		 WHERE PLA.Fecha BETWEEN @Lunes AND @Domingo
	)

	SELECT Unidad, Conductor, 
		   MAX(CASE WHEN DIA = 'LUN' THEN Texto ELSE NULL END) AS LUN,
		   MAX(CASE WHEN DIA = 'MAR' THEN Texto ELSE NULL END) AS MAR, 
		   MAX(CASE WHEN DIA = 'MIE' THEN Texto ELSE NULL END) AS MIE, 
		   MAX(CASE WHEN DIA = 'JUE' THEN Texto ELSE NULL END) AS JUE, 
		   MAX(CASE WHEN DIA = 'VIE' THEN Texto ELSE NULL END) AS VIE,
		   MAX(CASE WHEN DIA = 'SAB' THEN Texto ELSE NULL END) AS SAB,
		   MAX(CASE WHEN DIA = 'DOM' THEN Texto ELSE NULL END) AS DOM
	  FROM PlanificacionFinal
	 GROUP BY Unidad, Conductor;

END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'ListarMantenimientosDesdeFecha')
BEGIN
	DROP PROCEDURE ListarMantenimientosDesdeFecha;
END 
GO


CREATE PROCEDURE ListarMantenimientosDesdeFecha
	@FechaInicial DATE
AS
BEGIN

	SELECT IdMantenimiento,
		   IdUnidad,
		   FechaInicio,
		   FechaFin
	  FROM Mantenimiento
	 WHERE FechaInicio >= @FechaInicial 
	 
END
GO


IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'ObtenerMantenimientos')
BEGIN
	DROP PROCEDURE ObtenerMantenimientos;
END 
GO


CREATE PROCEDURE ObtenerMantenimientos
	@FechaInicio DATE,
	@FechaFin DATE
AS
BEGIN
	
	SELECT MAN.IdMantenimiento,
		   MAN.IdUnidad,
		   UNI.Placa,
		   MAN.FechaInicio,
		   MAN.FechaFin
	  FROM Mantenimiento MAN
	  JOIN Unidad UNI
	    ON MAN.IdUnidad = UNI.IdUnidad
	 WHERE FechaInicio >= @FechaInicio
	   AND FechaFin <= @FechaFin;
		
END
GO



/*IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME = 'InsertarActualizarErrores')
BEGIN
	DROP PROCEDURE InsertarActualizarErrores;
END 
GO


CREATE PROCEDURE [Nombre]
	@[PARAMETROS] INTEGER
AS
BEGIN
	
END
GO
*/

