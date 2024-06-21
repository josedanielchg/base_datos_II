USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE ActualizarFactVentas()
BEGIN
    INSERT INTO factventas (FechaID, ProductoID, ProveedorID, CantidadVendida, TotalVentas)
    SELECT o.Fecha, d.ProductoID, pp.ProveedorID, d.Cantidad, d.Cantidad * d.Precio
    FROM EmpresaVentas.ordenes o
    JOIN EmpresaVentas.detallesorden d ON o.OrdenID = d.OrdenID
    JOIN EmpresaVentas.productoproveedores pp ON pp.ProductoID = d.ProductoID
    WHERE o.Fecha = CURDATE() AND pp.FechaInicio <= o.Fecha AND (pp.FechaFin IS NULL OR pp.FechaFin >= o.Fecha)
    AND NOT EXISTS (
        SELECT 1 FROM factventas fv
        WHERE fv.FechaID = o.Fecha AND fv.ProductoID = d.ProductoID
    );
END //

DELIMITER ;
