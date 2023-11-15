DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `sjreal`.`sp_actualizar_total_detallePedido`(IN idDetalle INT)
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    BEGIN
	UPDATE sjreal.`detallepedido`
	SET detallepedido.`precio_Total`= cantidad_Producto*precio_unitario
	WHERE detallepedido.`idDetalle`=idDetalle;
    END$$

DELIMITER ;

/*---------------------------------------------------------------------------------------------*/

DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    PROCEDURE `sjreal`.`sp_actualizar_pedido_precio_total`(IN id INT)
    /*LANGUAGE SQL
    | [NOT] DETERMINISTIC
    | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
    | SQL SECURITY { DEFINER | INVOKER }
    | COMMENT 'string'*/
    BEGIN
	UPDATE sjreal.`pedido`
	SET pedido.`precio_Total_Pedido`= (SELECT SUM(precio_Total)
					FROM sjreal.`detallepedido`
					WHERE Pedido_idPedido=id)
	WHERE idPedido=id;
    END$$

DELIMITER ;