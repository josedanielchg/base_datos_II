USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE ActualizarDimProducto()
BEGIN
    -- Actualizar productos existentes
    UPDATE dimproducto dp
    JOIN EmpresaVentas.productos p ON dp.ProductoID = p.ProductoID
    SET dp.Nombre = p.Nombre, dp.Precio = p.Precio, dp.CategoriaID = p.CategoriaID;

    -- Insertar nuevos productos
    INSERT INTO dimproducto (ProductoID, Nombre, Precio, CategoriaID)
    SELECT ProductoID, Nombre, Precio, CategoriaID
    FROM EmpresaVentas.productos
    WHERE ProductoID NOT IN (SELECT ProductoID FROM dimproducto);
END //

DELIMITER ;
