-- Crear la base de datos
CREATE DATABASE hoteldw;
USE hoteldw;

-- Crear las tablas de dimensiones
CREATE TABLE Dim_Time (
      DateID int AUTO_INCREMENT PRIMARY KEY,
      Date date,
      Day int,
      Month int,
      Year int,
      IsWeekend boolean
);

CREATE TABLE Dim_TypeRoom (
      TypeRoomID int AUTO_INCREMENT PRIMARY KEY,
      Name varchar(255)
);

CREATE TABLE Dim_Hotel (
       HotelID int AUTO_INCREMENT PRIMARY KEY,
       Name varchar(255),
       MaxCapacity int
);

CREATE TABLE Dim_Guest (
       GuestID int AUTO_INCREMENT PRIMARY KEY,
       Name varchar(255)
);

-- Crear las tablas de hechos
CREATE TABLE Fact_Profits (
      ID int AUTO_INCREMENT PRIMARY KEY,
      HotelID int,
      DateID int,
      TotalRevenue decimal(10,2),
      FOREIGN KEY (HotelID) REFERENCES Dim_Hotel(HotelID),
      FOREIGN KEY (DateID) REFERENCES Dim_Time(DateID)
);

CREATE TABLE Fact_Bookings (
       ID int AUTO_INCREMENT PRIMARY KEY,
       HotelID int,
       DateID int,
       GuestID int,
       TypeRoomID int,
       CheckinDate date,
       CheckoutDate date,
       TotalRevenue decimal(10,2),
       NumberNights int,
       DaysBetweenVisits int,
       FOREIGN KEY (HotelID) REFERENCES Dim_Hotel(HotelID),
       FOREIGN KEY (DateID) REFERENCES Dim_Time(DateID),
       FOREIGN KEY (GuestID) REFERENCES Dim_Guest(GuestID),
       FOREIGN KEY (TypeRoomID) REFERENCES Dim_TypeRoom(TypeRoomID)
);

CREATE TABLE Fact_DailyOccupation (
      ID int AUTO_INCREMENT PRIMARY KEY,
      HotelID int,
      DateID int,
      NumberOccupiedRooms int,
      PercentageOccupiedRooms float,
      FOREIGN KEY (HotelID) REFERENCES Dim_Hotel(HotelID),
      FOREIGN KEY (DateID) REFERENCES Dim_Time(DateID)
);