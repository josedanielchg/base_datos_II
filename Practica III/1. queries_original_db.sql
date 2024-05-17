--------------------------------------------------------------------------------------------
-- Ganancia generada los fines de semana por cada tipo de habitacion discrimine por hotel --
--------------------------------------------------------------------------------------------

-- Funcion para obtener fines de semana entre 2 fechas
DELIMITER $$
DROP FUNCTION IF EXISTS CountWeekends$$

CREATE FUNCTION CountWeekends(startDate DATE, endDate DATE)
RETURNS INT
NO SQL
BEGIN
	DECLARE weekendCount INT DEFAULT 0;
	DECLARE currentDate DATE;
	
	SET currentDate = DATE_ADD(startDate, INTERVAL 1 DAY);
	WHILE currentDate <= endDate DO
		IF DAYOFWEEK(currentDate) IN (1, 7) THEN  -- 1 = Sunday, 7 = Saturday
			SET weekendCount = weekendCount + 1;
		END IF;
		SET currentDate = DATE_ADD(currentDate, INTERVAL 1 DAY);
	END WHILE;
	
	RETURN weekendCount;
END$$

DELIMITER ;

-- Query que extrae la informacion solicitada
SELECT 
	h.ID,
	h.Name AS HotelName,
	rt.Name AS RoomTypeName,
	SUM(b.TotalPrice / DATEDIFF(b.CheckoutDate, b.CheckinDate) * CountWeekends(b.CheckinDate, b.CheckoutDate)) AS WeekendRevenue
FROM Booking b
    JOIN Room r ON b.RoomNumber = r.ID
    JOIN Hotel h ON r.HotelID = h.ID
    JOIN RoomType rt ON r.TypeID = rt.ID
GROUP BY 
    h.ID, rt.ID
ORDER BY 
    WeekendRevenue DESC;



-----------------------------------------------------------------------------------------------------
-- Cuantos dias un hotel dado por parametro solo estaba ocupado en menos del 50% agrupados por mes --
-----------------------------------------------------------------------------------------------------
DELIMITER $$

DROP PROCEDURE IF EXISTS DaysOver50PercOccupied$$

CREATE PROCEDURE DaysOver50PercOccupied(IN hotelName VARCHAR(255))
BEGIN
    DECLARE vHotelID INT;
    DECLARE vTotalRooms INT;
    DECLARE vCurrentYear INT;
    DECLARE vCurrentMonth INT;
    DECLARE vDaysOver50 INT;
    DECLARE vDayCount INT;
    DECLARE vCurrentDay INT;
    DECLARE vDate DATE;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT DISTINCT YEAR(CheckinDate) FROM booking b JOIN room r ON (r.ID = b.RoomNumber) WHERE r.HotelID = vHotelID;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Crear tabla temporal para almacenar los resultados
    DROP TEMPORARY TABLE IF EXISTS TempResults;
    CREATE TEMPORARY TABLE TempResults (
        HotelID INT,
        HotelName VARCHAR(255),
        Year INT,
        Month INT,
        DaysOver50 INT
    );

    -- Paso 2: Buscar ID del Hotel
    SELECT ID INTO vHotelID FROM hotel WHERE Name = hotelName LIMIT 1;

    -- Paso 5: Número total de habitaciones
    SELECT COUNT(*) INTO vTotalRooms FROM room WHERE HotelID = vHotelID;

    -- Comenzar iteración por año
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO vCurrentYear;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SET vCurrentMonth = 1;

        WHILE vCurrentMonth <= 12 DO
            SET vDaysOver50 = 0;
            SET vCurrentDay = 1;

            -- Paso 7 y 8: Iterar por día del mes
            WHILE vCurrentDay <= DAYOFMONTH(LAST_DAY(CONCAT(vCurrentYear, '-', vCurrentMonth, '-01'))) DO
                SET vDate = CONCAT(vCurrentYear, '-', vCurrentMonth, '-', vCurrentDay);

                SELECT COUNT(*) INTO vDayCount FROM booking b 
                    JOIN room r ON (r.ID = b.RoomNumber)
                WHERE r.HotelID = vHotelID
                AND vDate BETWEEN b.CheckinDate AND b.CheckoutDate;

                IF (vDayCount / vTotalRooms) > 0.5 THEN
                    SET vDaysOver50 = vDaysOver50 + 1;
                END IF;

                SET vCurrentDay = vCurrentDay + 1;
            END WHILE;

            -- Almacenar resultados en tabla temporal
            INSERT INTO TempResults (HotelID, HotelName, Year, Month, DaysOver50)
            VALUES (vHotelID, hotelName, vCurrentYear, vCurrentMonth, vDaysOver50);

            SET vCurrentMonth = vCurrentMonth + 1;
        END WHILE;
    END LOOP;

    CLOSE cur;

    -- Devolver resultados desde la tabla temporal
    SELECT * FROM TempResults;
END$$

DELIMITER ;

-- Ejemplo de Call
CALL DaysOver50PercOccupied('Hotel Aventura Tropical');


---------------------------------------------------------
-- Promedio de días de estadia por mes para cada hotel --
---------------------------------------------------------

SELECT 
    h.ID AS HotelID,
    h.Name AS HotelName,
    YEAR(b.CheckinDate) AS Year,
    MONTH(b.CheckinDate) AS Month,
    AVG(DATEDIFF(b.CheckoutDate, b.CheckinDate)) AS AverageStayDays
FROM booking b
    JOIN room r ON b.RoomNumber = r.ID
    JOIN hotel h ON r.HotelID = h.ID
GROUP BY 
    h.ID, h.Name, YEAR(b.CheckinDate), MONTH(b.CheckinDate);


---------------------------------------------------------
-- Clientes que repiten estadía en un hotel de la cadena de hoteles, determinar cuanto tiempo pasa
-- para que regresen --
---------------------------------------------------------

SELECT 
	b1.GuestID,
	r1.HotelID,
	h.Name AS HotelName,
	MIN(b1.checkOutDate) AS FirstCheckout,
	b2.CheckinDate AS NextCheckin,
	DATEDIFF(b2.CheckinDate, b1.checkOutDate) AS DaysBetweenVisits
FROM booking b1
    JOIN room r1 ON (r1.ID = b1.RoomNumber)
    JOIN booking b2 ON (b1.GuestID = b2.GuestID AND b1.checkOutDate < b2.CheckinDate)
    JOIN room r2 ON (r2.ID = b2.RoomNumber AND r1.HotelID = r2.HotelID)
    JOIN hotel h ON r1.HotelID = h.ID
GROUP BY 
    b1.GuestID, r1.HotelID, b1.checkOutDate, b2.CheckinDate, b2.ID
HAVING 
    COUNT(b2.CheckinDate) = 1 AND
	 b2.CheckinDate = (
	 	SELECT b3.CheckinDate
	 	FROM booking b3
	 	JOIN room r3 ON (r3.ID = b3.RoomNumber AND r1.HotelID = r3.HotelID)
	 	WHERE b1.checkOutDate < b3.CheckinDate
	 	ORDER BY b3.CheckinDate
	 	LIMIT 1
	 ) 
ORDER BY 
    b1.GuestID, r1.HotelID, FirstCheckout;