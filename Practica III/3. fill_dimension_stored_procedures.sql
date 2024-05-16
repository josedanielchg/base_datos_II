USE hoteldw;

DROP PROCEDURE IF EXISTS FillDimensions;

DELIMITER $$

CREATE PROCEDURE FillDimensions()
BEGIN
    -- Verificar y llenar DimTime
    SET @sql = 'INSERT INTO Dim_Time (DateID, Date, Day, Month, Year, IsWeekend)
                SELECT DISTINCT 
                    TO_DAYS(CheckinDate), -- Unique key
                    CheckinDate,
                    DAY(CheckinDate),
                    MONTH(CheckinDate),
                    YEAR(CheckinDate),
                    CASE WHEN DAYOFWEEK(CheckinDate) IN (1, 7) THEN TRUE ELSE FALSE END
                FROM hoteldb.Booking
                ON DUPLICATE KEY UPDATE Date = VALUES(Date), Day = VALUES(Day), Month = VALUES(Month), Year = VALUES(Year), IsWeekend = VALUES(IsWeekend)';
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar Dim_TypeRoom
    SET @sql = 'INSERT INTO Dim_TypeRoom (TypeRoomID, Name)
                SELECT DISTINCT 
                    ID,
                    Name
                FROM hoteldb.RoomType
                ON DUPLICATE KEY UPDATE Name = VALUES(Name)';
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar Dim_Hotel con la capacidad máxima calculada como el conteo de habitaciones asociadas
    SET @sql = 'INSERT INTO Dim_Hotel (HotelID, Name, MaxCapacity)
                SELECT 
                    h.ID,
                    h.Name,
                    (SELECT COUNT(*) FROM hoteldb.Room r WHERE r.HotelID = h.ID) AS MaxCapacity
                FROM 
                    hoteldb.Hotel h
                ON DUPLICATE KEY UPDATE Name = VALUES(Name), MaxCapacity = VALUES(MaxCapacity)';
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar Dim_Guest
    SET @sql = 'INSERT INTO Dim_Guest (GuestID, Name)
                SELECT DISTINCT 
                    ID,
                    CONCAT(FirstName, " ", LastName) AS Name
                FROM hoteldb.Guest
                ON DUPLICATE KEY UPDATE Name = VALUES(Name)';
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END$$

DELIMITER ;

CALL FillDimensions();