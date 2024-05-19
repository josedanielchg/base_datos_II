--------------------------------------------------------------------------------------------
-- Ganancia generada los fines de semana por cada tipo de habitacion discrimine por hotel --
--------------------------------------------------------------------------------------------

SELECT 
	fp.HotelID AS ID,
	dh.Name AS HotelName,
	dtr.Name AS RoomTypeName,
	SUM(fp.TotalRevenue) as WeekendRevenue
FROM fact_profits fp
	JOIN dim_time dt ON (fp.DateID = dt.DateID)
	JOIN dim_hotel dh ON (fp.HotelID = dh.HotelID)
	JOIN dim_typeroom dtr ON (fp.TypeRoomID = dtr.TypeRoomID)
WHERE dt.IsWeekend = 1
GROUP BY fp.TypeRoomID, fp.HotelID
ORDER BY fp.HotelID, dtr.Name;



-----------------------------------------------------------------------------------------------------
-- Cuantos dias un hotel dado por parametro solo estaba ocupado en menos del 50% agrupados por mes --
-----------------------------------------------------------------------------------------------------

USE hoteldw;

SET @hotelName = 'Hotel Aventura Tropical';

SELECT 
	fd.HotelID AS HotelID,
	dh.Name AS HotelName,
	dt.`Month`,
	dt.`Year`,
	COUNT(*) AS RoomCount
FROM fact_dailyoccupation fd
	JOIN dim_time dt ON (fd.DateID = dt.DateID)
	JOIN dim_hotel dh ON (dh.HotelID = fd.HotelID)
WHERE fd.PercentageOccupiedRooms > 0.5
	AND dh.Name = @hotelName
GROUP BY dt.`Month`, dt.`Year`, fd.HotelID;



---------------------------------------------------------
-- Promedio de días de estadia por mes para cada hotel --
---------------------------------------------------------




---------------------------------------------------------
-- Clientes que repiten estadía en un hotel de la cadena de hoteles, determinar cuanto tiempo pasa
-- para que regresen --
---------------------------------------------------------
