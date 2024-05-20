-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hoteldb
CREATE DATABASE IF NOT EXISTS `hoteldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hoteldb`;

-- Dumping structure for table hoteldb.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GuestID` int DEFAULT NULL,
  `RoomNumber` int DEFAULT NULL,
  `CheckinDate` date DEFAULT NULL,
  `CheckoutDate` date DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RoomNumber` (`RoomNumber`),
  KEY `GuestID` (`GuestID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`RoomNumber`) REFERENCES `room` (`ID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`GuestID`) REFERENCES `guest` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.booking: ~75 rows (approximately)
REPLACE INTO `booking` (`ID`, `GuestID`, `RoomNumber`, `CheckinDate`, `CheckoutDate`, `TotalPrice`) VALUES
	(1, 1, 101, '2023-05-01', '2023-05-05', 400.00),
	(2, 2, 102, '2023-05-05', '2023-05-06', 800.00),
	(3, 3, 103, '2023-05-03', '2023-05-07', 1400.00),
	(4, 4, 104, '2023-05-04', '2023-05-08', 480.00),
	(5, 5, 105, '2023-05-05', '2023-05-09', 720.00),
	(6, 6, 201, '2023-05-06', '2023-05-10', 400.00),
	(7, 7, 202, '2023-05-07', '2023-05-11', 800.00),
	(8, 8, 203, '2023-05-08', '2023-05-12', 1400.00),
	(9, 9, 204, '2023-05-09', '2023-05-13', 480.00),
	(10, 10, 205, '2023-05-10', '2023-05-14', 720.00),
	(11, 11, 301, '2023-05-11', '2023-05-15', 400.00),
	(12, 12, 302, '2023-05-12', '2023-05-16', 800.00),
	(13, 13, 303, '2023-05-13', '2023-05-17', 1400.00),
	(14, 14, 304, '2023-05-14', '2023-05-18', 480.00),
	(15, 15, 305, '2023-05-15', '2023-05-19', 720.00),
	(16, 16, 401, '2023-05-16', '2023-05-20', 400.00),
	(17, 17, 402, '2023-05-17', '2023-05-21', 800.00),
	(18, 18, 403, '2023-05-18', '2023-05-22', 1400.00),
	(19, 19, 404, '2023-05-19', '2023-05-23', 480.00),
	(20, 20, 405, '2023-05-20', '2023-05-24', 720.00),
	(21, 21, 501, '2023-05-21', '2023-05-25', 400.00),
	(22, 22, 502, '2023-05-22', '2023-05-26', 800.00),
	(23, 23, 503, '2023-05-23', '2023-05-27', 1400.00),
	(24, 24, 504, '2023-05-24', '2023-05-28', 480.00),
	(25, 25, 505, '2023-05-25', '2023-05-29', 720.00),
	(26, 26, 601, '2023-05-26', '2023-05-30', 2000.00),
	(27, 27, 602, '2023-05-27', '2023-05-31', 880.00),
	(28, 28, 603, '2023-05-28', '2023-06-01', 1600.00),
	(29, 29, 604, '2023-05-29', '2023-06-02', 900.00),
	(30, 30, 605, '2023-05-30', '2023-06-03', 2500.00),
	(31, 31, 701, '2023-06-04', '2023-06-08', 400.00),
	(32, 32, 702, '2023-06-05', '2023-06-09', 800.00),
	(33, 34, 704, '2023-06-07', '2023-06-11', 480.00),
	(34, 35, 705, '2023-06-08', '2023-06-12', 720.00),
	(35, 36, 801, '2023-06-09', '2023-06-30', 600.00),
	(36, 37, 802, '2023-06-10', '2023-06-30', 1200.00),
	(37, 38, 803, '2023-06-11', '2023-06-30', 900.00),
	(38, 39, 804, '2023-06-12', '2023-06-30', 1500.00),
	(39, 40, 805, '2023-06-13', '2023-06-30', 2000.00),
	(40, 41, 806, '2023-06-14', '2023-06-30', 450.00),
	(41, 42, 807, '2023-06-15', '2023-06-30', 750.00),
	(42, 43, 808, '2023-06-16', '2023-06-30', 1200.00),
	(43, 44, 809, '2023-06-17', '2023-06-30', 950.00),
	(44, 45, 810, '2023-06-18', '2023-06-30', 2000.00),
	(45, 46, 901, '2023-06-19', '2023-06-23', 400.00),
	(46, 47, 902, '2023-06-20', '2023-06-24', 800.00),
	(47, 48, 903, '2023-06-21', '2023-06-25', 1400.00),
	(48, 49, 904, '2023-06-22', '2023-06-26', 480.00),
	(49, 50, 905, '2023-06-23', '2023-06-27', 720.00),
	(50, 51, 1001, '2023-06-24', '2023-06-28', 500.00),
	(51, 52, 1002, '2023-06-25', '2023-06-29', 950.00),
	(52, 53, 1003, '2023-06-26', '2023-06-30', 1800.00),
	(53, 54, 1004, '2023-06-27', '2023-07-01', 1920.00),
	(54, 55, 1005, '2023-06-28', '2023-07-02', 1440.00),
	(55, 56, 1101, '2023-06-29', '2023-07-03', 400.00),
	(56, 57, 1102, '2023-06-30', '2023-07-04', 800.00),
	(57, 58, 1103, '2023-07-01', '2023-07-05', 1400.00),
	(58, 59, 1104, '2023-07-02', '2023-07-06', 480.00),
	(59, 60, 1105, '2023-07-03', '2023-07-07', 720.00),
	(60, 61, 1201, '2023-07-04', '2023-07-08', 2000.00),
	(61, 62, 1202, '2023-07-05', '2023-07-09', 880.00),
	(62, 63, 1203, '2023-07-06', '2023-07-10', 1600.00),
	(63, 64, 1204, '2023-07-07', '2023-07-11', 900.00),
	(64, 65, 1205, '2023-07-08', '2023-07-12', 2500.00),
	(65, 66, 1301, '2023-07-09', '2023-07-13', 400.00),
	(66, 67, 1302, '2023-07-10', '2023-07-14', 800.00),
	(67, 68, 1303, '2023-07-11', '2023-07-15', 1400.00),
	(68, 69, 1304, '2023-07-12', '2023-07-16', 480.00),
	(69, 70, 1305, '2023-07-13', '2023-07-17', 720.00),
	(70, 71, 1401, '2023-07-14', '2023-07-18', 2000.00),
	(71, 72, 1402, '2023-07-15', '2023-07-19', 880.00),
	(74, 11, 101, '2024-04-28', '2024-04-30', 10000.00),
	(75, 44, 810, '2023-07-17', '2023-07-25', 1000.00),
	(76, 35, 703, '2024-06-08', '2024-06-12', 600.00),
	(77, 44, 805, '2025-07-17', '2025-07-25', 1000.00);

