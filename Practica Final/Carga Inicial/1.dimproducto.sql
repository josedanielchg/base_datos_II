USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE CargaInicialDimProducto()
BEGIN
    INSERT INTO dimproducto (ProductoID, Nombre, Precio, CategoriaID)
    SELECT ProductoID, Nombre, Precio, CategoriaID
    FROM EmpresaVentas.productos;
END //

DELIMITER ;
