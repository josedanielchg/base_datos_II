USE hoteldw;

DELIMITER $$

DROP PROCEDURE IF EXISTS LoadFactDailyOccupation$$

CREATE PROCEDURE LoadFactDailyOccupation()
BEGIN
    DECLARE vHotelID INT;
    DECLARE vHotelID_dw INT;
    DECLARE vHotelName VARCHAR(255);
    DECLARE vTotalRooms INT;
    DECLARE vCurrentYear INT;
    DECLARE vEndYear INT;
    DECLARE vCurrentMonth INT;
    DECLARE vCurrentDay INT;
    DECLARE vDate DATE;
    DECLARE vDateID INT;
    DECLARE vDailyRecord INT;
    DECLARE vDayCount INT;
    DECLARE maxNumHotels INT;
    DECLARE hotelCounter INT DEFAULT 0;
    DECLARE cur CURSOR FOR SELECT Name FROM hoteldb.hotel;

    -- Obtener el número total de hoteles
    SELECT COUNT(*) INTO maxNumHotels FROM hoteldb.hotel;

    OPEN cur;
    hotel_loop: LOOP
        FETCH cur INTO vHotelName;
        SET hotelCounter = hotelCounter + 1;

        -- Verificar si se han procesado todos los hoteles
        IF hotelCounter > maxNumHotels THEN
            LEAVE hotel_loop;
        END IF;

        -- Obtener IDs de hotel de ambas bases de datos
        SELECT ID INTO vHotelID FROM hoteldb.hotel WHERE Name = vHotelName;
        SELECT HotelID INTO vHotelID_dw FROM Dim_Hotel WHERE Name = vHotelName;

        -- Asegurarse de que el hotel existe en el data warehouse
        IF vHotelID_dw IS NOT NULL THEN
            -- Determinar rango de fechas para cada hotel
            SELECT YEAR(MIN(CheckinDate)) INTO vCurrentYear FROM hoteldb.booking b JOIN hoteldb.room r ON b.RoomNumber = r.ID WHERE r.HotelID = vHotelID;
            SELECT YEAR(MAX(CheckoutDate)) INTO vEndYear FROM hoteldb.booking b JOIN hoteldb.room r ON b.RoomNumber = r.ID WHERE r.HotelID = vHotelID;

            -- Número total de habitaciones para el hotel
            SELECT COUNT(*) INTO vTotalRooms FROM hoteldb.room WHERE HotelID = vHotelID;

            WHILE vCurrentYear <= vEndYear DO
                SET vCurrentMonth = 1;
                WHILE vCurrentMonth <= 12 DO
                    SET vCurrentDay = 1;
                    WHILE vCurrentDay <= DAYOFMONTH(LAST_DAY(CONCAT(vCurrentYear, '-', vCurrentMonth, '-01'))) DO
                        SET vDate = CONCAT(vCurrentYear, '-', vCurrentMonth, '-', vCurrentDay);

                        -- Asegurar que DateID existe para la fecha
                        SET vDateID = NULL;
                        SELECT DateID INTO vDateID FROM Dim_Time WHERE Date = vDate;
                        IF vDateID IS NULL THEN
                            -- Crear entrada en Dim_Time si no existe
                            INSERT INTO Dim_Time (Date, Day, Month, Year, IsWeekend)
                            VALUES (vDate, DAY(vDate), MONTH(vDate), YEAR(vDate), WEEKDAY(vDate) IN (5, 6));
                            SET vDateID = LAST_INSERT_ID();
                        END IF;

                        -- Contar habitaciones ocupadas para la fecha actual
                        SET vDayCount = NULL;
                        SELECT COUNT(*) INTO vDayCount 
                        FROM hoteldb.booking b
                        JOIN hoteldb.room r ON b.RoomNumber = r.ID
                        WHERE r.HotelID = vHotelID 
                            AND vDate BETWEEN b.CheckinDate AND b.CheckoutDate;

                        SET vDailyRecord = NULL;
                        SELECT ID INTO vDailyRecord FROM Fact_DailyOccupation WHERE DateID = vDateID AND HotelID = vHotelID_dw;
                        INSERT INTO DebugLog (message) VALUES (CONCAT('vDate: ', vDate, ', vDateID: ', vDateID, ', vHotelID_dw: ', vHotelID_dw, ', vDayCount: ', vDayCount, ', vDailyRecord: ', IFNULL(vDailyRecord, 'NULL')));
                        -- Insertar datos en Fact_DailyOccupation si hay habitaciones ocupadas
                        IF vDailyRecord IS NULL THEN
                            INSERT INTO Fact_DailyOccupation (HotelID, DateID, NumberOccupiedRooms, PercentageOccupiedRooms)
                            VALUES (vHotelID_dw, vDateID, vDayCount, IF(vTotalRooms > 0, vDayCount / vTotalRooms, 0));
                        END IF;

                        SET vCurrentDay = vCurrentDay + 1;
                    END WHILE;
                    SET vCurrentMonth = vCurrentMonth + 1;
                END WHILE;
                SET vCurrentYear = vCurrentYear + 1;
            END WHILE;
        END IF;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;

CALL LoadFactDailyOccupation();