-- Dumping structure for procedure hoteldb.COUNTWEEKDAYS
DELIMITER //
CREATE PROCEDURE `COUNTWEEKDAYS`(FROMDATE TIMESTAMP, TODATE TIMESTAMP)
begin
    declare NOOFWEEKDAYS INTEGER;
    set NoOfWeekDays = (datediff(todate, fromdate) + 1)
                -((timestampdiff(week, FROMDATE , TODATE) * 2))
                -weekday(fromdate)%4
                -weekday(todate)%4;
    select NOOFWEEKDAYS;
    end//
DELIMITER ;

-- Dumping structure for function hoteldb.CountWeekends
DELIMITER //
CREATE FUNCTION `CountWeekends`(startDate DATE, endDate DATE) RETURNS int
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
END//
DELIMITER ;

-- Dumping structure for procedure hoteldb.DaysOver50PercOccupied
DELIMITER //
CREATE PROCEDURE `DaysOver50PercOccupied`(IN hotelName VARCHAR(255))
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
END//
DELIMITER ;

-- Dumping structure for table hoteldb.guest
CREATE TABLE IF NOT EXISTS `guest` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.guest: ~72 rows (approximately)
REPLACE INTO `guest` (`ID`, `FirstName`, `LastName`, `Address`, `DateOfBirth`, `Phone`, `Email`) VALUES
	(1, 'Carlos', 'García', '456 Avenida Sol, Ciudad Luz', '1990-04-23', '666-1001', 'carlos.garcia@email.com'),
	(2, 'María', 'López', '789 Calle Jazmín, Ciudad Jardín', '1982-08-15', '666-1002', 'maria.lopez@email.com'),
	(3, 'Juan', 'Martínez', '123 Boulevard Azul, Ciudad Cielo', '1975-06-30', '666-1003', 'juan.martinez@email.com'),
	(4, 'Laura', 'Núñez', '234 Calle Luna, Ciudad Noche', '1993-12-05', '666-1004', 'laura.nunez@email.com'),
	(5, 'Roberto', 'Fernández', '890 Calle Río, Ciudad Agua', '1980-03-18', '666-1005', 'roberto.fernandez@email.com'),
	(6, 'Sofía', 'García', '567 Avenida Bosque, Ciudad Naturaleza', '1988-11-25', '666-1006', 'sofia.garcia@email.com'),
	(7, 'Alejandro', 'Martín', '321 Calle Montaña, Ciudad Roca', '1972-09-17', '666-1007', 'alejandro.martin@email.com'),
	(8, 'Verónica', 'Ruiz', '654 Boulevard Nube, Ciudad Aire', '1985-01-06', '666-1008', 'veronica.ruiz@email.com'),
	(9, 'David', 'Moreno', '987 Calle Sol, Ciudad Arena', '1978-07-19', '666-1009', 'david.moreno@email.com'),
	(10, 'María', 'Jiménez', '123 Calle Estrella, Ciudad Espacio', '1986-05-14', '666-1010', 'maria.jimenez@email.com'),
	(11, 'Elena', 'Vidal', '401 Calle Cometa, Ciudad Cosmos', '1995-11-30', '666-1040', 'elena.vidal@email.com'),
	(12, 'Luis', 'Alonso', '234 Calle Otoño, Ciudad Viento', '1994-03-21', '666-1011', 'luis.alonso@email.com'),
	(13, 'Ana', 'Torres', '567 Calle Primavera, Ciudad Floral', '1991-07-11', '666-1012', 'ana.torres@email.com'),
	(14, 'Pedro', 'Ramírez', '321 Calle Verano, Ciudad Solar', '1989-12-09', '666-1013', 'pedro.ramirez@email.com'),
	(15, 'Carmen', 'Sánchez', '654 Calle Invierno, Ciudad Frío', '1976-02-14', '666-1014', 'carmen.sanchez@email.com'),
	(16, 'Francisco', 'Gómez', '987 Calle Aurora, Ciudad Luz', '1974-11-01', '666-1015', 'francisco.gomez@email.com'),
	(17, 'Lucía', 'Navarro', '123 Calle Crepúsculo, Ciudad Estelar', '1992-04-22', '666-1016', 'lucia.navarro@email.com'),
	(18, 'Sergio', 'López', '456 Avenida Eclipse, Ciudad Luna', '1990-10-30', '666-1017', 'sergio.lopez@email.com'),
	(19, 'Clara', 'Morales', '789 Calle Amanecer, Ciudad Alba', '1983-05-28', '666-1018', 'clara.morales@email.com'),
	(20, 'Daniel', 'Ortiz', '234 Calle Cenit, Ciudad Día', '1975-01-15', '666-1019', 'daniel.ortiz@email.com'),
	(21, 'Laura', 'Romero', '890 Calle Mediodía, Ciudad Sol', '1987-08-19', '666-1020', 'laura.romero@email.com'),
	(22, 'Elena', 'Gil', '567 Calle Anochecer, Ciudad Noche', '1984-09-30', '666-1021', 'elena.gil@email.com'),
	(23, 'Marcos', 'Fernández', '321 Calle Medianoche, Ciudad Oscura', '1993-06-03', '666-1022', 'marcos.fernandez@email.com'),
	(24, 'Sara', 'Vargas', '654 Calle Galaxia, Ciudad Universo', '1986-03-17', '666-1023', 'sara.vargas@email.com'),
	(25, 'Víctor', 'Blanco', '987 Calle Cometa, Ciudad Estelar', '1982-12-21', '666-1024', 'victor.blanco@email.com'),
	(26, 'Nora', 'Martín', '123 Calle Planeta, Ciudad Cosmos', '1990-07-14', '666-1025', 'nora.martin@email.com'),
	(27, 'Pablo', 'Ruiz', '456 Avenida Meteorito, Ciudad Espacio', '1977-11-06', '666-1026', 'pablo.ruiz@email.com'),
	(28, 'Patricia', 'Moreno', '789 Calle Estación, Ciudad Orbital', '1973-02-18', '666-1027', 'patricia.moreno@email.com'),
	(29, 'Héctor', 'Jiménez', '321 Calle Satélite, Ciudad Lunar', '1994-05-29', '666-1028', 'hector.jimenez@email.com'),
	(30, 'Isabel', 'Pérez', '890 Calle Nebulosa, Ciudad Galáctica', '1985-10-25', '666-1029', 'isabel.perez@email.com'),
	(31, 'Fernando', 'Díaz', '567 Avenida Estrella, Ciudad Celestial', '1992-03-10', '666-1030', 'fernando.diaz@email.com'),
	(32, 'Luis', 'Ramírez', '123 Calle Sol, Ciudad Playa', '1978-02-15', '556-1101', 'luis.ramirez@example.com'),
	(33, 'Marta', 'González', '456 Avenida Luna, Ciudad Jardín', '1985-03-22', '556-1102', 'marta.gonzalez@example.com'),
	(34, 'Javier', 'Fernández', '789 Calle Río, Pueblo Viejo', '1990-07-08', '556-1103', 'javier.fernandez@example.com'),
	(35, 'Ana', 'Ruiz', '321 Camino Bosque, Ciudad Nueva', '1983-11-12', '556-1104', 'ana.ruiz@example.com'),
	(36, 'Carlos', 'López', '654 Avenida Montaña, Región Central', '1976-09-05', '556-1105', 'carlos.lopez@example.com'),
	(37, 'Sara', 'Martín', '987 Calle Lago, Ciudad Espejo', '1992-01-30', '556-1106', 'sara.martin@example.com'),
	(38, 'Lucía', 'Jiménez', '159 Camino Pradera, Ciudad Campo', '1988-04-17', '556-1107', 'lucia.jimenez@example.com'),
	(39, 'Francisco', 'Alonso', '753 Avenida Río, Ciudad Aguas', '1981-05-25', '556-1108', 'francisco.alonso@example.com'),
	(40, 'Carmen', 'Sánchez', '951 Calle Estrella, Ciudad Luz', '1974-12-30', '556-1109', 'carmen.sanchez@example.com'),
	(41, 'David', 'Díaz', '369 Camino Cielo, Ciudad Solar', '1989-08-11', '556-1110', 'david.diaz@example.com'),
	(42, 'Elena', 'Moreno', '123 Calle Luna, Ciudad Crepúsculo', '1991-03-14', '556-1111', 'elena.moreno@example.com'),
	(43, 'Marco', 'Pérez', '456 Avenida Sol, Ciudad Amanecer', '1975-06-09', '556-1112', 'marco.perez@example.com'),
	(44, 'Patricia', 'Ortega', '789 Calle Jardín, Pueblo Florido', '1987-10-28', '556-1113', 'patricia.ortega@example.com'),
	(45, 'Roberto', 'Castillo', '321 Camino Piedra, Ciudad Roca', '1993-02-21', '556-1114', 'roberto.castillo@example.com'),
	(46, 'Sofía', 'Iglesias', '654 Avenida Granja, Región Agrícola', '1980-08-05', '556-1115', 'sofia.iglesias@example.com'),
	(47, 'Óscar', 'Vega', '987 Calle Mar, Ciudad Océano', '1986-11-30', '556-1116', 'oscar.vega@example.com'),
	(48, 'Nora', 'Hernández', '159 Camino Colina, Ciudad Altura', '1979-12-22', '556-1117', 'nora.hernandez@example.com'),
	(49, 'Miguel', 'Navarro', '753 Avenida Valle, Ciudad Profunda', '1984-07-13', '556-1118', 'miguel.navarro@example.com'),
	(50, 'Laura', 'Romero', '951 Calle Nube, Ciudad Aérea', '1982-10-19', '556-1119', 'laura.romero@example.com'),
	(51, 'Víctor', 'Torres', '369 Camino Estanque, Pueblo Agua', '1994-09-06', '556-1120', 'victor.torres@example.com'),
	(52, 'Irene', 'Gutiérrez', '123 Calle Bosque, Ciudad Natural', '1977-01-11', '556-1121', 'irene.gutierrez@example.com'),
	(53, 'Paula', 'Gil', '789 Calle Arroyo, Pueblo Seco', '1995-04-14', '556-1123', 'paula.gil@example.com'),
	(54, 'Jorge', 'Blanco', '321 Camino Verde, Ciudad Hoja', '1988-12-20', '556-1124', 'jorge.blanco@example.com'),
	(55, 'Leticia', 'Morales', '654 Avenida Litoral, Región Marítima', '1978-05-29', '556-1125', 'leticia.morales@example.com'),
	(56, 'Raúl', 'Aguilar', '987 Calle Tierra, Ciudad Pedregosa', '1983-07-18', '556-1126', 'raul.aguilar@example.com'),
	(57, 'Beatriz', 'Vidal', '159 Camino Sol, Ciudad Brillante', '1979-09-22', '556-1127', 'beatriz.vidal@example.com'),
	(58, 'Álvaro', 'Méndez', '753 Avenida Bosque, Ciudad Fresca', '1985-11-13', '556-1128', 'alvaro.mendez@example.com'),
	(59, 'Cristina', 'Santana', '951 Calle Ola, Ciudad Costera', '1981-06-15', '556-1129', 'cristina.santana@example.com'),
	(60, 'Iván', 'Ruiz', '369 Camino Piedra, Ciudad Mineral', '1992-02-07', '556-1130', 'ivan.ruiz@example.com'),
	(61, 'Mónica', 'Gómez', '123 Calle Volcán, Pueblo Fuego', '1977-10-25', '556-1131', 'monica.gomez@example.com'),
	(62, 'Diego', 'Lorenzo', '456 Avenida Jardín, Ciudad Floral', '1993-01-15', '556-1132', 'diego.lorenzo@example.com'),
	(63, 'Clara', 'Herrera', '789 Calle Vista, Ciudad Panorama', '1984-03-05', '556-1133', 'clara.herrera@example.com'),
	(64, 'Antonio', 'Cortés', '321 Camino Monte, Ciudad Alta', '1976-07-24', '556-1134', 'antonio.cortes@example.com'),
	(65, 'Susana', 'Reyes', '654 Avenida Cascada, Región Acuática', '1990-08-09', '556-1135', 'susana.reyes@example.com'),
	(66, 'Ricardo', 'Prieto', '987 Calle Otoño, Pueblo Viento', '1987-12-01', '556-1136', 'ricardo.prieto@example.com'),
	(67, 'Natalia', 'Martínez', '159 Camino Luminoso, Ciudad Luz', '1991-05-18', '556-1137', 'natalia.martinez@example.com'),
	(68, 'Enrique', 'Dominguez', '753 Avenida Playa, Ciudad Arena', '1989-09-22', '556-1138', 'enrique.dominguez@example.com'),
	(69, 'Sonia', 'Castro', '951 Calle Nieve, Ciudad Invernal', '1980-11-14', '556-1139', 'sonia.castro@example.com'),
	(70, 'Óscar', 'Pérez', '369 Camino Seco, Pueblo Desierto', '1994-10-20', '556-1140', 'oscar.perez@example.com'),
	(71, 'Lorena', 'Sanz', '123 Calle Marea, Ciudad Marina', '1975-04-02', '556-1141', 'lorena.sanz@example.com'),
	(72, 'Alberto', 'Ortega', '456 Avenida Gran, Ciudad Imperial', '1982-12-30', '556-1142', 'alberto.ortega@example.com');

