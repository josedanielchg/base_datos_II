USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE CargaInicialFactVentas()
BEGIN
    INSERT INTO factventas (FechaID, ProductoID, ProveedorID, CantidadVendida, TotalVentas)
    SELECT o.Fecha, d.ProductoID, pp.ProveedorID, d.Cantidad, d.Cantidad * d.Precio
    FROM EmpresaVentas.ordenes o
    JOIN EmpresaVentas.detallesorden d ON o.OrdenID = d.OrdenID
    JOIN EmpresaVentas.productoproveedores pp ON pp.ProductoID = d.ProductoID
    WHERE pp.FechaInicio <= o.Fecha AND (pp.FechaFin IS NULL OR pp.FechaFin >= o.Fecha);
END //

DELIMITER ;
