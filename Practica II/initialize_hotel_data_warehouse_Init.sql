-- Crear la base de datos para el Data Warehouse
CREATE DATABASE IF NOT EXISTS HotelDW;
USE HotelDW;

-- Crear la tabla Dimensión Tiempo
CREATE TABLE DimTime (
    TimeID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE,
    Day INT,
    Month INT,
    Year INT,
    IsWeekend BOOLEAN
);

-- Crear la tabla Dimensión Rango de Edad
CREATE TABLE DimAgeRange (
    AgeRangeID INT PRIMARY KEY AUTO_INCREMENT,
    RangeDescription VARCHAR(50)
);

-- Crear la tabla Dimensión Tipo de Habitación
CREATE TABLE DimRoomType (
    RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(50)
);

-- Crear la tabla Dimensión Hotel
CREATE TABLE DimHotel (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(255)
);

-- Crear la tabla de Hechos
CREATE TABLE FactBooking (
    FactID INT PRIMARY KEY AUTO_INCREMENT,
    TimeID INT,
    AgeRangeID INT,
    RoomTypeID INT,
    HotelID INT,
    TotalRooms INT,
    TotalRevenue DECIMAL(10,2),
    FOREIGN KEY (TimeID) REFERENCES DimTime(TimeID),
    FOREIGN KEY (AgeRangeID) REFERENCES DimAgeRange(AgeRangeID),
    FOREIGN KEY (RoomTypeID) REFERENCES DimRoomType(RoomTypeID),
    FOREIGN KEY (HotelID) REFERENCES DimHotel(HotelID)
);
