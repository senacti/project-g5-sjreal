/*INSERT´S*/
/*TABLA DATOS_EMPLEADO*/
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO datosempleado(correoEmpleado, 
			  telefonoEmpleado, sueldoEmpleado, tipoSueldo)
VALUES  ('pedroburgos9@gmail.com', '3225142345', 250000.00, 'Semanal'),
	('alexandramuñoz8@gmail.com', '3215142445', 250000.00, 'Semanal'),
	('danielmuñoz7@gmail.com', '3205142390', 1200000.00, 'Mensual'),
	('julianmuñoz1@gmail.com', '3228952345', 250000.00, 'Semanal'),
	('yvonburgos2@gmail.com', '3135148954', 600000.00, 'Quincenal');
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*TABLA PRIVILEGIOS*/
/*---------------------------------------------------------------------------------------*/
INSERT INTO privilegios(nombrePrivilegio, estadoPrivilegio)
VALUES  ('SELECT', 'Activo'),
	('DELETE', 'Activo'),
	('INSERT', 'Activo'),
	('UPDATE', 'Activo');
/*---------------------------------------------------------------------------------------*/

/*TABLA PRIVILEGIO_POR_ROL*/
/*---------------------------------------------------------------------------------------*/
INSERT INTO privilegio_por_rol
            (fechaAsignacion, Privilegio_idProvilegio, Rol_idRol)
VALUES  ('2023-09-09 15:00:00', 1, 1),
	('2023-09-09 15:00:00', 2, 1),
	('2023-09-09 15:00:00', 3, 1),
	('2023-09-09 15:00:00', 4, 1),
	('2023-09-09 15:00:00', 1, 2),
	('2023-09-09 15:00:00', 3, 2),
	('2023-09-09 15:00:00', 1, 3),
	('2023-09-09 15:00:00', 1, 4);
/*---------------------------------------------------------------------------------------*/
/*TABLA HUESPEDES*/
INSERT INTO huesped
            (nombreHuesped,
             apellidoHuesped,
             tipoDocumentoHuesped,
             DocumentoHuesped,
             generoHuesped,
             Cliente_idCliente)
VALUES  ('Juan', 'Pérez', 'TI', '1026754562', 'Masculino', '22'),
	('Sofía', 'Rodríguez', 'CC', '1234567890', 'Femenino', '22'),
	('Alejandro', 'González', 'CC', '9876543210', 'Masculino', '22'),
	('Valentina', 'Pérez', 'TI', '5551234567', 'Masculino', '22'),
	('Marta', 'Martínez', 'CC', '7865432109', 'Femenino', '4'),
	('Isabella', 'López', 'CC', '5127893456', 'Femenino', '2'),
	('Mateo', 'Sánchez', 'CC', '6452378910', 'Masculino', '1'),
	('Emma', 'Fernández', 'CC', '2314567890', 'Femenino', '3'),
	('Diego', 'Burgos', 'TI', '8901234567', 'Masculino', '3'),
	('Camilo', 'Torres', 'CC', '7654321098', 'Masculino', '4');
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*TABLA HORARIO_EMPLEADO*/
INSERT INTO horarioempleado
            (horaEntrada,
             horaSalida)
VALUES  ('08:00:00', '20:00:00'),
	('12:00:00', '20:00:00'),
	('08:00:00', '12:00:00'),
	('08:00:00', '08:00:00');
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*TABLA INFO_PROVEEDOR*/
INSERT INTO  infoproveedor
            (telefonoProveedor,
             correoProveedor,
             categoriaProveedor,
             Proveedor_idProveedor)
VALUES  ('3226543210', 'ritz@gmail.com', 'Aseo', 1),
	('3224567890', 'proveedor2@gmail.com', 'Textil', 2),
	('3225309124', 'proveedor3@gmail.com', 'Electricidad', 3),
	('3228135790', 'proveedor4@gmail.com', 'Bebidas', 4),	
	('3224444332', 'proveedor5@gmail.com', 'Bebidas alcoholicas', 5),
	('3228889990', 'proveedor6@gmail.com', 'Internet', 6),
	('3227890123', 'proveedor7@gmail.com', 'Textil', 7);	
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	
/*TABLA CLIENTE*/
INSERT INTO cliente (tipoDocumentoCliente, cedulaCliente, correoCliente, telefonoCliente, nombreCliente, apellidoCliente, segundoNombreCliente, segundoApellidoCliente, usuarioCliente, contraseñaCliente, tieneVehiculoCliente, placaVehiculoCliente)
	VALUES('CC','1091377784','yuryburgos@ejemplo.com','3147245703','Yury','Burgos','Yury09','12345','Si','TCO-128'),
		('CC','1094661504','yvonburgos@ejemplo.com','3143453243','Yvon','Burgos','Yvon03','12135','No','N/A'),
		('CC','1984762903','pedroeliecer@ejemplo.com','3147354187','Pedro','Pérez','Perez12','46852','Si','RPS-789'),
		('CE','29846597','ronaldopaez@ejemplo.com','3145647812','Ronaldo','Paéz','Ronaldo90','178943','Si','RQO-198'),
		('CC','1089456987','Sandypaez@ejemplo.com','3185696324','Sandy','Paéz','Sandy89','12345','No','N/A'),
		/*Copias de los registros de arriba que se borrarán después*/
		('CC','1091377785','yuryburgos@ejemplo.com','3147245703','Yury','Burgos','Yury09','12345','Si','TCO-128'),
		('CC','1094661505','yvonburgos@ejemplo.com','3143453243','Yvon','Burgos','Yvon03','12135','No','N/A'),
		('CC','1984762904','pedroeliecer@ejemplo.com','3147354187','Pedro','Pérez','Perez12','46852','Si','RPS-789'),
		('CE','29846598','ronaldopaez@ejemplo.com','3145647812','Ronaldo','Paéz','Ronaldo90','178943','Si','RQO-198'),
		('CC','1089456988','Sandypaez@ejemplo.com','3185696324','Sandy','Paéz','Sandy89','12345','No','N/A');
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
		
/*DELETE a la tabla cliente*/
SELECT  cliente.`idCliente`, 
	cliente.`cedulaCliente`,  
	cliente.`nombreCliente`
FROM cliente

DELETE FROM cliente
	WHERE cliente.`idCliente`>=27
	