-- Dumping structure for table hoteldb.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Stars` int DEFAULT NULL,
  `CheckinTime` time DEFAULT NULL,
  `CheckoutTime` time DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.hotel: ~40 rows (approximately)
REPLACE INTO `hotel` (`ID`, `Name`, `Address`, `Phone`, `Email`, `Stars`, `CheckinTime`, `CheckoutTime`) VALUES
	(1, 'Hotel Vista al Mar', '123 Calle Oceano, Ciudad Costera', '555-1234', 'info@vistaalmar.com', 4, '15:00:00', '12:00:00'),
	(2, 'Hotel Campo Verde', '456 Camino Rural, Pueblo Tranquilo', '555-5678', 'contacto@campoverde.com', 3, '14:00:00', '11:00:00'),
	(3, 'Hotel Urbano Central', '789 Avenida Principal, Gran Ciudad', '555-8765', 'reservas@urbanocentral.com', 5, '16:00:00', '10:00:00'),
	(4, 'Hotel Sol Naciente', '321 Calle Sol, Ciudad Solar', '555-4321', 'recepcion@solnaciente.com', 3, '14:00:00', '11:00:00'),
	(5, 'Hotel Nocturno', '654 Calle Luna, Ciudad Estelar', '555-6543', 'info@hotelnocturno.com', 4, '17:00:00', '11:00:00'),
	(6, 'Hotel Jardín Secreto', '987 Camino Bosque, Pueblo Escondido', '555-7890', 'contacto@jardinsecreto.com', 5, '15:00:00', '12:00:00'),
	(7, 'Hotel Refugio del Lago', '159 Calle Lago, Región Acuática', '555-1235', 'info@refugiodellago.com', 4, '16:00:00', '11:00:00'),
	(8, 'Hotel Aventura Tropical', '753 Camino Selva, Isla Paradisíaca', '555-7531', 'reservas@aventuratropical.com', 4, '15:00:00', '10:00:00'),
	(9, 'Hotel Cumbres Nevadas', '951 Calle Nieve, Montaña Helada', '555-9512', 'info@cumbresnevadas.com', 5, '14:00:00', '12:00:00'),
	(10, 'Hotel Ruinas Históricas', '357 Calle Antigua, Ciudad Patrimonio', '555-3570', 'recepcion@ruinashistoricas.com', 3, '13:00:00', '11:00:00'),
	(11, 'Hotel Costa Azul', '321 Calle Playa, Ciudad Costera', '555-3210', 'info@costaazul.com', 4, '14:00:00', '12:00:00'),
	(12, 'Hotel Oasis Desértico', '852 Camino Arena, Desierto Grande', '555-8520', 'contacto@oasisdesertico.com', 5, '16:00:00', '10:00:00'),
	(13, 'Hotel Vista de la Ciudad', '369 Avenida Urbana, Metrópolis', '555-3690', 'reservas@vistaciudad.com', 3, '15:00:00', '11:00:00'),
	(14, 'Hotel Refugio Tranquilo', '147 Calle Paz, Pueblo Calmo', '555-1470', 'info@refugiotranquilo.com', 3, '14:00:00', '10:00:00'),
	(15, 'Hotel Puente Viejo', '258 Camino Historia, Ciudad Antigua', '555-2580', 'recepcion@puenteviejo.com', 4, '16:00:00', '12:00:00'),
	(16, 'Hotel Horizonte Lejano', '753 Calle Panorama, Ciudad Vista', '555-7532', 'contacto@horizontelejano.com', 5, '15:00:00', '11:00:00'),
	(17, 'Hotel Amanecer Dorado', '951 Calle Aurora, Ciudad Brillante', '555-9513', 'info@amanecerdorado.com', 4, '14:00:00', '10:00:00'),
	(18, 'Hotel Estrellas del Norte', '159 Calle Polar, Región Fría', '555-1590', 'reservas@estrellasnorte.com', 5, '16:00:00', '12:00:00'),
	(19, 'Hotel Mar de Cristal', '864 Calle Océano, Costa Clara', '555-8640', 'info@mardcristal.com', 4, '15:00:00', '11:00:00'),
	(20, 'Hotel Bosque Encantado', '753 Camino Verde, Bosque Mágico', '555-7533', 'contacto@bosqueencantado.com', 3, '14:00:00', '10:00:00'),
	(21, 'Hotel Cielo Azul', '951 Calle Cielo, Ciudad Celeste', '555-9514', 'recepcion@cieloazul.com', 5, '16:00:00', '12:00:00'),
	(22, 'Hotel Puerta del Sol', '123 Calle Sol, Ciudad Luminosa', '555-1236', 'info@puertadelsol.com', 4, '15:00:00', '11:00:00'),
	(23, 'Hotel Las Dunas', '456 Camino Arena, Desierto Extenso', '555-5679', 'reservas@lasdunas.com', 3, '14:00:00', '10:00:00'),
	(24, 'Hotel Mirador de Estrellas', '789 Calle Vista, Ciudad Nocturna', '555-8766', 'info@miradorestrellas.com', 5, '17:00:00', '12:00:00'),
	(25, 'Hotel Paraíso Terrenal', '321 Calle Edén, Isla Escondida', '555-4322', 'contacto@paraisoterrenal.com', 4, '15:00:00', '11:00:00'),
	(26, 'Hotel Gran Imperio', '654 Calle Majestuosa, Capital Imperial', '555-6544', 'recepcion@granimperio.com', 5, '16:00:00', '10:00:00'),
	(27, 'Hotel Tierras Lejanas', '987 Camino Distante, Tierra Remota', '555-7891', 'info@tierralejana.com', 3, '14:00:00', '11:00:00'),
	(28, 'Hotel Refugio de Paz', '159 Calle Serenidad, Valle Tranquilo', '555-1237', 'reservas@refugiodepaz.com', 4, '15:00:00', '12:00:00'),
	(29, 'Hotel Ventanas al Cielo', '753 Calle Altura, Montaña Alta', '555-7534', 'contacto@ventanasalcielo.com', 5, '14:00:00', '10:00:00'),
	(30, 'Hotel Punto de Encuentro', '951 Calle Central, Ciudad Famosa', '555-9515', 'info@puntodeencuentro.com', 4, '16:00:00', '11:00:00'),
	(31, 'Hotel Oasis Urbano', '369 Calle Moderna, Metrópoli Vibrante', '555-3691', 'recepcion@oasisurbano.com', 3, '15:00:00', '12:00:00'),
	(32, 'Hotel Atardecer Dorado', '147 Calle Ocaso, Ciudad Dorada', '555-1471', 'info@atardecerdorado.com', 4, '14:00:00', '10:00:00'),
	(33, 'Hotel Mirada al Valle', '258 Camino Valle, Región Pintoresca', '555-2581', 'reservas@miradaalvalle.com', 5, '16:00:00', '11:00:00'),
	(34, 'Hotel Puertas del Tiempo', '753 Calle Antigüedad, Ciudad Histórica', '555-7535', 'contacto@puertasdeltiempo.com', 3, '15:00:00', '12:00:00'),
	(35, 'Hotel Lago Espejo', '951 Calle Reflexión, Lago Sereno', '555-9516', 'info@lagoespejo.com', 4, '14:00:00', '10:00:00'),
	(36, 'Hotel Encrucijada', '159 Calle Encuentro, Ciudad de Cruce', '555-1591', 'recepcion@hotelencrucijada.com', 5, '16:00:00', '11:00:00'),
	(37, 'Hotel Alturas del Este', '864 Calle Elevada, Montañas Orientales', '555-8641', 'info@alturasdeleste.com', 4, '15:00:00', '12:00:00'),
	(38, 'Hotel Bosques del Norte', '753 Camino Frío, Bosque Boreal', '555-7536', 'reservas@bosquesdelnorte.com', 3, '14:00:00', '11:00:00'),
	(39, 'Hotel Caminos Cruzados', '951 Calle Intersección, Ciudad Activa', '555-9517', 'contacto@caminoscruzados.com', 4, '16:00:00', '10:00:00'),
	(40, 'Hotel Refugio Montañoso', '369 Calle Alta, Cordillera', '555-3692', 'info@refugiomontanoso.com', 5, '15:00:00', '11:00:00'),
	(41, 'Hotel Las Bahamas Suite', 'Pedro House', '555-874', 'pedrosotto717@gmail.com', 2, '15:03:59', '15:04:00');

-- Dumping structure for table hoteldb.payment
CREATE TABLE IF NOT EXISTS `payment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `BookingID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `BookingID` (`BookingID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`BookingID`) REFERENCES `booking` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.payment: ~72 rows (approximately)
REPLACE INTO `payment` (`ID`, `BookingID`, `Amount`, `PaymentDate`, `PaymentMethod`) VALUES
	(1, NULL, 400.00, '2023-05-01', 'Tarjeta de Crédito'),
	(2, NULL, 800.00, '2023-05-02', 'Tarjeta de Crédito'),
	(3, NULL, 1400.00, '2023-05-03', 'Efectivo'),
	(4, NULL, 480.00, '2023-05-04', 'Tarjeta de Débito'),
	(5, NULL, 720.00, '2023-05-05', 'Tarjeta de Crédito'),
	(6, NULL, 400.00, '2023-05-06', 'Efectivo'),
	(7, NULL, 800.00, '2023-05-07', 'Tarjeta de Crédito'),
	(8, NULL, 1400.00, '2023-05-08', 'Tarjeta de Débito'),
	(9, NULL, 480.00, '2023-05-09', 'Tarjeta de Crédito'),
	(10, NULL, 720.00, '2023-05-10', 'Efectivo'),
	(11, NULL, 400.00, '2023-05-11', 'Tarjeta de Débito'),
	(12, NULL, 800.00, '2023-05-12', 'Tarjeta de Crédito'),
	(13, NULL, 1400.00, '2023-05-13', 'Efectivo'),
	(14, NULL, 480.00, '2023-05-14', 'Tarjeta de Crédito'),
	(15, NULL, 720.00, '2023-05-15', 'Tarjeta de Débito'),
	(16, NULL, 400.00, '2023-05-16', 'Efectivo'),
	(17, NULL, 800.00, '2023-05-17', 'Tarjeta de Crédito'),
	(18, NULL, 1400.00, '2023-05-18', 'Tarjeta de Débito'),
	(19, NULL, 480.00, '2023-05-19', 'Tarjeta de Crédito'),
	(20, NULL, 720.00, '2023-05-20', 'Efectivo'),
	(21, NULL, 400.00, '2023-06-04', 'Tarjeta de Crédito'),
	(22, NULL, 800.00, '2023-06-05', 'Tarjeta de Débito'),
	(23, NULL, 1400.00, '2023-06-06', 'Efectivo'),
	(24, NULL, 480.00, '2023-06-07', 'Tarjeta de Crédito'),
	(25, NULL, 720.00, '2023-06-08', 'Tarjeta de Débito'),
	(26, NULL, 2000.00, '2023-06-09', 'Efectivo'),
	(27, NULL, 880.00, '2023-06-10', 'Tarjeta de Crédito'),
	(28, NULL, 1600.00, '2023-06-11', 'Tarjeta de Débito'),
	(29, NULL, 900.00, '2023-06-12', 'Efectivo'),
	(30, NULL, 2500.00, '2023-06-13', 'Tarjeta de Crédito'),
	(31, NULL, 400.00, '2023-06-14', 'Tarjeta de Débito'),
	(32, NULL, 800.00, '2023-06-15', 'Efectivo'),
	(33, NULL, 1400.00, '2023-06-16', 'Tarjeta de Crédito'),
	(34, NULL, 480.00, '2023-06-17', 'Tarjeta de Débito'),
	(35, NULL, 720.00, '2023-06-18', 'Efectivo'),
	(36, NULL, 600.00, '2023-06-19', 'Tarjeta de Crédito'),
	(37, NULL, 1200.00, '2023-06-20', 'Tarjeta de Débito'),
	(38, NULL, 900.00, '2023-06-21', 'Efectivo'),
	(39, NULL, 1500.00, '2023-06-22', 'Tarjeta de Crédito'),
	(40, NULL, 2000.00, '2023-06-23', 'Tarjeta de Débito'),
	(41, NULL, 450.00, '2023-06-24', 'Tarjeta de Crédito'),
	(42, NULL, 750.00, '2023-06-25', 'Efectivo'),
	(43, NULL, 1200.00, '2023-06-26', 'Tarjeta de Débito'),
	(44, NULL, 950.00, '2023-06-27', 'Tarjeta de Crédito'),
	(45, NULL, 2000.00, '2023-06-28', 'Efectivo'),
	(46, NULL, 400.00, '2023-06-29', 'Tarjeta de Débito'),
	(47, NULL, 800.00, '2023-06-30', 'Tarjeta de Crédito'),
	(48, NULL, 1400.00, '2023-07-01', 'Efectivo'),
	(49, NULL, 480.00, '2023-07-02', 'Tarjeta de Débito'),
	(50, NULL, 720.00, '2023-07-03', 'Tarjeta de Crédito'),
	(51, NULL, 500.00, '2023-07-04', 'Efectivo'),
	(52, NULL, 950.00, '2023-07-05', 'Tarjeta de Crédito'),
	(53, NULL, 1800.00, '2023-07-06', 'Tarjeta de Débito'),
	(54, NULL, 1920.00, '2023-07-07', 'Tarjeta de Crédito'),
	(55, NULL, 1440.00, '2023-07-08', 'Efectivo'),
	(56, NULL, 400.00, '2023-07-09', 'Tarjeta de Débito'),
	(57, NULL, 800.00, '2023-07-10', 'Tarjeta de Crédito'),
	(58, NULL, 1400.00, '2023-07-11', 'Efectivo'),
	(59, NULL, 480.00, '2023-07-12', 'Tarjeta de Débito'),
	(60, NULL, 720.00, '2023-07-13', 'Tarjeta de Crédito'),
	(61, NULL, 2000.00, '2023-07-14', 'Tarjeta de Crédito'),
	(62, NULL, 880.00, '2023-07-15', 'Efectivo'),
	(63, NULL, 1600.00, '2023-07-16', 'Tarjeta de Débito'),
	(64, NULL, 900.00, '2023-07-17', 'Tarjeta de Crédito'),
	(65, NULL, 2500.00, '2023-07-18', 'Efectivo'),
	(66, NULL, 400.00, '2023-07-19', 'Tarjeta de Débito'),
	(67, NULL, 800.00, '2023-07-20', 'Tarjeta de Crédito'),
	(68, NULL, 1400.00, '2023-07-21', 'Efectivo'),
	(69, NULL, 480.00, '2023-07-22', 'Tarjeta de Débito'),
	(70, NULL, 720.00, '2023-07-23', 'Tarjeta de Crédito'),
	(71, NULL, 2000.00, '2023-07-24', 'Efectivo'),
	(72, NULL, 880.00, '2023-07-25', 'Tarjeta de Débito');

