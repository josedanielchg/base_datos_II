USE DW_EmpresaVentas;

DELIMITER //

CREATE PROCEDURE CargaInicialDimFecha()
BEGIN
    DECLARE v_StartDate DATE;
    DECLARE v_EndDate DATE;

    SET v_StartDate = '2020-01-01'; -- Ajusta las fechas según necesidad
    SET v_EndDate = CURDATE();

    WHILE v_StartDate <= v_EndDate DO
        INSERT INTO dimfecha (Fecha, Anio, Mes, Dia, DiaSemana)
        VALUES (v_StartDate, YEAR(v_StartDate), MONTH(v_StartDate), DAY(v_StartDate), DAYOFWEEK(v_StartDate));

        SET v_StartDate = DATE_ADD(v_StartDate, INTERVAL 1 DAY);
    END WHILE;
END //

DELIMITER ;
