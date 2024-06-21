-- Crear la base de datos de Data Warehouse
CREATE DATABASE IF NOT EXISTS DW_EmpresaVentas;
USE DW_EmpresaVentas;

-- Creación de las dimensiones
CREATE TABLE DimFecha (
    FechaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Anio INT,
    Mes INT,
    Dia INT,
    DiaSemana VARCHAR(255)
);

CREATE TABLE DimProducto (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    CategoriaID INT
);

CREATE TABLE DimProveedor (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(255)
);

-- Creación de las tablas de hechos
CREATE TABLE FactVentas (
    FactVentasID INT AUTO_INCREMENT PRIMARY KEY,
    FechaID INT,
    ProductoID INT,
    ProveedorID INT,
    CantidadVendida INT,
    TotalVentas DECIMAL(10, 2),
    FOREIGN KEY (FechaID) REFERENCES DimFecha(FechaID),
    FOREIGN KEY (ProductoID) REFERENCES DimProducto(ProductoID),
    FOREIGN KEY (ProveedorID) REFERENCES DimProveedor(ProveedorID)
);

CREATE TABLE FactInventario (
    FactInventarioID INT AUTO_INCREMENT PRIMARY KEY,
    FechaID INT,
    ProductoID INT,
    StockInicial INT,
    StockFinal INT,
    StockComprado INT,
    FOREIGN KEY (FechaID) REFERENCES DimFecha(FechaID),
    FOREIGN KEY (ProductoID) REFERENCES DimProducto(ProductoID)
);