-- Dumping structure for table hoteldb.room
CREATE TABLE IF NOT EXISTS `room` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HotelID` int DEFAULT NULL,
  `TypeID` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `HotelID` (`HotelID`),
  KEY `TypeID` (`TypeID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`ID`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `roomtype` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.room: ~80 rows (approximately)
REPLACE INTO `room` (`ID`, `HotelID`, `TypeID`, `Status`) VALUES
	(101, 1, 1, 'Disponible'),
	(102, 1, 1, 'Disponible'),
	(103, 1, 3, 'Ocupado'),
	(104, 1, 4, 'Disponible'),
	(105, 1, 1, 'Mantenimiento'),
	(201, 2, 1, 'Disponible'),
	(202, 2, 2, 'Ocupado'),
	(203, 2, 3, 'Disponible'),
	(204, 2, 4, 'Disponible'),
	(205, 2, 5, 'Ocupado'),
	(301, 3, 1, 'Disponible'),
	(302, 3, 2, 'Disponible'),
	(303, 3, 3, 'Disponible'),
	(304, 3, 4, 'Ocupado'),
	(305, 3, 5, 'Disponible'),
	(401, 4, 1, 'Mantenimiento'),
	(402, 4, 2, 'Disponible'),
	(403, 4, 3, 'Disponible'),
	(404, 4, 4, 'Disponible'),
	(405, 4, 5, 'Ocupado'),
	(501, 5, 1, 'Disponible'),
	(502, 5, 2, 'Disponible'),
	(503, 5, 3, 'Disponible'),
	(504, 5, 4, 'Disponible'),
	(505, 5, 5, 'Ocupado'),
	(601, 6, 6, 'Disponible'),
	(602, 6, 7, 'Ocupado'),
	(603, 6, 8, 'Disponible'),
	(604, 6, 9, 'Disponible'),
	(605, 6, 10, 'Disponible'),
	(701, 7, 1, 'Disponible'),
	(702, 7, 2, 'Disponible'),
	(703, 7, 3, 'Disponible'),
	(704, 7, 4, 'Ocupado'),
	(705, 7, 5, 'Disponible'),
	(801, 8, 1, 'Disponible'),
	(802, 8, 2, 'Disponible'),
	(803, 8, 3, 'Disponible'),
	(804, 8, 4, 'Disponible'),
	(805, 8, 5, 'Disponible'),
	(806, 8, 6, 'Disponible'),
	(807, 8, 7, 'Ocupado'),
	(808, 8, 8, 'Mantenimiento'),
	(809, 8, 9, 'Disponible'),
	(810, 8, 10, 'Disponible'),
	(901, 9, 1, 'Disponible'),
	(902, 9, 2, 'Ocupado'),
	(903, 9, 3, 'Disponible'),
	(904, 9, 4, 'Mantenimiento'),
	(905, 9, 5, 'Disponible'),
	(1001, 10, 1, 'Disponible'),
	(1002, 10, 2, 'Disponible'),
	(1003, 10, 3, 'Disponible'),
	(1004, 10, 4, 'Ocupado'),
	(1005, 10, 5, 'Mantenimiento'),
	(1101, 11, 1, 'Disponible'),
	(1102, 11, 2, 'Disponible'),
	(1103, 11, 3, 'Disponible'),
	(1104, 11, 4, 'Disponible'),
	(1105, 11, 5, 'Ocupado'),
	(1201, 12, 6, 'Disponible'),
	(1202, 12, 7, 'Disponible'),
	(1203, 12, 8, 'Disponible'),
	(1204, 12, 9, 'Ocupado'),
	(1205, 12, 10, 'Mantenimiento'),
	(1301, 13, 1, 'Disponible'),
	(1302, 13, 2, 'Disponible'),
	(1303, 13, 3, 'Disponible'),
	(1304, 13, 4, 'Disponible'),
	(1305, 13, 5, 'Ocupado'),
	(1401, 14, 6, 'Disponible'),
	(1402, 14, 7, 'Disponible'),
	(1403, 14, 8, 'Disponible'),
	(1404, 14, 9, 'Disponible'),
	(1405, 14, 10, 'Mantenimiento'),
	(1501, 15, 1, 'Disponible'),
	(1502, 15, 2, 'Disponible'),
	(1503, 15, 3, 'Disponible'),
	(1504, 15, 4, 'Disponible'),
	(1505, 15, 5, 'Ocupado');

