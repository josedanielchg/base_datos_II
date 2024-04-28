-- Para llamar el archivo debemos usar el comando:
-- CALL FillFactBooking('hoteldb');

USE HotelDW;

DROP PROCEDURE IF EXISTS FillFactBooking;

DELIMITER $$

CREATE PROCEDURE FillFactBooking(IN dbName VARCHAR(255))
BEGIN
    -- Variable para construir las sentencias SQL
    SET @sql = NULL;

    -- Verificar si ya hay entradas en FactBooking
    IF (SELECT COUNT(*) FROM FactBooking) > 0 THEN
        -- Insertar solo registros del día actual si ya hay datos
        SET @sql = CONCAT('
            INSERT INTO FactBooking (HotelID, AgeRangeID, TotalRooms, TotalRevenue, RoomTypeID, TimeID)
            SELECT
                dh.HotelID,
                dag.AgeRangeID,
                COUNT(b.ID) AS TotalRooms,
                SUM(b.TotalPrice) AS TotalRevenue,
                drt.RoomTypeID,
                dtm.TimeID
            FROM `', dbName, '`.Booking b
                INNER JOIN `', dbName, '`.Room r ON (b.RoomNumber = r.ID)
                INNER JOIN `', dbName, '`.RoomType rt ON (r.TypeID = rt.ID)
                INNER JOIN `', dbName, '`.Hotel h ON (h.ID = r.HotelID)
                INNER JOIN `', dbName, '`.Guest g ON (b.GuestID = g.ID)
                INNER JOIN DimHotel dh ON (h.Name = dh.HotelName)
                INNER JOIN DimRoomType drt ON (drt.Type = rt.Name)
                INNER JOIN DimTime dtm ON (dtm.Date = b.CheckinDate)
                INNER JOIN DimAgeRange dag ON (dag.RangeDescription = (
                    CASE
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) <= 20 THEN "0-20"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 21 AND 30 THEN "21-30"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 31 AND 40 THEN "31-40"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 41 AND 60 THEN "41-60"
                        ELSE "más de 60"
                    END
                ))
            WHERE b.CheckinDate = CURDATE()
            GROUP BY dh.HotelID, drt.RoomTypeID, dag.AgeRangeID, dtm.TimeID
            ORDER BY dh.HotelID, drt.RoomTypeID, dag.AgeRangeID, dtm.TimeID
        ');
    ELSE
        -- Insertar todos los registros relevantes si no hay datos
        SET @sql = CONCAT('
            INSERT INTO FactBooking (HotelID, AgeRangeID, TotalRooms, TotalRevenue, RoomTypeID, TimeID)
            SELECT
                dh.HotelID,
                dag.AgeRangeID,
                COUNT(b.ID) AS TotalRooms,
                SUM(b.TotalPrice) AS TotalRevenue,
                drt.RoomTypeID,
                dtm.TimeID
            FROM `', dbName, '`.Booking b
                INNER JOIN `', dbName, '`.Room r ON (b.RoomNumber = r.ID)
                INNER JOIN `', dbName, '`.RoomType rt ON (r.TypeID = rt.ID)
                INNER JOIN `', dbName, '`.Hotel h ON (h.ID = r.HotelID)
                INNER JOIN `', dbName, '`.Guest g ON (b.GuestID = g.ID)
                INNER JOIN DimHotel dh ON (h.Name = dh.HotelName)
                INNER JOIN DimRoomType drt ON (drt.Type = rt.Name)
                INNER JOIN DimTime dtm ON (dtm.Date = b.CheckinDate)
                INNER JOIN DimAgeRange dag ON (dag.RangeDescription = (
                    CASE
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) <= 20 THEN "0-20"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 21 AND 30 THEN "21-30"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 31 AND 40 THEN "31-40"
                        WHEN TIMESTAMPDIFF(YEAR, g.DateOfBirth, CURDATE()) BETWEEN 41 AND 60 THEN "41-60"
                        ELSE "más de 60"
                    END
                ))
            GROUP BY dh.HotelID, drt.RoomTypeID, dag.AgeRangeID, dtm.TimeID
            ORDER BY dh.HotelID, drt.RoomTypeID, dag.AgeRangeID, dtm.TimeID
        ');
    END IF;

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;