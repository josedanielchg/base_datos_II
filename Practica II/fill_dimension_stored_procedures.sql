-- Para llamar el archivo debemos usar el comando:
-- CALL FillDimensions('hoteldb');

USE HotelDW;

DELIMITER $$

CREATE PROCEDURE FillDimensions(IN dbName VARCHAR(255))
BEGIN
    -- Variable para construir las sentencias SQL
    SET @sql = NULL;

    -- Llenar DimTime
    SET @sql = CONCAT('INSERT INTO DimTime (Date, Day, Month, Year, IsWeekend) SELECT DISTINCT CheckinDate, DAY(CheckinDate), MONTH(CheckinDate), YEAR(CheckinDate), CASE WHEN DAYOFWEEK(CheckinDate) IN (1, 7) THEN TRUE ELSE FALSE END FROM `', dbName, '`.Booking ON DUPLICATE KEY UPDATE Day = VALUES(Day), Month = VALUES(Month), Year = VALUES(Year), IsWeekend = VALUES(IsWeekend)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar DimAgeRange
    DELETE FROM DimAgeRange; -- Limpiar la tabla antes de insertar los rangos
    INSERT INTO DimAgeRange (RangeDescription) VALUES
    ('0-20'), ('21-30'), ('31-40'), ('41-60'), ('más de 60');

    -- Llenar DimRoomType
    SET @sql = CONCAT('INSERT INTO DimRoomType (Type) SELECT DISTINCT Name FROM `', dbName, '`.RoomType ON DUPLICATE KEY UPDATE Type = VALUES(Type)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar DimHotel
    SET @sql = CONCAT('INSERT INTO DimHotel (HotelID, HotelName) SELECT ID, Name FROM `', dbName, '`.Hotel ON DUPLICATE KEY UPDATE HotelName = VALUES(HotelName)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END$$

DELIMITER ;