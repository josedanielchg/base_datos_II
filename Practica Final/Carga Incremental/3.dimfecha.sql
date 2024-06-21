USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE ActualizarDimProveedor()
BEGIN
    -- Actualizar proveedores existentes
    UPDATE dimproveedor dp
    JOIN EmpresaVentas.proveedores p ON dp.ProveedorID = p.ProveedorID
    SET dp.Nombre = p.Nombre, dp.Telefono = p.Telefono;

    -- Insertar nuevos proveedores
    INSERT INTO dimproveedor (ProveedorID, Nombre, Telefono)
    SELECT ProveedorID, Nombre, Telefono
    FROM EmpresaVentas.proveedores
    WHERE ProveedorID NOT IN (SELECT ProveedorID FROM dimproveedor);
END //

DELIMITER ;
