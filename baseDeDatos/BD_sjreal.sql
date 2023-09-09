/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.28-MariaDB : Database - sjreal2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sjreal2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `sjreal2`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(60) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `categoria` */

insert  into `categoria`(`idCategoria`,`nombreCategoria`) values (1,'empaquetados'),(2,'bebidas'),(3,'textiles'),(4,'aseo'),(5,'electricidad'),(6,'alcohol'),(7,'mobiliario'),(8,'Servicio');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `tipoDocumentoCliente` enum('CC','CE','NIT') NOT NULL,
  `cedulaCliente` varchar(20) NOT NULL,
  `correoCliente` varchar(50) NOT NULL,
  `telefonoCliente` varchar(10) NOT NULL,
  `nombreCliente` varchar(50) NOT NULL,
  `apellidoCliente` varchar(50) NOT NULL,
  `segundoNombreCliente` varchar(50) DEFAULT NULL,
  `segundoApellidoCliente` varchar(50) DEFAULT NULL,
  `usuarioCliente` varchar(45) DEFAULT NULL,
  `contraseñaCliente` varchar(45) DEFAULT NULL,
  `tipoCliente` enum('Persona natural','Persona jurídica') NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cedulaCliente` (`cedulaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idCliente`,`tipoDocumentoCliente`,`cedulaCliente`,`correoCliente`,`telefonoCliente`,`nombreCliente`,`apellidoCliente`,`segundoNombreCliente`,`segundoApellidoCliente`,`usuarioCliente`,`contraseñaCliente`,`tipoCliente`) values (1,'CC','1056463521','cliente1@gmail.com','1234567894','laura','gomez',NULL,NULL,NULL,NULL,''),(2,'CC','1078486531','cliente2@gmail.com','3123062303','esteban','granados',NULL,NULL,NULL,NULL,''),(3,'CC','1116589968','cliente3@gmail.com','3114521425','pedro','burgos',NULL,NULL,NULL,NULL,''),(4,'CE','1156463521','cliente4@gmail.com','3146045515','maicol','useche',NULL,NULL,NULL,NULL,''),(22,'CC','1091377784','yuryburgos@ejemplo.com','3147245703','Yury','Burgos',NULL,NULL,'Yury09','12345',''),(23,'CC','1094661504','yvonburgos@ejemplo.com','3143453243','Yvon','Burgos',NULL,NULL,'Yvon03','12135',''),(24,'CC','1984762903','pedroeliecer@ejemplo.com','3147354187','Pedro','Pérez',NULL,NULL,'Perez12','46852',''),(25,'CE','29846597','ronaldopaez@ejemplo.com','3145647812','Ronaldo','Paéz',NULL,NULL,'Ronaldo90','178943',''),(26,'CC','1089456987','Sandypaez@ejemplo.com','3185696324','Sandy','Paéz',NULL,NULL,'Sandy89','12345',''),(32,'NIT','9021561020-1','evergreen@gmail.com','3154567896','Evergreen','SAS',NULL,NULL,'Evergreen192','52486','Persona jurídica');

/*Table structure for table `datosempleado` */

DROP TABLE IF EXISTS `datosempleado`;

CREATE TABLE `datosempleado` (
  `idDatosEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `correoEmpleado` varchar(60) NOT NULL,
  `telefonoEmpleado` varchar(10) NOT NULL,
  `sueldoEmpleado` decimal(10,0) NOT NULL,
  `tipoSueldo` enum('Semanal','Quincenal','Mensual') NOT NULL,
  PRIMARY KEY (`idDatosEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `datosempleado` */

insert  into `datosempleado`(`idDatosEmpleado`,`correoEmpleado`,`telefonoEmpleado`,`sueldoEmpleado`,`tipoSueldo`) values (1,'pedroburgos9@gmail.com','3225142345',250000,'Semanal'),(2,'alexandramuñoz8@gmail.com','3215142445',250000,'Semanal'),(3,'danielmuñoz7@gmail.com','3205142390',1200000,'Mensual'),(4,'julianmuñoz1@gmail.com','3228952345',250000,'Semanal'),(5,'yvonburgos2@gmail.com','3135148954',600000,'Quincenal');

/*Table structure for table `detallefactura` */

DROP TABLE IF EXISTS `detallefactura`;

CREATE TABLE `detallefactura` (
  `idDetalle_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `facturaIdFactura` int(11) NOT NULL,
  `ProductoidProducto` int(11) NOT NULL,
  `precioPorHabitación` decimal(10,0) NOT NULL,
  `cantidadHabitaciones` int(11) NOT NULL,
  `conceptoDetalleFactura` varchar(60) NOT NULL,
  `cantidadCA` int(11) NOT NULL,
  `precioUnitarioCA` decimal(10,0) NOT NULL,
  `totalDetalle` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idDetalle_Factura`),
  KEY `fk_Detalle_Factura_Factura1` (`facturaIdFactura`),
  KEY `fk_DetalleFactura_Producto1` (`ProductoidProducto`),
  CONSTRAINT `fk_DetalleFactura_Producto1` FOREIGN KEY (`ProductoidProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalle_Factura_Factura1` FOREIGN KEY (`facturaIdFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `detallefactura` */

insert  into `detallefactura`(`idDetalle_Factura`,`facturaIdFactura`,`ProductoidProducto`,`precioPorHabitación`,`cantidadHabitaciones`,`conceptoDetalleFactura`,`cantidadCA`,`precioUnitarioCA`,`totalDetalle`) values (1,5,1,60000,1,'Hospedaje de cliente Esteban Granados',2,4000,68000),(2,7,2,60000,1,'Hospedaje de cliente Maicol Useche',2,2500,65000),(3,8,7,60000,2,'Hospedaje de cliente Pedro Burgos',4,2500,130000),(4,10,1,60000,1,'Hospedaje de la clienta Laura Gómez',2,4000,68000),(5,11,2,60000,1,'Hospedaje de la clienta Yury Burgos y familia',4,2500,70000),(6,11,7,50000,3,'Hospedaje de la clienta Yury Burgos y familia',4,2500,160000);

/*Table structure for table `detallefacturacompra` */

DROP TABLE IF EXISTS `detallefacturacompra`;

CREATE TABLE `detallefacturacompra` (
  `idDetalleFacturaCompra` int(11) NOT NULL AUTO_INCREMENT,
  `precioUnitario` decimal(11,0) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `FacturaCompra_idFacturaCompra` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `totalDetalleFC` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleFacturaCompra`),
  KEY `fk_idFacturaCompra` (`FacturaCompra_idFacturaCompra`),
  KEY `fk_idProducto` (`Producto_idProducto`),
  CONSTRAINT `fk_idFacturaCompra` FOREIGN KEY (`FacturaCompra_idFacturaCompra`) REFERENCES `facturacompra` (`idFacturaCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idProducto` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `detallefacturacompra` */

insert  into `detallefacturacompra`(`idDetalleFacturaCompra`,`precioUnitario`,`cantidadProducto`,`FacturaCompra_idFacturaCompra`,`Producto_idProducto`,`totalDetalleFC`) values (1,2000,50,1,27,0),(2,20000,20,5,28,0),(3,5000,10,6,9,0),(4,2000,16,12,3,0),(5,3000,60,14,31,0);

/*Table structure for table `detallehabitacion` */

DROP TABLE IF EXISTS `detallehabitacion`;

CREATE TABLE `detallehabitacion` (
  `idDetalleHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `aseoCaracteristicasHabitacion` enum('Limpia','Pendiente por aseo','Sucia') NOT NULL,
  `tipoCamaDetalleHabitacion` enum('De madera','De cemento') NOT NULL,
  `precioHabitacion` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idDetalleHabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `detallehabitacion` */

insert  into `detallehabitacion`(`idDetalleHabitacion`,`aseoCaracteristicasHabitacion`,`tipoCamaDetalleHabitacion`,`precioHabitacion`) values (1,'Limpia','De madera',0),(2,'Limpia','De cemento',0),(3,'Pendiente por aseo','De madera',0),(4,'Pendiente por aseo','De cemento',0),(5,'Sucia','De madera',0),(6,'Sucia','De cemento',0);

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaEmpleado` varchar(45) NOT NULL,
  `nombreEmpleado` varchar(50) NOT NULL,
  `segundoNombreEmpleado` varchar(50) DEFAULT NULL,
  `apellidoEmpleado` varchar(50) NOT NULL,
  `segundoApellidoEmpleado` varchar(50) DEFAULT NULL,
  `rolIdRol` int(11) NOT NULL,
  `datosEmpleadoIdDatosEmpleado` int(11) NOT NULL,
  `horarioEmpleadoIdHorarioEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `cedulaEmpleado` (`cedulaEmpleado`),
  UNIQUE KEY `fk_Empleado_Datos` (`datosEmpleadoIdDatosEmpleado`),
  KEY `fk_Empleado_Rol1` (`rolIdRol`),
  KEY `horarioEmpleadoIdHorarioEmpleado` (`horarioEmpleadoIdHorarioEmpleado`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`horarioEmpleadoIdHorarioEmpleado`) REFERENCES `horarioempleado` (`idHorarioEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Datos` FOREIGN KEY (`datosEmpleadoIdDatosEmpleado`) REFERENCES `datosempleado` (`idDatosEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_Rol1` FOREIGN KEY (`rolIdRol`) REFERENCES `rol` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `empleado` */

insert  into `empleado`(`idEmpleado`,`cedulaEmpleado`,`nombreEmpleado`,`segundoNombreEmpleado`,`apellidoEmpleado`,`segundoApellidoEmpleado`,`rolIdRol`,`datosEmpleadoIdDatosEmpleado`,`horarioEmpleadoIdHorarioEmpleado`) values (3,'9999999','pedro',NULL,'Burgos',NULL,2,1,1),(8,'8888888','alexandra',NULL,'Jimenez',NULL,1,2,2),(10,'7777777','daniel',NULL,'muñoz',NULL,4,3,3),(11,'1111111','julian',NULL,'martinez',NULL,4,4,2),(13,'2222222','Yvonne',NULL,'Burgos',NULL,3,5,1);

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fechaFactura` datetime NOT NULL,
  `clienteIdCliente` int(11) NOT NULL,
  `Servicio_idServicio` int(11) NOT NULL,
  `totalFactura` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `fk_Factura_Cliente1` (`clienteIdCliente`),
  KEY `fk_Factura_Servicio1` (`Servicio_idServicio`),
  CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`clienteIdCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Factura_Reserva1` FOREIGN KEY (`Servicio_idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `factura` */

insert  into `factura`(`idFactura`,`fechaFactura`,`clienteIdCliente`,`Servicio_idServicio`,`totalFactura`) values (5,'2023-09-01 22:14:37',2,4,68000),(7,'2023-09-01 09:16:14',4,3,65000),(8,'2023-09-02 13:16:49',3,9,130000),(10,'2023-09-01 22:17:13',1,5,68000),(11,'2023-09-01 10:18:42',22,1,230000);

/*Table structure for table `facturacompra` */

DROP TABLE IF EXISTS `facturacompra`;

CREATE TABLE `facturacompra` (
  `idFacturaCompra` int(11) NOT NULL AUTO_INCREMENT,
  `precioTotalFC` decimal(10,0) NOT NULL,
  `fechaFC` date NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idFacturaCompra`),
  KEY `fk_FacturaOC_Proveedor1` (`Proveedor_idProveedor`),
  KEY `fk_Pedido_idPedido` (`Pedido_idPedido`),
  CONSTRAINT `fk_Factura_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_idPedido` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `facturacompra` */

insert  into `facturacompra`(`idFacturaCompra`,`precioTotalFC`,`fechaFC`,`Proveedor_idProveedor`,`Pedido_idPedido`) values (1,100000,'2023-07-19',6,1),(5,400000,'2023-07-27',2,2),(6,50000,'2023-08-25',3,3),(12,32000,'2023-08-28',4,4),(14,180000,'2023-08-31',5,6);

/*Table structure for table `habitacion` */

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `tipoHabitacion` enum('Sencilla','Doble','Especial') NOT NULL,
  `numeroHabitacion` int(11) NOT NULL,
  `detalleHabitacionIdDetalleHabitacion` int(11) NOT NULL,
  `servicio _idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idHabitacion`),
  UNIQUE KEY `numeroHabitacion` (`numeroHabitacion`),
  KEY `fk_Habitacion_DetalleHabitacion1` (`detalleHabitacionIdDetalleHabitacion`),
  KEY `fk_Habitacion_Servicio1` (`servicio _idServicio`),
  CONSTRAINT `fk_Habitacion_DetalleHabitacion1` FOREIGN KEY (`detalleHabitacionIdDetalleHabitacion`) REFERENCES `detallehabitacion` (`idDetalleHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitacion_Servicio1` FOREIGN KEY (`servicio _idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `habitacion` */

insert  into `habitacion`(`idHabitacion`,`tipoHabitacion`,`numeroHabitacion`,`detalleHabitacionIdDetalleHabitacion`,`servicio _idServicio`) values (1,'Sencilla',201,2,1),(2,'Especial',303,4,3),(3,'Sencilla',205,1,0),(4,'Doble',406,1,0),(5,'Doble',306,1,0),(6,'Doble',206,1,0),(10,'Sencilla',202,1,0),(11,'Sencilla',203,2,0),(12,'Especial',204,3,4),(13,'Sencilla',207,4,5),(14,'Especial',301,4,1),(15,'Sencilla',302,3,1),(18,'Especial',304,1,0),(19,'Sencilla',305,1,0),(20,'Sencilla',307,1,0),(21,'Especial',401,2,0),(22,'Sencilla',402,1,0),(23,'Especial',403,2,0),(24,'Sencilla',404,3,1),(25,'Sencilla',405,3,9),(27,'Sencilla',407,4,9);

/*Table structure for table `horarioempleado` */

DROP TABLE IF EXISTS `horarioempleado`;

CREATE TABLE `horarioempleado` (
  `idHorarioEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTurno` varchar(45) NOT NULL,
  `horaEntrada` time NOT NULL,
  `horaSalida` time NOT NULL,
  PRIMARY KEY (`idHorarioEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `horarioempleado` */

insert  into `horarioempleado`(`idHorarioEmpleado`,`nombreTurno`,`horaEntrada`,`horaSalida`) values (1,'Turno de 12','08:00:00','20:00:00'),(2,'Turno de la tarde','12:00:00','20:00:00'),(3,'Turno de la mañana ','08:00:00','12:00:00'),(4,'Turno de 24','08:00:00','08:00:00');

/*Table structure for table `huesped` */

DROP TABLE IF EXISTS `huesped`;

CREATE TABLE `huesped` (
  `idHuesped` int(11) NOT NULL AUTO_INCREMENT,
  `nombreHuesped` varchar(60) NOT NULL,
  `apellidoHuesped` varchar(60) NOT NULL,
  `tipoDocumentoHuesped` enum('CC','TI','CE') NOT NULL,
  `DocumentoHuesped` varchar(45) NOT NULL,
  `generoHuesped` enum('Masculino','Femenino','Otro') NOT NULL,
  `parentesco` enum('Pareja','Hijo','Hija','Familiar','Amigo','Empleado') NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idHuesped`),
  UNIQUE KEY `DocumentoHuesped` (`DocumentoHuesped`),
  KEY `Cliente_idCliente` (`Cliente_idCliente`),
  CONSTRAINT `huesped_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `huesped` */

insert  into `huesped`(`idHuesped`,`nombreHuesped`,`apellidoHuesped`,`tipoDocumentoHuesped`,`DocumentoHuesped`,`generoHuesped`,`parentesco`,`Cliente_idCliente`) values (1,'Juan','Pérez','TI','1026754562','Masculino','Hijo',22),(2,'Sofía','Rodríguez','CC','1234567890','Femenino','Hija',22),(3,'Alejandro','González','CC','9876543210','Masculino','Pareja',22),(4,'Valentina','Pérez','TI','5551234567','Masculino','Hija',22),(5,'Marta','Martínez','CC','7865432109','Femenino','Pareja',4),(6,'Isabella','López','CC','5127893456','Femenino','Pareja',2),(7,'Mateo','Sánchez','CC','6452378910','Masculino','Pareja',1),(8,'Emma','Fernández','CC','2314567890','Femenino','Pareja',3),(9,'Diego','Burgos','TI','8901234567','Masculino','Hijo',3),(10,'Camilo','Torres','CC','7654321098','Masculino','Empleado',32),(11,'Maicol','Useche','CC','1156463521','Masculino','Empleado',32);

/*Table structure for table `infoproveedor` */

DROP TABLE IF EXISTS `infoproveedor`;

CREATE TABLE `infoproveedor` (
  `idInfoProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `telefonoProveedor` varchar(10) NOT NULL,
  `correoProveedor` varchar(45) NOT NULL,
  `producto` varchar(45) NOT NULL,
  `categoriaProveedor` enum('Aseo','Textil','Electricidad','Electrónica','Bebidas','Bebidas alcoholicas','Gas','Agua negras','Agua potable','Internet','Televisión','Aseo urbano','Comestibles') NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  PRIMARY KEY (`idInfoProveedor`,`correoProveedor`,`producto`,`categoriaProveedor`,`Proveedor_idProveedor`),
  KEY `Proveedor_idProveedor` (`Proveedor_idProveedor`),
  CONSTRAINT `infoproveedor_ibfk_1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `infoproveedor` */

insert  into `infoproveedor`(`idInfoProveedor`,`telefonoProveedor`,`correoProveedor`,`producto`,`categoriaProveedor`,`Proveedor_idProveedor`) values (1,'3226543210','ritz@gmail.com','Papel higiénico ','Aseo',1),(2,'3224567890','proveedor2@gmail.com','Toallas','Textil',2),(3,'3225309124','proveedor3@gmail.com','Bombillas','Electricidad',3),(4,'3228135790','proveedor4@gmail.com','Gaseosa','Bebidas',4),(5,'3224444332','proveedor5@gmail.com','Cerveza','Bebidas alcoholicas',5),(6,'3228889990','proveedor6@gmail.com','Internet','Internet',6),(7,'3227890123','proveedor7@gmail.com','Tendido','Textil',2);

/*Table structure for table `mantenimiento` */

DROP TABLE IF EXISTS `mantenimiento`;

CREATE TABLE `mantenimiento` (
  `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoMantenimiento` enum('Electricidad','Pintura','Tubería','Cama','Otro') NOT NULL,
  `fechaMantenimiento` date NOT NULL,
  `costoMantenimiento` decimal(10,0) NOT NULL,
  `motivoMantenimiento` enum('De prevención','De rutina','Reemplazo de item dañado') NOT NULL,
  `empleadoIdEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idMantenimiento`),
  KEY `fk_Mantenimiento_Empleado1` (`empleadoIdEmpleado`),
  CONSTRAINT `fk_Mantenimiento_Empleado1` FOREIGN KEY (`empleadoIdEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mantenimiento` */

insert  into `mantenimiento`(`idMantenimiento`,`tipoMantenimiento`,`fechaMantenimiento`,`costoMantenimiento`,`motivoMantenimiento`,`empleadoIdEmpleado`) values (1,'Electricidad','2023-07-01',150000,'Reemplazo de item dañado',10),(2,'Cama','2023-07-04',400000,'De rutina',11),(3,'Pintura','2023-07-10',250000,'De rutina',11),(4,'Tubería','2023-07-14',150000,'Reemplazo de item dañado',10),(5,'Otro','2023-07-12',200000,'De prevención',11);

/*Table structure for table `mantenimientohabitacion` */

DROP TABLE IF EXISTS `mantenimientohabitacion`;

CREATE TABLE `mantenimientohabitacion` (
  `idMantenimientoHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `mantenimientoIdMantenimiento` int(11) NOT NULL,
  `habitacionIdHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`idMantenimientoHabitacion`),
  KEY `fk_Mantenimiento_has_Habitacion_Mantenimiento1` (`mantenimientoIdMantenimiento`),
  KEY `fk_Mantenimiento_has_Habitacion_Habitacion1` (`habitacionIdHabitacion`),
  CONSTRAINT `fk_Mantenimiento_has_Habitacion_Habitacion1` FOREIGN KEY (`habitacionIdHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mantenimiento_has_Habitacion_Mantenimiento1` FOREIGN KEY (`mantenimientoIdMantenimiento`) REFERENCES `mantenimiento` (`idMantenimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `mantenimientohabitacion` */

insert  into `mantenimientohabitacion`(`idMantenimientoHabitacion`,`mantenimientoIdMantenimiento`,`habitacionIdHabitacion`) values (1,3,2),(2,2,5),(3,4,1),(4,5,3),(5,4,3);

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `conceptoPedido` varchar(45) NOT NULL,
  `fechaPedido` date NOT NULL,
  `fechaEntregaPedido` date NOT NULL,
  `empleadoIdEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_OrdenDeCompra_Empleado1` (`empleadoIdEmpleado`),
  CONSTRAINT `fk_OrdenDeCompra_Empleado1` FOREIGN KEY (`empleadoIdEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pedido` */

insert  into `pedido`(`idPedido`,`conceptoPedido`,`fechaPedido`,`fechaEntregaPedido`,`empleadoIdEmpleado`) values (1,'Pedido de 20 toallas','2023-07-12','2023-07-19',8),(2,'Pedido de 4 paquetes de papel higiénico ','2023-07-20','2023-07-27',8),(3,'Pedido de 10 bombillas','2023-07-18','2023-08-25',8),(4,'Pedido de 16 gaseosas Postobon manzana','2023-07-21','2023-08-28',8),(6,'Pedido de 10 six packs de cerveza Póker','2023-08-24','2023-08-31',8);

/*Table structure for table `pqrs` */

DROP TABLE IF EXISTS `pqrs`;

CREATE TABLE `pqrs` (
  `idPQRs` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPQR` enum('Pregunta','Queja','Reclamo','Sugerencia') NOT NULL,
  `descripcionPQRs` varchar(500) NOT NULL,
  `estadoPQRs` enum('Recibida','En proceso','Solucionada') NOT NULL,
  `clienteIdCliente` int(11) NOT NULL,
  PRIMARY KEY (`idPQRs`),
  KEY `fk_PQRs_Cliente1` (`clienteIdCliente`),
  CONSTRAINT `fk_PQRs_Cliente1` FOREIGN KEY (`clienteIdCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pqrs` */

insert  into `pqrs`(`idPQRs`,`tipoPQR`,`descripcionPQRs`,`estadoPQRs`,`clienteIdCliente`) values (1,'Pregunta','¿Cómo me puedo comunicar con el gerente?','En proceso',1),(3,'Pregunta','Solicitud de numero de contacto.','Recibida',2),(4,'Pregunta','Solicitud de numero de contacto.','Solucionada',3),(6,'Queja','Mala atención al cliente','En proceso',1),(7,'Queja','Mala atención al cliente','Recibida',4),(8,'Queja','Mala atención al cliente','Solucionada',3),(10,'Reclamo','Reclamo de objeto perdido','En proceso',1),(14,'Reclamo','Reclamo de objeto perdido','Recibida',2),(16,'Reclamo','Reclamo de objeto perdido','Solucionada',3),(17,'Sugerencia','Añadan buffles','En proceso',1),(18,'Sugerencia','Añadan buffles','Recibida',2),(20,'Sugerencia','Añadan buffles','Solucionada',4);

/*Table structure for table `privilegio_por_rol` */

DROP TABLE IF EXISTS `privilegio_por_rol`;

CREATE TABLE `privilegio_por_rol` (
  `idPrivilegioPorRol` int(11) NOT NULL AUTO_INCREMENT,
  `fechaAsignacion` datetime NOT NULL,
  `Privilegio_idProvilegio` int(11) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`idPrivilegioPorRol`),
  KEY `Privilegio_idProvilegio` (`Privilegio_idProvilegio`),
  KEY `Rol_idRol` (`Rol_idRol`),
  CONSTRAINT `privilegio_por_rol_ibfk_1` FOREIGN KEY (`Privilegio_idProvilegio`) REFERENCES `privilegios` (`idPrivilegio`),
  CONSTRAINT `privilegio_por_rol_ibfk_2` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `privilegio_por_rol` */

insert  into `privilegio_por_rol`(`idPrivilegioPorRol`,`fechaAsignacion`,`Privilegio_idProvilegio`,`Rol_idRol`) values (1,'2023-09-09 15:00:00',1,1),(2,'2023-09-09 15:00:00',2,1),(3,'2023-09-09 15:00:00',3,1),(4,'2023-09-09 15:00:00',4,1),(5,'2023-09-09 15:00:00',1,2),(6,'2023-09-09 15:00:00',3,2),(7,'2023-09-09 15:00:00',1,3),(8,'2023-09-09 15:00:00',1,4);

/*Table structure for table `privilegios` */

DROP TABLE IF EXISTS `privilegios`;

CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePrivilegio` varchar(50) NOT NULL,
  `estadoPrivilegio` enum('Activo','No activo') NOT NULL,
  PRIMARY KEY (`idPrivilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `privilegios` */

insert  into `privilegios`(`idPrivilegio`,`nombrePrivilegio`,`estadoPrivilegio`) values (1,'SELECT','Activo'),(2,'DELETE','Activo'),(3,'INSERT','Activo'),(4,'UPDATE','Activo');

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(60) NOT NULL,
  `valorProducto` decimal(10,0) NOT NULL,
  `codigoProducto` varchar(60) NOT NULL,
  `cantidadProducto` int(11) NOT NULL,
  `categoriaIdCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `codigoProducto` (`codigoProducto`),
  KEY `fk_Producto_Categoria1` (`categoriaIdCategoria`),
  CONSTRAINT `fk_Producto_Categoria1` FOREIGN KEY (`categoriaIdCategoria`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`nombreProducto`,`valorProducto`,`codigoProducto`,`cantidadProducto`,`categoriaIdCategoria`) values (1,'papasBBQ',4000,'PBBQ-1',50,1),(2,'cocacola',25000,'CC-2',10,2),(3,'postobon manzana',25000,'PM-3',10,2),(4,'cloro',15000,'C-4',15,4),(5,'sabana',65000,'S-5',35,3),(6,'detergente',40000,'DE-6',8,4),(7,'chocorramo',2500,'CH-7',60,1),(8,'jabon',3000,'J-8',14,4),(9,'lampara',10000,'LAM-10',32,5),(10,'lavadora',900000,'LA-10',2,5),(11,'suavizante',13000,'SU-11',5,4),(12,'control remoto',10000,'CR-12',23,5),(18,'televisor',500000,'TE-11',21,5),(19,'cama de madera',750000,'CDM-12',13,7),(21,'cama de cemento',550000,'CMDC-13',8,7),(25,'Cubrelecho',60000,'CL-22',10,3),(27,'Servicio de internet',0,'111-INT',0,8),(28,'Toallas',20000,'TOA-500',60,3),(30,'Bombilla',5000,'BOM-789',30,5),(31,'Cerveza',4000,'CER-965',20,6);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProveedor` varchar(45) NOT NULL,
  `NITProveedor` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `NITProveedor` (`NITProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`idProveedor`,`nombreProveedor`,`NITProveedor`) values (1,'Ritz','10000'),(2,'Toallas XCV','20000'),(3,'Eléctricas WED ','30000'),(4,'Gaseosas FGH','40000'),(5,'Alcoholes ','50000'),(6,'MultiTV','60000');

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `nameRol` varchar(80) NOT NULL,
  `contrasenaRol` varchar(80) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `contrasenaRol` (`contrasenaRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `rol` */

insert  into `rol`(`idRol`,`nameRol`,`contrasenaRol`) values (1,'Gerente','contraseñaA'),(2,'Recepcionista','contraseñaR'),(3,'Camarera','contraseñaC'),(4,'Mantenimiento','contraseñaP');

/*Table structure for table `servicio` */

DROP TABLE IF EXISTS `servicio`;

CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tipoServicio` enum('Servico normal','Reserva') NOT NULL,
  `medioDePagoServicio` enum('Tarjeta','Efectivo','Transferencia','Otro') NOT NULL,
  `empleadoIdEmpleado` int(11) NOT NULL,
  `checkIn` datetime NOT NULL,
  `checkOut` datetime NOT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `fk_Reserva_Empleado1` (`empleadoIdEmpleado`),
  CONSTRAINT `fk_Reserva_Empleado1` FOREIGN KEY (`empleadoIdEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `servicio` */

insert  into `servicio`(`idServicio`,`tipoServicio`,`medioDePagoServicio`,`empleadoIdEmpleado`,`checkIn`,`checkOut`) values (1,'','Efectivo',3,'2023-09-01 09:22:21','2023-09-02 12:22:41'),(3,'','Efectivo',8,'2023-09-01 08:23:00','2023-09-02 10:23:08'),(4,'','Tarjeta',3,'2023-09-01 21:23:19','2023-09-02 12:23:30'),(5,'','Efectivo',3,'2023-09-01 22:23:39','2023-09-02 13:23:49'),(9,'','Tarjeta',8,'2023-09-02 12:23:57','2023-09-03 11:24:03'),(12,'','Efectivo',8,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `vehiculo` */

DROP TABLE IF EXISTS `vehiculo`;

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `placaVehiculo` varchar(10) NOT NULL,
  `modeloVehiculo` varchar(45) NOT NULL,
  `Cliente_idCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `Cliente_idCliente` (`Cliente_idCliente`),
  CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `vehiculo` */

insert  into `vehiculo`(`idVehiculo`,`placaVehiculo`,`modeloVehiculo`,`Cliente_idCliente`) values (1,'IYU-895','Spark',22);

/* Procedure structure for procedure `sp_actualizar_detalleFactura` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_actualizar_detalleFactura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_detalleFactura`(in idDetalle int, in idFactura int)
BEGIN
	UPDATE detallefactura SET totalDetalle=precioPorHabitación*cantidadHabitaciones+precioUnitarioCA*cantidadCA
	where idDetalleFactura=idDetalle and facturaIdFactura=idFactura;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_actualizar_totalFactura` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_actualizar_totalFactura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_totalFactura`(in fkDetalle int, in idFactura int)
BEGIN
	UPDATE factura 
	SET totalFactura=(SELECT SUM(totalDetalle) 
			  FROM detallefactura 
			  WHERE facturaIdFactura=fkDetalle)
	WHERE factura.idFactura=idFactura;
	SELECT * FROM factura;
    END */$$
DELIMITER ;

/*Table structure for table `vista_empleados` */

DROP TABLE IF EXISTS `vista_empleados`;

/*!50001 DROP VIEW IF EXISTS `vista_empleados` */;
/*!50001 DROP TABLE IF EXISTS `vista_empleados` */;

/*!50001 CREATE TABLE  `vista_empleados`(
 `cedulaEmpleado` varchar(45) ,
 `nombreEmpleado` varchar(50) ,
 `apellidoEmpleado` varchar(50) ,
 `correoEmpleado` varchar(60) ,
 `telefonoEmpleado` varchar(10) ,
 `nameRol` varchar(80) ,
 `nombreTurno` varchar(45) ,
 `horaEntrada` time ,
 `horaSalida` time ,
 `tipoSueldo` enum('Semanal','Quincenal','Mensual') ,
 `sueldoEmpleado` decimal(10,0) 
)*/;

/*Table structure for table `vista_facturas_clientes` */

DROP TABLE IF EXISTS `vista_facturas_clientes`;

/*!50001 DROP VIEW IF EXISTS `vista_facturas_clientes` */;
/*!50001 DROP TABLE IF EXISTS `vista_facturas_clientes` */;

/*!50001 CREATE TABLE  `vista_facturas_clientes`(
 `cedulaCliente` varchar(20) ,
 `nombreCliente` varchar(50) ,
 `apellidoCliente` varchar(50) ,
 `idFactura` int(11) ,
 `fechaFactura` datetime ,
 `totalFactura` decimal(10,0) ,
 `idDetalle_Factura` int(11) ,
 `nombreProducto` varchar(60) ,
 `cantidadCA` int(11) ,
 `precioUnitarioCA` decimal(10,0) ,
 `precioPorHabitación` decimal(10,0) ,
 `cantidadHabitaciones` int(11) 
)*/;

/*Table structure for table `vista_pedidos_facturas` */

DROP TABLE IF EXISTS `vista_pedidos_facturas`;

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_facturas` */;
/*!50001 DROP TABLE IF EXISTS `vista_pedidos_facturas` */;

/*!50001 CREATE TABLE  `vista_pedidos_facturas`(
 `idFacturaCompra` int(11) ,
 `fechaFC` date ,
 `precioTotalFC` decimal(10,0) ,
 `idDetalleFacturaCompra` int(11) ,
 `nombreProducto` varchar(60) ,
 `cantidadProducto` int(11) ,
 `precioUnitario` decimal(11,0) ,
 `conceptoPedido` varchar(45) ,
 `fechaPedido` date ,
 `nombreProveedor` varchar(45) ,
 `NITProveedor` varchar(45) ,
 `categoriaProveedor` enum('Aseo','Textil','Electricidad','Electrónica','Bebidas','Bebidas alcoholicas','Gas','Agua negras','Agua potable','Internet','Televisión','Aseo urbano','Comestibles') 
)*/;

/*View structure for view vista_empleados */

/*!50001 DROP TABLE IF EXISTS `vista_empleados` */;
/*!50001 DROP VIEW IF EXISTS `vista_empleados` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados` AS (select `empleado`.`cedulaEmpleado` AS `cedulaEmpleado`,`empleado`.`nombreEmpleado` AS `nombreEmpleado`,`empleado`.`apellidoEmpleado` AS `apellidoEmpleado`,`datosempleado`.`correoEmpleado` AS `correoEmpleado`,`datosempleado`.`telefonoEmpleado` AS `telefonoEmpleado`,`rol`.`nameRol` AS `nameRol`,`horarioempleado`.`nombreTurno` AS `nombreTurno`,`horarioempleado`.`horaEntrada` AS `horaEntrada`,`horarioempleado`.`horaSalida` AS `horaSalida`,`datosempleado`.`tipoSueldo` AS `tipoSueldo`,`datosempleado`.`sueldoEmpleado` AS `sueldoEmpleado` from (((`empleado` join `rol` on(`empleado`.`rolIdRol` = `rol`.`idRol`)) join `horarioempleado` on(`empleado`.`horarioEmpleadoIdHorarioEmpleado` = `horarioempleado`.`idHorarioEmpleado`)) join `datosempleado` on(`empleado`.`datosEmpleadoIdDatosEmpleado` = `datosempleado`.`idDatosEmpleado`))) */;

/*View structure for view vista_facturas_clientes */

/*!50001 DROP TABLE IF EXISTS `vista_facturas_clientes` */;
/*!50001 DROP VIEW IF EXISTS `vista_facturas_clientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_facturas_clientes` AS (select `cliente`.`cedulaCliente` AS `cedulaCliente`,`cliente`.`nombreCliente` AS `nombreCliente`,`cliente`.`apellidoCliente` AS `apellidoCliente`,`factura`.`idFactura` AS `idFactura`,`factura`.`fechaFactura` AS `fechaFactura`,`factura`.`totalFactura` AS `totalFactura`,`detallefactura`.`idDetalle_Factura` AS `idDetalle_Factura`,`producto`.`nombreProducto` AS `nombreProducto`,`detallefactura`.`cantidadCA` AS `cantidadCA`,`detallefactura`.`precioUnitarioCA` AS `precioUnitarioCA`,`detallefactura`.`precioPorHabitación` AS `precioPorHabitación`,`detallefactura`.`cantidadHabitaciones` AS `cantidadHabitaciones` from (((`cliente` join `factura` on(`cliente`.`idCliente` = `factura`.`clienteIdCliente`)) join `detallefactura` on(`factura`.`idFactura` = `detallefactura`.`facturaIdFactura`)) join `producto` on(`detallefactura`.`ProductoidProducto` = `producto`.`idProducto`))) */;

/*View structure for view vista_pedidos_facturas */

/*!50001 DROP TABLE IF EXISTS `vista_pedidos_facturas` */;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_facturas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidos_facturas` AS (select `facturacompra`.`idFacturaCompra` AS `idFacturaCompra`,`facturacompra`.`fechaFC` AS `fechaFC`,`facturacompra`.`precioTotalFC` AS `precioTotalFC`,`detallefacturacompra`.`idDetalleFacturaCompra` AS `idDetalleFacturaCompra`,`producto`.`nombreProducto` AS `nombreProducto`,`detallefacturacompra`.`cantidadProducto` AS `cantidadProducto`,`detallefacturacompra`.`precioUnitario` AS `precioUnitario`,`pedido`.`conceptoPedido` AS `conceptoPedido`,`pedido`.`fechaPedido` AS `fechaPedido`,`proveedor`.`nombreProveedor` AS `nombreProveedor`,`proveedor`.`NITProveedor` AS `NITProveedor`,`infoproveedor`.`categoriaProveedor` AS `categoriaProveedor` from (((((`facturacompra` join `pedido` on(`facturacompra`.`Pedido_idPedido` = `pedido`.`idPedido`)) join `detallefacturacompra` on(`detallefacturacompra`.`FacturaCompra_idFacturaCompra` = `facturacompra`.`idFacturaCompra`)) join `producto` on(`detallefacturacompra`.`Producto_idProducto` = `producto`.`idProducto`)) join `proveedor` on(`facturacompra`.`Proveedor_idProveedor` = `proveedor`.`idProveedor`)) join `infoproveedor` on(`proveedor`.`idProveedor` = `infoproveedor`.`Proveedor_idProveedor`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
