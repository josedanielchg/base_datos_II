-- Para llamar el archivo debemos usar el comando:
-- CALL FillDimensions('hoteldb');

USE HotelDW;

DROP PROCEDURE IF EXISTS FillDimensions;

DELIMITER $$
CREATE PROCEDURE FillDimensions(IN dbName VARCHAR(255))
BEGIN
    -- Variable para construir las sentencias SQL
    SET @sql = NULL;

    -- Verificar si ya hay entradas en DimTime
    IF (SELECT COUNT(*) FROM DimTime) > 0 THEN
        -- Llenar DimTime solo con datos del día actual si ya hay datos y no existe un registro para ese día
        IF NOT EXISTS (SELECT 1 FROM DimTime WHERE Date = CURDATE()) THEN
            SET @sql = CONCAT('INSERT INTO DimTime (Date, Day, Month, Year, IsWeekend) SELECT DISTINCT CheckinDate, DAY(CheckinDate), MONTH(CheckinDate), YEAR(CheckinDate), CASE WHEN DAYOFWEEK(CheckinDate) IN (1, 7) THEN TRUE ELSE FALSE END FROM `', dbName, '`.Booking WHERE CheckinDate = CURDATE() ON DUPLICATE KEY UPDATE Day = VALUES(Day), Month = VALUES(Month), Year = VALUES(Year), IsWeekend = VALUES(IsWeekend)');
            PREPARE stmt FROM @sql;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        END IF;
    ELSE
        -- Llenar DimTime con todos los datos si es la primera vez
        SET @sql = CONCAT('INSERT INTO DimTime (Date, Day, Month, Year, IsWeekend) SELECT DISTINCT CheckinDate, DAY(CheckinDate), MONTH(CheckinDate), YEAR(CheckinDate), CASE WHEN DAYOFWEEK(CheckinDate) IN (1, 7) THEN TRUE ELSE FALSE END FROM `', dbName, '`.Booking ON DUPLICATE KEY UPDATE Day = VALUES(Day), Month = VALUES(Month), Year = VALUES(Year), IsWeekend = VALUES(IsWeekend)');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;

    -- Llenar DimAgeRange
    IF (SELECT COUNT(*) FROM DimAgeRange) = 0 THEN
        -- Solo insertar rangos de edad si no hay datos
        DELETE FROM DimAgeRange;
        INSERT INTO DimAgeRange (RangeDescription) VALUES
        ('0-20'), ('21-30'), ('31-40'), ('41-60'), ('más de 60');
    END IF;

    -- Llenar DimRoomType solo con tipos de habitación nuevos
    SET @sql = CONCAT('INSERT INTO DimRoomType (Type) SELECT DISTINCT Name FROM `', dbName, '`.RoomType WHERE Name NOT IN (SELECT Type FROM DimRoomType) ON DUPLICATE KEY UPDATE Type = VALUES(Type)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Llenar DimHotel solo con hoteles nuevos
    SET @sql = CONCAT('INSERT INTO DimHotel (HotelID, HotelName) SELECT ID, Name FROM `', dbName, '`.Hotel WHERE ID NOT IN (SELECT HotelID FROM DimHotel) ON DUPLICATE KEY UPDATE HotelName = VALUES(HotelName)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
END$$

DELIMITER ;