-- Dumping structure for table hoteldb.roomtype
CREATE TABLE IF NOT EXISTS `roomtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `PricePerNight` decimal(10,2) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.roomtype: ~10 rows (approximately)
REPLACE INTO `roomtype` (`ID`, `Name`, `Description`, `PricePerNight`, `Capacity`) VALUES
	(1, 'Estándar', 'Habitación estándar con todas las comodidades básicas.', 100.00, 2),
	(2, 'Deluxe', 'Habitación deluxe con vistas privilegiadas y decoración premium.', 200.00, 2),
	(3, 'Suite', 'Suite espaciosa con área de estar separada y comodidades de lujo.', 350.00, 4),
	(4, 'Doble', 'Habitación doble con dos camas individuales, ideal para compartir.', 120.00, 2),
	(5, 'Familiar', 'Habitación familiar grande para acomodar a toda la familia cómodamente.', 180.00, 4),
	(6, 'Estudio', 'Habitación tipo estudio con servicios de cocina incluidos.', 160.00, 2),
	(7, 'Penthouse', 'Penthouse en la última planta con vistas espectaculares y servicios exclusivos.', 500.00, 4),
	(8, 'Doble de Lujo', 'Versión de lujo de nuestra habitación doble con amenidades adicionales.', 220.00, 2),
	(9, 'Individual', 'Habitación individual perfecta para viajeros solos.', 90.00, 1),
	(10, 'Presidencial', 'La suite presidencial ofrece lo último en lujo y privacidad.', 600.00, 4);

-- Dumping structure for table hoteldb.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `HotelID` int DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  PRIMARY KEY (`StaffID`),
  KEY `HotelID` (`HotelID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`HotelID`) REFERENCES `hotel` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table hoteldb.staff: ~40 rows (approximately)
