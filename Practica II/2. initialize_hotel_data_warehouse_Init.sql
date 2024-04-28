-- Crear la base de datos para el Data Warehouse
CREATE DATABASE IF NOT EXISTS HotelDW;
USE HotelDW;

-- Crear la tabla Dimensión Tiempo
CREATE TABLE DimTime (
    TimeID INT AUTO_INCREMENT,
    Date DATE,
    Day INT,
    Month INT,
    Year INT,
    IsWeekend BOOLEAN,
    PRIMARY KEY (TimeID)
);

-- Crear la tabla Dimensión Rango de Edad
CREATE TABLE DimAgeRange (
    AgeRangeID INT AUTO_INCREMENT,
    RangeDescription VARCHAR(50),
    PRIMARY KEY (AgeRangeID)
);

-- Crear la tabla Dimensión Tipo de Habitación
CREATE TABLE DimRoomType (
    RoomTypeID INT AUTO_INCREMENT,
    Type VARCHAR(50),
    PRIMARY KEY (RoomTypeID)
);

-- Crear la tabla Dimensión Hotel
CREATE TABLE DimHotel (
    HotelID INT AUTO_INCREMENT,
    HotelName VARCHAR(255),
    PRIMARY KEY (HotelID)
);

-- Crear la tabla de Hechos
CREATE TABLE FactBooking (
    FactID INT AUTO_INCREMENT,
    TimeID INT,
    AgeRangeID INT,
    RoomTypeID INT,
    HotelID INT,
    TotalRooms INT,
    TotalRevenue DECIMAL(10,2),
    FOREIGN KEY (TimeID) REFERENCES DimTime(TimeID),
    FOREIGN KEY (AgeRangeID) REFERENCES DimAgeRange(AgeRangeID),
    FOREIGN KEY (RoomTypeID) REFERENCES DimRoomType(RoomTypeID),
    FOREIGN KEY (HotelID) REFERENCES DimHotel(HotelID),
    PRIMARY KEY (FactID)
);
