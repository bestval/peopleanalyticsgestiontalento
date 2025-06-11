SELECT TOP (1000) [ID_Fichaje]
      ,[ID_Empleado]
      ,[Fecha_Hora]
      ,[Tipo]
      ,[Dispositivo]
  FROM [rrhh_database].[dbo].[Fichajes]


SELECT 
    ID_Empleado,
    CONVERT(date, Fecha_Hora) AS Fecha,
    MIN(CASE WHEN Tipo = 'Entrada' THEN CONVERT(time, Fecha_Hora) END) AS Hora_Entrada,
    MAX(CASE WHEN Tipo = 'Salida' THEN CONVERT(time, Fecha_Hora) END) AS Hora_Salida,
    Dispositivo,
    
    -- 10 y 20 minutos aleatorios
	CAST(RAND(CHECKSUM(NEWID())) * 11 AS INT) + 10 as Descanso


FROM 
    Fichajes
GROUP BY 
    ID_Empleado, 
    CONVERT(date, Fecha_Hora), 
    Dispositivo
ORDER BY 
    ID_Empleado, 
    Fecha;
