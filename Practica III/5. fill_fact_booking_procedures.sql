USE hoteldw;

DELIMITER $$

DROP PROCEDURE IF EXISTS LoadFactBookings$$

CREATE PROCEDURE LoadFactBookings()
BEGIN
    DECLARE vToday DATE;
    SET vToday = CURDATE(); -- Establece la fecha actual

    -- Verificar si la tabla tiene datos
    IF (SELECT COUNT(*) FROM Fact_Bookings) = 0 THEN
        -- Tabla vacía, cargar todos los datos desde la fecha mínima de check-in hasta hoy
        INSERT INTO Fact_Bookings (HotelID, DateID, GuestID, CheckinDate, CheckoutDate, NumberNights, DaysBetweenVisits)
        SELECT 
            r1.HotelID,
            dt.DateID,
            b1.GuestID,
            b1.CheckinDate,
            b1.CheckoutDate,
            DATEDIFF(b1.CheckoutDate, b1.CheckinDate) AS NumberNights,
            IFNULL((
                SELECT MIN(DATEDIFF(b2.CheckinDate, b1.CheckoutDate))
                FROM hoteldb.booking b2
                JOIN hoteldb.room r2 ON r2.ID = b2.RoomNumber AND r1.HotelID = r2.HotelID
                WHERE b2.GuestID = b1.GuestID AND b1.checkOutDate < b2.CheckinDate
                GROUP BY b2.GuestID, r2.HotelID, b1.checkOutDate, b2.CheckinDate
                HAVING COUNT(b2.CheckinDate) = 1 AND b2.CheckinDate = (
                    SELECT MIN(b3.CheckinDate)
                    FROM hoteldb.booking b3
                    JOIN hoteldb.room r3 ON r3.ID = b3.RoomNumber AND r1.HotelID = r3.HotelID
                    WHERE b1.checkOutDate < b3.CheckinDate
                    ORDER BY b3.CheckinDate
                    LIMIT 1
                )
            ), 0) AS DaysBetweenVisits
        FROM 
            hoteldb.booking b1
        JOIN 
            hoteldb.room r1 ON b1.RoomNumber = r1.ID
        JOIN 
            Dim_Hotel dh ON r1.HotelID = dh.HotelID
        JOIN 
            Dim_Time dt ON dt.Date = b1.CheckinDate
        WHERE 
            b1.CheckoutDate <= vToday;
    ELSE
        -- Tabla no está vacía, cargar datos sólo para los checkouts del día actual
        INSERT INTO Fact_Bookings (HotelID, DateID, GuestID, CheckinDate, CheckoutDate, NumberNights, DaysBetweenVisits)
        SELECT 
            r1.HotelID,
            dt.DateID,
            b1.GuestID,
            b1.CheckinDate,W
            b1.CheckoutDate,
            DATEDIFF(b1.CheckoutDate, b1.CheckinDate) AS NumberNights,
            IFNULL((
                SELECT MIN(DATEDIFF(b2.CheckinDate, b1.CheckoutDate))
                FROM hoteldb.booking b2
                JOIN hoteldb.room r2 ON r2.ID = b2.RoomNumber AND r1.HotelID = r2.HotelID
                WHERE b2.GuestID = b1.GuestID AND b1.checkOutDate < b2.CheckinDate
                GROUP BY b2.GuestID, r2.HotelID, b1.checkOutDate, b2.CheckinDate
                HAVING COUNT(b2.CheckinDate) = 1 AND b2.CheckinDate = (
                    SELECT MIN(b3.CheckinDate)
                    FROM hoteldb.booking b3
                    JOIN hoteldb.room r3 ON r3.ID = b3.RoomNumber AND r1.HotelID = r3.HotelID
                    WHERE b1.checkOutDate < b3.CheckinDate
                    ORDER BY b3.CheckinDate
                    LIMIT 1
                )
            ), 0) AS DaysBetweenVisits
        FROM 
            hoteldb.booking b1
        JOIN 
            hoteldb.room r1 ON b1.RoomNumber = r1.ID
        JOIN 
            Dim_Hotel dh ON r1.HotelID = dh.HotelID
        JOIN 
            Dim_Time dt ON dt.Date = b1.CheckinDate
        WHERE 
            b1.CheckoutDate = vToday;
    END IF;
END$$

DELIMITER ;