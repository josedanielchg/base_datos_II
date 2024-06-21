USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE ActualizarFactInventarioSemanal()
BEGIN
    -- Suponiendo que se ejecuta cada semana para recalcular el inventario
    DELETE FROM factinventario WHERE FechaID = CURDATE(); -- Asumiendo reinicio semanal

    INSERT INTO factinventario (FechaID, ProductoID, StockInicial, StockFinal)
    SELECT CURDATE(), ProductoID, SUM(Stock), SUM(Stock) -- Necesitarás ajustar esto
    FROM EmpresaVentas.productos
    GROUP BY ProductoID;
END //

DELIMITER ;
