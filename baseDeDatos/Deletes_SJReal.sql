/*Se eliminan registros de la tabla Registro_Salida_Entrada duplicados*/
SELECT * FROM registro_salida_entrada
DELETE 
FROM `sjreal`.`registro_salida_entrada`
WHERE `idRegistro` >= 81;

/*Se eliminan registros de la tabla Hospedaje duplicados*/
SELECT * FROM hospedaje
DELETE 
FROM `sjreal`.`hospedaje`
WHERE `idHospedaje` >= 81;