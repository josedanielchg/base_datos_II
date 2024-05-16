USE hoteldw;

DROP PROCEDURE IF EXISTS FillDimensions;

DELIMITER $$

CREATE PROCEDURE FillDimensions()
BEGIN
    DECLARE vMinDate DATE;
    DECLARE vMaxDate DATE;

    -- Verificar si la tabla tiene datos
    IF (SELECT COUNT(*) FROM Dim_Time) = 0 THEN
        -- Tabla vacía, cargar todos los datos desde la fecha mínima de check-in
        SELECT MIN(CheckinDate) INTO vMinDate FROM hoteldb.Booking;
        SELECT MAX(CheckoutDate) INTO vMaxDate FROM hoteldb.Booking;
    ELSE
        -- Tabla no está vacía, cargar datos sólo a partir de la última fecha cargada
        SELECT MAX(Date) INTO vMinDate FROM Dim_Time;
        SET vMinDate = DATE_ADD(vMinDate, INTERVAL 1 DAY); -- Comenzar desde el día siguiente al último cargado
        SET vMaxDate = CURDATE();
    END IF;

    -- Verificar y llenar Dim_Time
    WHILE vMinDate <= vMaxDate DO
        INSERT INTO Dim_Time (DateID, Date, Day, Month, Year, IsWeekend)
        VALUES (
            TO_DAYS(vMinDate), -- Unique key
            vMinDate,
            DAY(vMinDate),
            MONTH(vMinDate),
            YEAR(vMinDate),
            CASE WHEN DAYOFWEEK(vMinDate) IN (1, 7) THEN TRUE ELSE FALSE END
        )
        ON DUPLICATE KEY UPDATE
            Date = VALUES(Date),
            Day = VALUES(Day),
            Month = VALUES(Month),
            Year = VALUES(Year),
            IsWeekend = VALUES(IsWeekend);

        SET vMinDate = DATE_ADD(vMinDate, INTERVAL 1 DAY);
    END WHILE;

    -- Llenar Dim_TypeRoom
    INSERT INTO Dim_TypeRoom (TypeRoomID, Name)
    SELECT DISTINCT
        ID,
        Name
    FROM hoteldb.RoomType
    ON DUPLICATE KEY UPDATE
        Name = VALUES(Name);

    -- Llenar Dim_Hotel con la capacidad máxima calculada como el conteo de habitaciones asociadas
    INSERT INTO Dim_Hotel (HotelID, Name, MaxCapacity)
    SELECT
        h.ID,
        h.Name,
        (SELECT COUNT(*) FROM hoteldb.Room r WHERE r.HotelID = h.ID) AS MaxCapacity
    FROM
        hoteldb.Hotel h
    ON DUPLICATE KEY UPDATE
        Name = VALUES(Name),
        MaxCapacity = VALUES(MaxCapacity);

    -- Llenar Dim_Guest
    INSERT INTO Dim_Guest (GuestID, Name)
    SELECT DISTINCT
        ID,
        CONCAT(FirstName, " ", LastName) AS Name
    FROM hoteldb.Guest
    ON DUPLICATE KEY UPDATE
        Name = VALUES(Name);

END$$

DELIMITER ;

CALL FillDimensions();
