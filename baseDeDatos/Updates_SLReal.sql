/*TABLA detalleFactura*/
/*---------------------------------------------------------------------------------------*/
SELECT * FROM detallefactura

UPDATE detallefactura
	SET precioPorHabitación = 60000,
            cantidadHabitaciones = 1,
            conceptoDetalleFactura = 'Hospedaje de cliente Esteban Granados',
            cantidadCA = 2,
            precioUnitarioCA = 4000
	WHERE detallefactura.`idDetalle_Factura` = 1;
	
UPDATE detallefactura
	SET precioPorHabitación = 60000,
            cantidadHabitaciones = 1,
            conceptoDetalleFactura = 'Hospedaje de cliente Maicol Useche',
            cantidadCA = 2,
            precioUnitarioCA = 2500
	WHERE detallefactura.`idDetalle_Factura` = 2;
	
UPDATE detallefactura
	SET precioPorHabitación = 60000,
            cantidadHabitaciones = 1,
            conceptoDetalleFactura = 'Hospedaje de cliente Esteban Granados',
            cantidadCA = 0,
            precioUnitarioCA = 0
	WHERE detallefactura.`idDetalle_Factura` = 1;
/*---------------------------------------------------------------------------------------*/
	
/*TABLA datosEmpleado*/
/*---------------------------------------------------------------------------------------*/
SELECT * FROM datosempleado
SELECT cedulaEmpleado, nombreEmpleado FROM empleado
UPDATE empleado 
	SET datosEmpleadoIdDatosEmpleado = 1
	WHERE empleado.`cedulaEmpleado`= '9999999';
	
UPDATE empleado 
	SET datosEmpleadoIdDatosEmpleado = 2
	WHERE empleado.`cedulaEmpleado`= '8888888';

UPDATE empleado 
	SET datosEmpleadoIdDatosEmpleado = 3
	WHERE empleado.`cedulaEmpleado`= '7777777';

UPDATE empleado 
	SET datosEmpleadoIdDatosEmpleado = 4
	WHERE empleado.`cedulaEmpleado`= '1111111';

UPDATE empleado 
	SET datosEmpleadoIdDatosEmpleado = 5
	WHERE empleado.`cedulaEmpleado`= '2222222';
/*---------------------------------------------------------------------------------------*/

/*TABLA Clientes*/
/*---------------------------------------------------------------------------------------*/
SELECT  cliente.`idCliente`, 
	cliente.`cedulaCliente`,  
	cliente.`nombreCliente`
FROM cliente

UPDATE  cliente
	SET cedulaCliente='1056463521'
	WHERE idCliente='1';
	
UPDATE  cliente SET cedulaCliente='1078486531'
	WHERE idCliente='2';
UPDATE cliente	SET cedulaCliente='1116589968'
	WHERE idCliente='3';
UPDATE cliente SET cedulaCliente='1156463521'
	WHERE idCliente='4';
/*---------------------------------------------------------------------------------------*/

