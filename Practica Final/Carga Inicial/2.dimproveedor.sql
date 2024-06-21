USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE CargaInicialDimProveedor()
BEGIN
    INSERT INTO dimproveedor (ProveedorID, Nombre, Telefono)
    SELECT ProveedorID, Nombre, Telefono
    FROM EmpresaVentas.proveedores;
END //

DELIMITER ;
