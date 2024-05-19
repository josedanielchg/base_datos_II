USE hoteldw;

DELIMITER $$

DROP PROCEDURE IF EXISTS LoadFactProfits$$

CREATE PROCEDURE LoadFactProfits()
BEGIN
    DECLARE vMinDate DATE;
    DECLARE vMaxDate DATE;

    -- Verificar si la tabla tiene datos
    IF (SELECT COUNT(*) FROM Fact_Profits) = 0 THEN
    -- Tabla vacía, cargar todos los datos desde la fecha mínima de check-in
    SELECT MIN(CheckinDate) INTO vMinDate FROM hoteldb.Booking;
    SELECT MAX(CheckoutDate) INTO vMaxDate FROM hoteldb.Booking;
    ELSE
    -- Tabla no está vacía, cargar datos sólo a partir de la última fecha cargada
    SELECT MAX(Date) INTO vMinDate FROM Dim_Time WHERE Date = CURDATE(); -- Asumiendo que queremos actualizar con datos del día actual
    SET vMaxDate = CURDATE();
    END IF;

    -- Insertar ingresos para cada día entre vMinDate y vMaxDate
    WHILE vMinDate <= vMaxDate DO
        INSERT INTO Fact_Profits (HotelID, DateID, TotalRevenue)
        SELECT
            h.HotelID,
                dt.DateID,
                SUM(b.TotalPrice / DATEDIFF(b.CheckoutDate, b.CheckinDate))
            FROM
                hoteldb.Booking b
            JOIN
                hoteldb.Room r ON b.RoomNumber = r.ID
            JOIN
                Dim_Hotel h ON r.HotelID = h.HotelID
            JOIN
                Dim_Time dt ON dt.Date = vMinDate
            WHERE
                b.CheckinDate < vMinDate AND b.CheckoutDate >= vMinDate
            GROUP BY
                h.HotelID, dt.DateID;

        SET vMinDate = DATE_ADD(vMinDate, INTERVAL 1 DAY);
    END WHILE;
    END$$

DELIMITER ;

call LoadFactProfits();