/*PRIMER QUERY*/
/*---------------------------------------------------------------------------------------*/
SELECT 
  cliente.`cedulaCliente`,
  cliente.`nombreCliente`,
  cliente.`apellidoCliente`,
  factura.`idFactura`,
  factura.`fechaFactura`,
  factura.`totalFactura`,
  detallefactura.`idDetalle_Factura`,
  producto.`nombreProducto`,
  detallefactura.`cantidadCA`,
  detallefactura.`precioUnitarioCA`,
  detallefactura.`precioPorHabitación`,
  detallefactura.`cantidadHabitaciones` 
FROM
  cliente 
  INNER JOIN factura 
    ON cliente.`idCliente` = factura.`clienteIdCliente` 
  INNER JOIN detallefactura 
    ON factura.`idFactura` = detallefactura.`facturaIdFactura` 
  INNER JOIN producto 
    ON detallefactura.`ProductoidProducto` = producto.`idProducto` 
	
/*PRIMERA VISTA*/ 
/*Se consultan las tablas cliente, factura, detalleFactura y producto*/	
  SELECT * FROM vista_facturas_clientes
/*---------------------------------------------------------------------------------------*/

/*SEGUNDO QUERY*/
/*---------------------------------------------------------------------------------------*/  
SELECT 
  empleado.`cedulaEmpleado`,
  empleado.`nombreEmpleado`,
  empleado.`apellidoEmpleado`,
  datosempleado.`correoEmpleado`,
  datosempleado.`telefonoEmpleado`,
  rol.`nameRol`,
  horarioempleado.`nombreTurno`,
  horarioempleado.`horaEntrada`,
  horarioempleado.`horaSalida`,
  datosempleado.`tipoSueldo`,
  datosempleado.`sueldoEmpleado` 
FROM
  empleado 
  INNER JOIN rol 
    ON empleado.`rolIdRol` = rol.`idRol` 
  INNER JOIN horarioempleado 
    ON empleado.`horarioEmpleadoIdHorarioEmpleado` = horarioempleado.`idHorarioEmpleado` 
  INNER JOIN datosempleado 
    ON empleado.`datosEmpleadoIdDatosEmpleado` = datosempleado.`idDatosEmpleado` 
	
/*SEGUNDA VISTA*/
/*Se consultan las tablas empleado, rol, horarioEmpleado y datosEmpleado*/
  SELECT * FROM vista_empleados
/*---------------------------------------------------------------------------------------*/
  
/*TERCER QUERY*/
/*---------------------------------------------------------------------------------------*/
SELECT
  facturacompra.`idFacturaCompra`,
  facturacompra.`fechaFC`,
  facturacompra.`precioTotalFC`,
  detallefacturacompra.`idDetalleFacturaCompra`,
  producto.`nombreProducto`,
  detallefacturacompra.`cantidadProducto`,
  detallefacturacompra.`precioUnitario`,
  pedido.`conceptoPedido`,
  pedido.`fechaPedido`,
  proveedor.`nombreProveedor`,
  proveedor.`NITProveedor`,
  infoproveedor.`categoriaProveedor`
  
FROM
  facturacompra
  
  INNER JOIN pedido
    ON facturacompra.`Pedido_idPedido`=pedido.`idPedido`
  INNER JOIN detallefacturacompra 
    ON detallefacturacompra.`FacturaCompra_idFacturaCompra`=facturacompra.`idFacturaCompra`
  INNER JOIN producto
    ON detallefacturacompra.`Producto_idProducto`=producto.`idProducto`
  INNER JOIN proveedor
    ON facturacompra.`Proveedor_idProveedor`=proveedor.`idProveedor`
  INNER JOIN infoproveedor
    ON proveedor.`idProveedor`=infoproveedor.`Proveedor_idProveedor`
    
/*TERCERA VISTA*/
/*Se consultan las tablas facturaCompra, detalleFacruraCompra, pedido, proveedor e infoPreoveedor*/	
  SELECT * FROM vista_pedidos_facturas
/*---------------------------------------------------------------------------------------*/
  
	
	

	