REPLACE INTO `staff` (`StaffID`, `HotelID`, `FirstName`, `LastName`, `Position`, `Salary`, `DateOfBirth`, `Phone`, `Email`, `HireDate`) VALUES
	(1, 1, 'Juan', 'Martínez', 'Recepcionista', 2500.00, '1985-07-22', '555-1001', 'juan.martinez@vistaalmar.com', '2015-05-10'),
	(2, 2, 'Ana', 'Lopez', 'Gerente', 4500.00, '1980-03-15', '555-1002', 'ana.lopez@campoverde.com', '2010-06-20'),
	(3, 3, 'Carlos', 'González', 'Cocinero', 3000.00, '1990-11-08', '555-1003', 'carlos.gonzalez@urbanocentral.com', '2018-09-15'),
	(4, 4, 'Laura', 'Núñez', 'Jardinero', 2200.00, '1992-02-10', '555-1004', 'laura.nunez@solnaciente.com', '2020-03-23'),
	(5, 5, 'Roberto', 'Fernández', 'Conserje', 2100.00, '1975-08-30', '555-1005', 'roberto.fernandez@hotelnocturno.com', '2000-07-15'),
	(6, 6, 'Sofía', 'García', 'Gerente', 4500.00, '1985-05-05', '555-1006', 'sofia.garcia@jardinsecreto.com', '2013-12-01'),
	(7, 7, 'Alejandro', 'Martín', 'Camarero', 2300.00, '1993-09-20', '555-1007', 'alejandro.martin@refugiodellago.com', '2021-05-11'),
	(8, 8, 'Verónica', 'Ruiz', 'Mantenimiento', 2500.00, '1988-10-14', '555-1008', 'veronica.ruiz@aventuratropical.com', '2012-11-09'),
	(9, 9, 'David', 'Moreno', 'Recepcionista', 2400.00, '1991-07-18', '555-1009', 'david.moreno@cumbresnevadas.com', '2016-04-25'),
	(10, 10, 'María', 'Jiménez', 'Cocinera', 2800.00, '1986-01-24', '555-1010', 'maria.jimenez@ruinashistoricas.com', '2014-02-20'),
	(11, 11, 'Pablo', 'Alonso', 'Botones', 2000.00, '1988-06-17', '555-1011', 'pablo.alonso@costaazul.com', '2019-01-25'),
	(12, 12, 'Clara', 'Gutiérrez', 'Recepcionista', 2450.00, '1994-05-25', '555-1012', 'clara.gutierrez@oasisdesertico.com', '2017-08-10'),
	(13, 13, 'Francisco', 'Romero', 'Conserje', 2150.00, '1972-12-13', '555-1013', 'francisco.romero@vistaciudad.com', '1998-03-05'),
	(14, 14, 'Natalia', 'Torres', 'Gerente', 4600.00, '1978-09-30', '555-1014', 'natalia.torres@refugiotranquilo.com', '2009-11-18'),
	(15, 15, 'Miguel', 'Ortiz', 'Cocinero', 3200.00, '1992-08-11', '555-1015', 'miguel.ortiz@puenteviejo.com', '2020-06-30'),
	(16, 16, 'Lorena', 'Rubio', 'Camarera', 2300.00, '1990-02-03', '555-1016', 'lorena.rubio@horizontelejano.com', '2021-07-22'),
	(17, 17, 'Sergio', 'Molina', 'Mantenimiento', 2550.00, '1985-10-19', '555-1017', 'sergio.molina@amanecerdorado.com', '2013-05-09'),
	(18, 18, 'Isabel', 'Herrera', 'Recepcionista', 2600.00, '1983-01-27', '555-1018', 'isabel.herrera@estrellasnorte.com', '2012-04-12'),
	(19, 19, 'Tomás', 'Giménez', 'Conserje', 2250.00, '1979-11-05', '555-1019', 'tomas.gimenez@mardcristal.com', '2004-10-01'),
	(20, 20, 'Patricia', 'Navarro', 'Gerente', 4700.00, '1976-03-07', '555-1020', 'patricia.navarro@bosqueencantado.com', '2008-09-15'),
	(21, 21, 'Óscar', 'Díaz', 'Cocinero', 3100.00, '1991-05-10', '555-1021', 'oscar.diaz@cieloazul.com', '2019-11-30'),
	(22, 22, 'Marta', 'Blanco', 'Jardinera', 2200.00, '1987-07-28', '555-1022', 'marta.blanco@puertadelsol.com', '2021-02-17'),
	(23, 23, 'Fernando', 'Sanchez', 'Camarero', 2350.00, '1989-04-23', '555-1023', 'fernando.sanchez@lasdunas.com', '2020-07-10'),
	(24, 24, 'Lucía', 'Castillo', 'Recepcionista', 2400.00, '1993-08-16', '555-1024', 'lucia.castillo@miradorestrellas.com', '2021-03-20'),
	(25, 25, 'Víctor', 'Iglesias', 'Conserje', 2150.00, '1974-12-31', '555-1025', 'victor.iglesias@paraisoterrenal.com', '1999-11-10'),
	(26, 26, 'Carmen', 'Cano', 'Gerente', 4600.00, '1977-06-14', '555-1026', 'carmen.cano@granimperio.com', '2011-05-23'),
	(27, 27, 'Daniel', 'Prieto', 'Cocinero', 3000.00, '1986-02-20', '555-1027', 'daniel.prieto@tierralejana.com', '2018-08-25'),
	(28, 28, 'Raquel', 'Méndez', 'Jardinero', 2250.00, '1995-01-05', '555-1028', 'raquel.mendez@refugiodepaz.com', '2021-09-09'),
	(29, 29, 'Óscar', 'Vega', 'Mantenimiento', 2500.00, '1983-11-15', '555-1029', 'oscar.vega@ventanasalcielo.com', '2012-12-12'),
	(30, 30, 'Sandra', 'Lara', 'Recepcionista', 2450.00, '1991-03-22', '555-1030', 'sandra.lara@puntodeencuentro.com', '2017-04-18'),
	(31, 31, 'Luis', 'Serrano', 'Conserje', 2100.00, '1984-05-09', '555-1031', 'luis.serrano@oasisurbano.com', '2015-10-29'),
	(32, 32, 'Noelia', 'Martín', 'Gerente', 4300.00, '1978-10-11', '555-1032', 'noelia.martin@atardecerdorado.com', '2007-01-15'),
	(33, 33, 'Jorge', 'Delgado', 'Cocinero', 3100.00, '1989-09-08', '555-1033', 'jorge.delgado@miradaalvalle.com', '2019-05-20'),
	(34, 34, 'Beatriz', 'Gil', 'Jardinero', 2300.00, '1990-07-03', '555-1034', 'beatriz.gil@puertasdeltiempo.com', '2020-12-15'),
	(35, 35, 'Adrián', 'Vargas', 'Camarero', 2250.00, '1992-11-29', '555-1035', 'adrian.vargas@lagoespejo.com', '2021-06-05'),
	(36, 36, 'Inés', 'Hernández', 'Recepcionista', 2450.00, '1993-02-27', '555-1036', 'ines.hernandez@hotelencrucijada.com', '2021-08-22'),
	(37, 37, 'Marcos', 'Muñoz', 'Conserje', 2200.00, '1973-08-11', '555-1037', 'marcos.munoz@alturasdeleste.com', '2003-03-01'),
	(38, 38, 'Nora', 'Aguilar', 'Gerente', 4500.00, '1979-04-22', '555-1038', 'nora.aguilar@bosquesdelnorte.com', '2010-09-25'),
	(39, 39, 'Álvaro', 'Cabrera', 'Cocinero', 3200.00, '1990-12-12', '555-1039', 'alvaro.cabrera@caminoscruzados.com', '2020-01-15'),
	(40, 40, 'Elena', 'Vidal', 'Gerente', 4300.00, '1979-11-30', '555-1040', 'elena.vidal@refugiomontanoso.com', '2005-08-19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
