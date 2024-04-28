-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

-- Crear la tabla Hotel
CREATE TABLE Hotel (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(255),
    Stars INT,
    CheckinTime TIME,
    CheckoutTime TIME
);

-- Crear la tabla Staff
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(255),
    HireDate DATE,
    FOREIGN KEY (HotelID) REFERENCES Hotel(ID)
);

-- Crear la tabla RoomType
CREATE TABLE RoomType (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(255),
    PricePerNight DECIMAL(10,2),
    Capacity INT
);

-- Crear la tabla Room
CREATE TABLE Room (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    HotelID INT,
    TypeID INT,
    Status VARCHAR(20),
    FOREIGN KEY (HotelID) REFERENCES Hotel(ID),
    FOREIGN KEY (TypeID) REFERENCES RoomType(ID)
);

-- Crear la tabla Guest
CREATE TABLE Guest (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(255),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Email VARCHAR(255)
);

-- Crear la tabla Booking
CREATE TABLE Booking (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    GuestID INT,
    RoomNumber INT,
    CheckinDate DATE,
    CheckoutDate DATE,
    TotalPrice DECIMAL(10,2),
    FOREIGN KEY (RoomNumber) REFERENCES Room(ID),
    FOREIGN KEY (GuestID) REFERENCES Guest(ID)
);

-- Crear la tabla Payment
CREATE TABLE Payment (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(ID)
);
