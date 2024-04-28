-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

-- Crear la tabla Hotel
CREATE TABLE Hotel (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(255),
    Stars INT,
    CheckinTime TIME,
    CheckoutTime TIME,
    PRIMARY KEY (ID)
);

-- Crear la tabla Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT,
    HotelID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(255),
    HireDate DATE,
    FOREIGN KEY (HotelID) REFERENCES Hotel(ID),
    PRIMARY KEY (StaffID)
);

-- Crear la tabla RoomType
CREATE TABLE RoomType (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Description VARCHAR(255),
    PricePerNight DECIMAL(10,2),
    Capacity INT,
    PRIMARY KEY (ID)
);

-- Crear la tabla Room
CREATE TABLE Room (
    ID INT AUTO_INCREMENT,
    HotelID INT,
    TypeID INT,
    Status VARCHAR(20),
    FOREIGN KEY (HotelID) REFERENCES Hotel(ID),
    FOREIGN KEY (TypeID) REFERENCES RoomType(ID),
    PRIMARY KEY (ID)
);

-- Crear la tabla Guest
CREATE TABLE Guest (
    ID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(255),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(255),
    PRIMARY KEY (ID)
);

-- Crear la tabla Booking
CREATE TABLE Booking (
    ID INT AUTO_INCREMENT,
    GuestID INT,
    RoomNumber INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (RoomNumber) REFERENCES Room(ID),
    FOREIGN KEY (GuestID) REFERENCES Guest(ID),
    PRIMARY KEY (ID)
);

-- Crear la tabla Payment
CREATE TABLE Payment (
    ID INT AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(ID),
    PRIMARY KEY (ID)
);
