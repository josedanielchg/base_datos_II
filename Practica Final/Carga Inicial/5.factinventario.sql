USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE CargaInicialFactInventario()
BEGIN
    INSERT INTO factinventario (FechaID, ProductoID, StockInicial, StockFinal)
    SELECT CURDATE(), ProductoID, SUM(Stock), SUM(Stock) -- Necesitarás ajustar cómo calcular estos valores
    FROM EmpresaVentas.productos
    GROUP BY ProductoID;
END //

DELIMITER ;
