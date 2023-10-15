/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.28-MariaDB : Database - sjreal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sjreal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sjreal`;

/*Table structure for table `cliente_de` */

DROP TABLE IF EXISTS `cliente_de`;

CREATE TABLE `cliente_de` (
  `idCliente_De` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `fecha_Inicio_Actividades` date NOT NULL,
  `antiguedad_actividades` int(11) NOT NULL,
  PRIMARY KEY (`idCliente_De`),
  KEY `fk_Sucursal_has_Proveedor_Sucursal1` (`Sucursal_id_Sucursal`),
  KEY `fk_Sucursal_has_Proveedor_Proveedor1` (`Proveedor_idProveedor`),
  CONSTRAINT `fk_Sucursal_has_Proveedor_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Proveedor_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `cliente_de` */

insert  into `cliente_de`(`idCliente_De`,`Sucursal_id_Sucursal`,`Proveedor_idProveedor`,`fecha_Inicio_Actividades`,`antiguedad_actividades`) values (1,1,3,'2020-12-05',2),(2,2,3,'2020-12-05',2),(3,3,3,'2019-06-20',4),(4,1,1,'2020-12-05',2),(5,2,1,'2020-12-05',2),(6,3,1,'2019-06-20',4),(7,1,2,'2020-12-05',2),(8,2,2,'2020-12-05',2),(9,3,2,'2019-06-20',4);

/*Table structure for table `control_salida` */

DROP TABLE IF EXISTS `control_salida`;

CREATE TABLE `control_salida` (
  `idControl` int(11) NOT NULL AUTO_INCREMENT,
  `Rol_Empleado_idRol_Empleado` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  `concepto_Salida` varchar(150) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idControl`),
  KEY `fk_control_salida_rol_empleado1` (`Rol_Empleado_idRol_Empleado`),
  KEY `fk_control_salida_inventario` (`Inventario_idInventario`),
  CONSTRAINT `fk_control_salida_inventario` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_salida_rol_empleado1` FOREIGN KEY (`Rol_Empleado_idRol_Empleado`) REFERENCES `rol_empleado` (`idRol_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `control_salida` */

/*Table structure for table `detalle_mantenimiento` */

DROP TABLE IF EXISTS `detalle_mantenimiento`;

CREATE TABLE `detalle_mantenimiento` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `fecha_Mantenimiento` date NOT NULL,
  `descripcion_Mantenimiento` varchar(200) NOT NULL,
  `nombre_Mantenimiento` varchar(50) NOT NULL,
  `tipo_Mantenimiento` enum('Mejora','Reparación','Saneamineto') NOT NULL,
  `Rol_Empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_Detalle_Habitacion` (`Habitacion_idHabitacion`),
  KEY `Rol_Empleado_id` (`Rol_Empleado_id`),
  CONSTRAINT `detalle_mantenimiento_ibfk_1` FOREIGN KEY (`Rol_Empleado_id`) REFERENCES `rol_empleado` (`idRol_Empleado`),
  CONSTRAINT `fk_Detalle_Habitacion` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle_mantenimiento` */

/*Table structure for table `detalle_pago` */

DROP TABLE IF EXISTS `detalle_pago`;

CREATE TABLE `detalle_pago` (
  `id_Detalle_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Pago_idPago` int(11) NOT NULL,
  `precio_Por_Dia_Hospedado` decimal(10,0) NOT NULL,
  `precio_Total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_Detalle_Pago`),
  KEY `fk_Producto_has_Pago_Pago1` (`Pago_idPago`),
  CONSTRAINT `fk_Producto_has_Pago_Pago1` FOREIGN KEY (`Pago_idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `detalle_pago` */

/*Table structure for table `detallepedido` */

DROP TABLE IF EXISTS `detallepedido`;

CREATE TABLE `detallepedido` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_Producto` int(11) NOT NULL,
  `precio_unitario` decimal(11,2) NOT NULL,
  `precio_Total` decimal(11,2) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_detallePedido_Pedido1` (`Pedido_idPedido`),
  KEY `fk_detallePedido_Inventario1` (`Inventario_idInventario`),
  CONSTRAINT `fk_detallePedido_Inventario1` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallePedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`IdPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detallepedido` */

/*Table structure for table `dueño` */

DROP TABLE IF EXISTS `dueño`;

CREATE TABLE `dueño` (
  `idDueño` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_Dueño` varchar(15) NOT NULL,
  `primer_Nombre_Dueño` varchar(40) NOT NULL,
  `segundo_Nombre_Dueño` varchar(40) DEFAULT NULL,
  `primer_Apellido_Dueño` varchar(45) NOT NULL,
  `segundo_Apellido_Dueño` varchar(45) DEFAULT NULL,
  `tipo_Documento_Dueño` enum('CC','CE','TI','Pasaporte') NOT NULL,
  `fecha_Nacimiento_Dueño` date NOT NULL,
  `edad_Dueño` int(11) NOT NULL,
  `telefono_Dueño` varchar(15) NOT NULL,
  `correo_Dueño` varchar(50) NOT NULL,
  `porcentaje_Participacion` decimal(10,0) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`idDueño`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `dueño` */

insert  into `dueño`(`idDueño`,`cedula_Dueño`,`primer_Nombre_Dueño`,`segundo_Nombre_Dueño`,`primer_Apellido_Dueño`,`segundo_Apellido_Dueño`,`tipo_Documento_Dueño`,`fecha_Nacimiento_Dueño`,`edad_Dueño`,`telefono_Dueño`,`correo_Dueño`,`porcentaje_Participacion`,`nacionalidad`) values (1,'1122334455','Juan','Carlos','Gomez','Perez','CC','1980-05-15',41,'311-222-3344','juan@example.com',50,'Colombiana'),(2,'2233445566','Maria','Elena','Rodriguez','Lopez','CC','1975-10-20',46,'322-333-4445','maria@example.com',30,'Colombiana'),(3,'3344556677','Carlos','Antonio','Perez','Gonzalez','CE','1985-03-25',36,'300-111-2223','carlos@example.com',20,'Ecuatoriana'),(4,'4455667788','Luisa','Fernanda','Ramirez','Castro','CC','1990-12-10',31,'310-555-6667','luisa@example.com',60,'Colombiana'),(5,'5566778899','Javier','Alejandro','Torres','Hernandez','CC','1978-07-05',43,'315-777-8889','javier@example.com',40,'Colombiana'),(6,'1122334455','José','Carlos','Chiguasuque','Perez','CC','1980-05-15',41,'311-222-3344','jose@example.com',100,'Colombiana');

/*Table structure for table `empleado` */

DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_Empleado` varchar(15) NOT NULL,
  `tipo_Documento` enum('CC','CE','TI','Pasaporte') NOT NULL,
  `fecha_Nacimiento` date NOT NULL,
  `edad_Empleado` int(11) NOT NULL,
  `correo_Empleado` varchar(45) NOT NULL,
  `telefono_Empleado` varchar(10) NOT NULL,
  `primer_Nombre_Empleado` varchar(45) NOT NULL,
  `segundo_Nombre_Empleado` varchar(45) DEFAULT NULL,
  `primer_Apellido_Empleado` varchar(45) NOT NULL,
  `segundo_Apellido_Empleado` varchar(45) DEFAULT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `empleado` */

insert  into `empleado`(`idEmpleado`,`cedula_Empleado`,`tipo_Documento`,`fecha_Nacimiento`,`edad_Empleado`,`correo_Empleado`,`telefono_Empleado`,`primer_Nombre_Empleado`,`segundo_Nombre_Empleado`,`primer_Apellido_Empleado`,`segundo_Apellido_Empleado`,`nacionalidad`) values (1,'1122334455','CC','1990-05-15',31,'empleado1@example.com','311-222-33','Juan','Carlos','Gomez','Perez','Colombiana'),(2,'2233445566','CC','1985-10-20',36,'empleado2@example.com','322-333-44','Maria','Elena','Rodriguez','Lopez','Colombiana'),(3,'3344556677','CE','1995-03-25',26,'empleado3@example.com','300-111-22','Carlos','Antonio','Perez','Gonzalez','Ecuatoriana'),(4,'4455667788','CC','1980-12-10',41,'empleado4@example.com','310-555-66','Luisa','Fernanda','Ramirez','Castro','Colombiana'),(5,'5566778899','CC','1975-07-05',46,'empleado5@example.com','315-777-88','Javier','Alejandro','Torres','Hernandez','Colombiana'),(6,'5566778890','CC','1993-08-12',28,'empleado5@example.com','315-777-88','Ana','Isabel','Gonzalez','Ramirez','Colombiana'),(7,'6677889900','CE','1987-02-28',34,'empleado6@example.com','321-888-99','Pedro','Luis','Silva','Santos','Venezolana'),(8,'7788990011','CC','1998-11-05',23,'empleado7@example.com','318-999-00','Marcela','Camila','Perez','Gomez','Colombiana'),(9,'8899001122','CC','1983-04-22',38,'empleado8@example.com','317-111-22','Andres','Felipe','Torres','Lopez','Colombiana'),(10,'9900112233','CE','1991-09-30',30,'empleado9@example.com','319-222-33','Alejandro','Jose','Gutierrez','Mendoza','Ecuatoriana'),(11,'0011223344','CC','1989-06-17',32,'empleado10@example.com','316-333-44','Camilo','Andres','Sanchez','Rojas','Colombiana'),(12,'1122334455','TI','2000-01-01',21,'empleado11@example.com','313-444-55','Marta','Luz','Mendez','Pardo','Colombiana');

/*Table structure for table `habitacion` */

DROP TABLE IF EXISTS `habitacion`;

CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `numero_Habitacion` varchar(3) NOT NULL,
  `descripcion _Habitacion` varchar(500) NOT NULL,
  `tipo_Habitacion` enum('Sencilla','Doble','Para pareja') NOT NULL,
  `capacidad_Habitacion` int(11) NOT NULL,
  `precio_Habitacion` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idHabitacion`),
  KEY `fk_Habitacion_Sucursal1` (`Sucursal_id_Sucursal`),
  CONSTRAINT `fk_Habitacion_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `habitacion` */

insert  into `habitacion`(`idHabitacion`,`Sucursal_id_Sucursal`,`numero_Habitacion`,`descripcion _Habitacion`,`tipo_Habitacion`,`capacidad_Habitacion`,`precio_Habitacion`) values (1,1,'101','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(2,1,'102','Habitación Doble con vista al balcón','Doble',4,120000),(3,1,'103','Habitación Doble con vista al balcón','Doble',4,120000),(4,1,'104','Habitación Doble con vista al balcón','Doble',4,120000),(5,1,'105','Habitación Doble con vista al balcón','Doble',4,120000),(6,1,'106','Habitación Doble con vista al balcón','Doble',4,120000),(7,1,'107','Habitación Doble con vista al balcón','Doble',4,120000),(8,1,'201','Habitación Para pareja con balcón','Para pareja',2,60000),(9,1,'202','Habitación Para pareja con balcón','Para pareja',2,60000),(10,1,'203','Habitación Para pareja con balcón','Para pareja',2,60000),(11,1,'204','Habitación Para pareja con balcón','Para pareja',2,60000),(12,1,'205','Habitación Para pareja con balcón','Para pareja',2,60000),(13,1,'206','Habitación Para pareja con balcón','Para pareja',2,60000),(14,1,'207','Habitación Para pareja con balcón','Para pareja',2,60000),(15,1,'301','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(16,1,'302','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(17,1,'303','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(18,1,'304','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(19,1,'305','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(20,1,'306','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(21,1,'307','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(22,1,'401','Habitación Doble con vista al balcón','Doble',4,120000),(23,1,'402','Habitación Doble con vista al balcón','Doble',4,120000),(24,1,'403','Habitación Doble con vista al balcón','Doble',4,120000),(25,1,'404','Habitación Doble con vista al balcón','Doble',4,120000),(26,1,'405','Habitación Doble con vista al balcón','Doble',4,120000),(27,1,'406','Habitación Doble con vista al balcón','Doble',4,120000),(28,1,'407','Habitación Doble con vista al balcón','Doble',4,120000),(29,2,'201','Habitación Sencilla con balcón','Sencilla',1,50000),(30,2,'202','Habitación Sencilla con balcón','Sencilla',1,50000),(31,2,'203','Habitación Sencilla con balcón','Sencilla',1,50000),(32,2,'204','Habitación Sencilla con balcón','Sencilla',1,50000),(33,2,'205','Habitación Sencilla con balcón','Sencilla',1,50000),(34,2,'206','Habitación Sencilla con balcón','Sencilla',1,50000),(35,2,'207','Habitación Sencilla con balcón','Sencilla',1,50000),(36,2,'301','Habitación Doble con balcón','Doble',4,120000),(37,2,'302','Habitación Doble con balcón','Doble',4,120000),(38,2,'303','Habitación Doble con balcón','Doble',4,120000),(39,2,'304','Habitación Doble con balcón','Doble',4,120000),(40,2,'305','Habitación Doble con balcón','Doble',4,120000),(41,2,'306','Habitación Doble con balcón','Doble',4,120000),(42,2,'307','Habitación Doble con balcón','Doble',4,120000),(43,2,'401','Habitación Para pareja con balcón','Para pareja',2,60000),(44,2,'402','Habitación Para pareja con balcón','Para pareja',2,60000),(45,2,'403','Habitación Para pareja con balcón','Para pareja',2,60000),(46,2,'404','Habitación Para pareja con balcón','Para pareja',2,60000),(47,2,'405','Habitación Para pareja con balcón','Para pareja',2,60000),(48,2,'406','Habitación Para pareja con balcón','Para pareja',2,60000),(49,2,'407','Habitación Para pareja con balcón','Para pareja',2,60000),(50,3,'101','Habitación Sencilla con balcón','Sencilla',1,50000),(51,3,'102','Habitación Sencilla con balcón','Sencilla',1,50000),(52,3,'103','Habitación Sencilla con balcón','Sencilla',1,50000),(53,3,'104','Habitación Sencilla con balcón','Sencilla',1,50000),(54,3,'105','Habitación Sencilla con balcón','Sencilla',1,50000),(55,3,'106','Habitación Sencilla con balcón','Sencilla',1,50000),(56,3,'107','Habitación Sencilla con balcón','Sencilla',1,50000),(57,3,'201','Habitación Doble con balcón','Doble',4,120000),(58,3,'202','Habitación Doble con balcón','Doble',4,120000),(59,3,'203','Habitación Doble con balcón','Doble',4,120000),(60,3,'204','Habitación Doble con balcón','Doble',4,120000),(61,3,'205','Habitación Doble con balcón','Doble',4,120000),(62,3,'206','Habitación Doble con balcón','Doble',4,120000),(63,3,'207','Habitación Doble con balcón','Doble',4,120000),(64,3,'301','Habitación Para pareja con balcón','Para pareja',2,60000),(65,3,'302','Habitación Para pareja con balcón','Para pareja',2,60000),(66,3,'303','Habitación Para pareja con balcón','Para pareja',2,60000),(67,3,'304','Habitación Para pareja con balcón','Para pareja',2,60000),(68,3,'305','Habitación Para pareja con balcón','Para pareja',2,60000);

/*Table structure for table `hospedaje` */

DROP TABLE IF EXISTS `hospedaje`;

CREATE TABLE `hospedaje` (
  `idHospedaje` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `Huesped_idHuesped` int(11) NOT NULL,
  `checkIn_Hospedaje` datetime(2) NOT NULL,
  `checkOut_Hospedaje` datetime(2) NOT NULL,
  `tipo_Hospedaje` enum('Reserva','Hospedaje normal') NOT NULL,
  `codigo_Hospedaje` int(11) NOT NULL,
  PRIMARY KEY (`idHospedaje`),
  KEY `fk_Habitacion_has_Huesped_Habitacion1` (`Habitacion_idHabitacion`),
  KEY `fk_Habitacion_has_Huesped_Huesped1` (`Huesped_idHuesped`),
  CONSTRAINT `fk_Habitacion_has_Huesped_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitacion_has_Huesped_Huesped1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `hospedaje` */

insert  into `hospedaje`(`idHospedaje`,`Habitacion_idHabitacion`,`Huesped_idHuesped`,`checkIn_Hospedaje`,`checkOut_Hospedaje`,`tipo_Hospedaje`,`codigo_Hospedaje`) values (1,7,1,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00','Reserva',1),(2,7,2,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00','Reserva',1),(3,29,3,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00','Hospedaje normal',2),(4,50,22,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00','Reserva',3),(5,9,14,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00','Hospedaje normal',4),(6,9,31,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00','Hospedaje normal',4),(7,36,40,'2023-01-20 16:30:00.00','2023-01-25 12:00:00.00','Reserva',5),(8,36,9,'2023-01-12 10:45:00.00','2023-01-24 13:00:00.00','Reserva',5),(9,51,1,'2023-01-25 12:45:00.00','2023-01-28 11:00:00.00','Hospedaje normal',6),(10,1,49,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00','Reserva',7),(11,33,44,'2023-01-08 12:00:00.00','2023-01-13 14:00:00.00','Hospedaje normal',8),(12,56,29,'2023-01-01 09:30:00.00','2023-01-07 14:15:00.00','Reserva',9),(13,20,39,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00','Hospedaje normal',10),(14,35,23,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00','Reserva',11),(15,53,15,'2023-01-15 10:15:00.00','2023-01-20 15:30:00.00','Hospedaje normal',12),(16,19,40,'2023-01-09 13:30:00.00','2023-01-14 11:45:00.00','Reserva',13),(17,21,40,'2023-01-20 16:30:00.00','2023-01-25 12:00:00.00','Reserva',65),(18,44,11,'2023-01-12 10:45:00.00','2023-01-17 13:00:00.00','Hospedaje normal',14),(19,44,32,'2023-01-12 12:45:00.00','2023-01-18 11:00:00.00','Hospedaje normal',14),(20,54,45,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00','Reserva',15),(21,13,15,'2023-02-05 12:00:00.00','2023-02-10 14:00:00.00','Hospedaje normal',16),(22,13,30,'2023-02-02 09:30:00.00','2023-02-08 14:15:00.00','Hospedaje normal',16),(23,31,26,'2023-02-10 14:30:00.00','2023-02-15 09:45:00.00','Reserva',17),(24,50,26,'2023-02-04 08:00:00.00','2023-02-10 16:30:00.00','Hospedaje normal',18),(25,1,10,'2023-02-15 10:15:00.00','2023-02-20 15:30:00.00','Reserva',19),(26,1,4,'2023-02-09 13:30:00.00','2023-02-14 11:45:00.00','Hospedaje normal',20),(27,30,40,'2023-02-20 16:30:00.00','2023-02-25 12:00:00.00','Reserva',21),(28,61,19,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00','Hospedaje normal',22),(29,61,8,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00','Hospedaje normal',22),(30,46,44,'2023-02-19 09:15:00.00','2023-02-25 14:45:00.00','Reserva',23),(31,46,30,'2023-02-06 08:30:00.00','2023-02-12 12:15:00.00','Reserva',23),(32,52,49,'2023-02-11 11:00:00.00','2023-02-16 13:30:00.00','Hospedaje normal',24),(33,14,15,'2023-02-16 14:45:00.00','2023-02-20 09:00:00.00','Reserva',25),(34,31,15,'2023-02-21 08:00:00.00','2023-02-27 15:15:00.00','Hospedaje normal',26),(35,1,26,'2023-02-26 16:30:00.00','2023-02-28 10:45:00.00','Reserva',27),(36,15,3,'2023-02-07 12:15:00.00','2023-02-12 14:30:00.00','Hospedaje normal',28),(37,16,14,'2023-02-12 15:45:00.00','2023-02-17 09:30:00.00','Reserva',29),(38,9,22,'2023-02-17 12:00:00.00','2023-02-22 13:45:00.00','Hospedaje normal',30),(39,9,31,'2023-02-17 12:30:00.00','2023-02-22 13:00:00.00','Hospedaje normal',30),(40,17,9,'2023-02-27 14:15:00.00','2023-02-28 09:00:00.00','Reserva',31),(41,18,40,'2023-02-06 14:45:00.00','2023-02-12 16:30:00.00','Hospedaje normal',32),(42,19,20,'2023-02-13 08:00:00.00','2023-02-18 10:15:00.00','Reserva',33),(43,10,33,'2023-02-18 11:30:00.00','2023-02-28 15:45:00.00','Hospedaje normal',34),(44,10,23,'2023-02-18 09:30:00.00','2023-02-28 13:00:00.00','Hospedaje normal',34),(45,20,50,'2023-02-28 14:15:00.00','2023-02-28 23:59:59.00','Reserva',35),(46,21,6,'2023-02-01 12:00:00.00','2023-02-03 14:00:00.00','Hospedaje normal',36),(47,29,46,'2023-02-04 09:30:00.00','2023-02-06 14:15:00.00','Reserva',37),(48,30,36,'2023-02-07 14:30:00.00','2023-02-09 09:45:00.00','Hospedaje normal',38),(49,31,16,'2023-02-10 10:00:00.00','2023-02-12 16:30:00.00','Reserva',39),(50,32,49,'2023-02-13 16:15:00.00','2023-02-15 10:30:00.00','Hospedaje normal',40),(51,2,41,'2023-03-05 12:30:00.00','2023-03-10 14:45:00.00','Hospedaje normal',40),(52,2,11,'2023-03-02 09:45:00.00','2023-03-08 14:30:00.00','Hospedaje normal',40),(53,2,26,'2023-03-10 14:45:00.00','2023-03-15 09:15:00.00','Reserva',41),(54,33,44,'2023-03-04 08:15:00.00','2023-03-10 16:45:00.00','Hospedaje normal',42),(55,34,32,'2023-03-15 10:00:00.00','2023-03-20 15:45:00.00','Reserva',43),(56,35,42,'2023-03-09 13:45:00.00','2023-03-14 11:30:00.00','Hospedaje normal',44),(57,50,17,'2023-03-20 16:45:00.00','2023-03-25 12:15:00.00','Reserva',45),(58,11,29,'2023-03-12 10:30:00.00','2023-03-17 13:15:00.00','Hospedaje normal',46),(59,11,21,'2023-03-25 12:45:00.00','2023-03-28 11:15:00.00','Hospedaje normal',46),(60,12,1,'2023-03-19 09:30:00.00','2023-03-25 14:00:00.00','Reserva',48),(61,12,15,'2023-03-06 08:45:00.00','2023-03-12 12:30:00.00','Reserva',48),(62,51,30,'2023-03-11 11:15:00.00','2023-03-16 13:45:00.00','Hospedaje normal',49),(63,52,48,'2023-03-16 15:00:00.00','2023-03-20 09:15:00.00','Reserva',50),(64,53,38,'2023-03-21 08:15:00.00','2023-03-27 15:30:00.00','Hospedaje normal',51),(65,54,13,'2023-03-26 16:45:00.00','2023-03-28 10:30:00.00','Reserva',52),(66,55,45,'2023-03-07 12:30:00.00','2023-03-12 14:45:00.00','Hospedaje normal',53),(67,56,39,'2023-03-12 15:45:00.00','2023-03-17 09:45:00.00','Reserva',54),(68,13,19,'2023-03-17 10:15:00.00','2023-03-22 11:30:00.00','Hospedaje normal',55),(69,13,35,'2023-03-22 12:45:00.00','2023-03-27 13:15:00.00','Hospedaje normal',55),(70,1,7,'2023-03-27 14:30:00.00','2023-03-28 09:30:00.00','Reserva',56),(71,15,10,'2023-03-06 15:00:00.00','2023-03-12 16:45:00.00','Hospedaje normal',57),(72,16,24,'2023-03-13 08:15:00.00','2023-03-18 10:30:00.00','Reserva',58),(73,17,4,'2023-03-18 11:45:00.00','2023-03-22 15:15:00.00','Hospedaje normal',59),(74,18,27,'2023-03-23 09:45:00.00','2023-03-28 13:45:00.00','Hospedaje normal',59),(75,19,12,'2023-03-28 14:00:00.00','2023-03-28 23:59:59.00','Reserva',60),(76,20,3,'2023-03-01 12:15:00.00','2023-03-05 10:30:00.00','Reserva',60),(77,21,14,'2023-03-06 11:45:00.00','2023-03-11 14:00:00.00','Hospedaje normal',61),(78,29,22,'2023-03-09 15:15:00.00','2023-03-14 10:45:00.00','Reserva',62),(79,30,31,'2023-03-16 13:00:00.00','2023-03-21 15:30:00.00','Hospedaje normal',63),(80,31,9,'2023-03-23 16:45:00.00','2023-03-28 08:15:00.00','Reserva',64),(81,7,1,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00','Reserva',1),(82,7,2,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00','Reserva',1),(83,29,3,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00','Hospedaje normal',2),(84,50,22,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00','Reserva',3),(85,9,14,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00','Hospedaje normal',4),(86,9,31,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00','Hospedaje normal',4),(87,36,40,'2023-01-20 16:30:00.00','2023-01-25 13:00:00.00','Reserva',5),(88,36,9,'2023-01-20 16:45:00.00','2023-01-25 13:00:00.00','Reserva',5),(89,51,1,'2023-01-25 12:45:00.00','2023-01-28 11:00:00.00','Hospedaje normal',6),(90,1,49,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00','Reserva',7),(91,33,44,'2023-01-08 12:00:00.00','2023-01-13 14:00:00.00','Hospedaje normal',8),(92,56,29,'2023-01-01 09:30:00.00','2023-01-07 14:15:00.00','Reserva',9),(93,20,39,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00','Hospedaje normal',10),(94,35,23,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00','Reserva',11),(95,53,15,'2023-01-15 10:15:00.00','2023-01-20 15:30:00.00','Hospedaje normal',12),(96,19,40,'2023-01-09 13:30:00.00','2023-01-14 11:45:00.00','Reserva',13),(97,21,40,'2023-01-20 16:30:00.00','2023-01-25 12:00:00.00','Reserva',65),(98,44,11,'2023-01-12 10:45:00.00','2023-01-17 13:00:00.00','Hospedaje normal',14),(99,44,32,'2023-01-12 12:45:00.00','2023-01-18 11:00:00.00','Hospedaje normal',14),(100,54,45,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00','Reserva',15),(101,13,15,'2023-02-05 12:00:00.00','2023-02-10 14:00:00.00','Hospedaje normal',16),(102,13,30,'2023-02-02 09:30:00.00','2023-02-08 14:15:00.00','Hospedaje normal',16),(103,31,26,'2023-02-10 14:30:00.00','2023-02-15 09:45:00.00','Reserva',17),(104,50,26,'2023-02-04 08:00:00.00','2023-02-10 16:30:00.00','Hospedaje normal',18),(105,1,10,'2023-02-15 10:15:00.00','2023-02-20 15:30:00.00','Reserva',19),(106,1,4,'2023-02-09 13:30:00.00','2023-02-14 11:45:00.00','Hospedaje normal',20),(107,30,40,'2023-02-20 16:30:00.00','2023-02-25 12:00:00.00','Reserva',21),(108,61,19,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00','Hospedaje normal',22),(109,61,8,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00','Hospedaje normal',22),(110,46,44,'2023-02-19 09:15:00.00','2023-02-25 14:45:00.00','Reserva',23),(111,46,30,'2023-02-06 08:30:00.00','2023-02-25 14:45:00.00','Reserva',23),(112,52,49,'2023-02-11 11:00:00.00','2023-02-16 13:30:00.00','Hospedaje normal',24),(113,14,15,'2023-02-16 14:45:00.00','2023-02-20 09:00:00.00','Reserva',25),(114,31,15,'2023-02-21 08:00:00.00','2023-02-27 15:15:00.00','Hospedaje normal',26),(115,1,26,'2023-02-26 16:30:00.00','2023-02-28 10:45:00.00','Reserva',27),(116,15,3,'2023-02-07 12:15:00.00','2023-02-12 14:30:00.00','Hospedaje normal',28),(117,16,14,'2023-02-12 15:45:00.00','2023-02-17 09:30:00.00','Reserva',29),(118,9,22,'2023-02-17 12:00:00.00','2023-02-22 13:45:00.00','Hospedaje normal',30),(119,9,31,'2023-02-17 12:30:00.00','2023-02-22 13:00:00.00','Hospedaje normal',30),(120,17,9,'2023-02-27 14:15:00.00','2023-02-28 09:00:00.00','Reserva',31),(121,18,40,'2023-02-06 14:45:00.00','2023-02-12 16:30:00.00','Hospedaje normal',32),(122,19,20,'2023-02-13 08:00:00.00','2023-02-18 10:15:00.00','Reserva',33),(123,10,33,'2023-02-18 11:30:00.00','2023-02-28 13:00:00.00','Hospedaje normal',34),(124,10,23,'2023-02-18 11:30:00.00','2023-02-28 13:00:00.00','Hospedaje normal',34),(125,20,50,'2023-02-28 14:15:00.00','2023-02-28 23:59:59.00','Reserva',35),(126,21,6,'2023-02-01 12:00:00.00','2023-02-03 14:00:00.00','Hospedaje normal',36),(127,29,46,'2023-02-04 09:30:00.00','2023-02-06 14:15:00.00','Reserva',37),(128,30,36,'2023-02-07 14:30:00.00','2023-02-09 09:45:00.00','Hospedaje normal',38),(129,31,16,'2023-02-10 10:00:00.00','2023-02-12 16:30:00.00','Reserva',39),(130,32,49,'2023-02-13 16:15:00.00','2023-02-15 10:30:00.00','Hospedaje normal',40),(131,2,41,'2023-03-13 16:15:00.00','2023-03-15 10:30:00.00','Hospedaje normal',40),(132,2,11,'2023-03-13 16:15:00.00','2023-03-15 10:30:00.00','Hospedaje normal',40),(133,2,26,'2023-03-10 14:45:00.00','2023-03-15 09:15:00.00','Reserva',41),(134,33,44,'2023-03-04 08:15:00.00','2023-03-10 16:45:00.00','Hospedaje normal',42),(135,34,32,'2023-03-15 10:00:00.00','2023-03-20 15:45:00.00','Reserva',43),(136,35,42,'2023-03-09 13:45:00.00','2023-03-14 11:30:00.00','Hospedaje normal',44),(137,50,17,'2023-03-20 16:45:00.00','2023-03-25 12:15:00.00','Reserva',45),(138,11,29,'2023-03-12 10:30:00.00','2023-03-17 13:15:00.00','Hospedaje normal',46),(139,11,21,'2023-03-25 12:45:00.00','2023-03-28 11:15:00.00','Hospedaje normal',46),(140,12,1,'2023-03-19 09:30:00.00','2023-03-25 14:00:00.00','Reserva',48),(141,12,15,'2023-03-06 08:45:00.00','2023-03-12 12:30:00.00','Reserva',48),(142,51,30,'2023-03-11 11:15:00.00','2023-03-16 13:45:00.00','Hospedaje normal',49),(143,52,48,'2023-03-16 15:00:00.00','2023-03-20 09:15:00.00','Reserva',50),(144,53,38,'2023-03-21 08:15:00.00','2023-03-27 15:30:00.00','Hospedaje normal',51),(145,54,13,'2023-03-26 16:45:00.00','2023-03-28 10:30:00.00','Reserva',52),(146,55,45,'2023-03-07 12:30:00.00','2023-03-12 14:45:00.00','Hospedaje normal',53),(147,56,39,'2023-03-12 15:45:00.00','2023-03-17 09:45:00.00','Reserva',54),(148,13,19,'2023-03-17 10:15:00.00','2023-03-22 11:30:00.00','Hospedaje normal',55),(149,13,35,'2023-03-22 12:45:00.00','2023-03-27 13:15:00.00','Hospedaje normal',55),(150,1,7,'2023-03-27 14:30:00.00','2023-03-28 09:30:00.00','Reserva',56),(151,15,10,'2023-03-06 15:00:00.00','2023-03-12 16:45:00.00','Hospedaje normal',57),(152,16,24,'2023-03-13 08:15:00.00','2023-03-18 10:30:00.00','Reserva',58),(153,17,4,'2023-03-18 11:45:00.00','2023-03-22 15:15:00.00','Hospedaje normal',59),(154,18,27,'2023-03-23 09:45:00.00','2023-03-28 13:45:00.00','Hospedaje normal',59),(155,19,12,'2023-03-28 14:00:00.00','2023-03-28 23:59:59.00','Reserva',60),(156,20,3,'2023-03-01 12:15:00.00','2023-03-05 10:30:00.00','Reserva',60),(157,21,14,'2023-03-06 11:45:00.00','2023-03-11 14:00:00.00','Hospedaje normal',61),(158,29,22,'2023-03-09 15:15:00.00','2023-03-14 10:45:00.00','Reserva',62),(159,30,31,'2023-03-16 13:00:00.00','2023-03-21 15:30:00.00','Hospedaje normal',63),(160,31,9,'2023-03-23 16:45:00.00','2023-03-28 08:15:00.00','Reserva',64);

/*Table structure for table `huesped` */

DROP TABLE IF EXISTS `huesped`;

CREATE TABLE `huesped` (
  `idHuesped` int(11) NOT NULL AUTO_INCREMENT,
  `cedula _Huesped` varchar(15) NOT NULL,
  `primer_Nombre_Huesped` varchar(40) NOT NULL,
  `segundo_Nombre_Huesped` varchar(40) DEFAULT NULL,
  `primer_Apellido_Huesped` varchar(45) NOT NULL,
  `segundo_Apellido_Huesped` varchar(45) DEFAULT NULL,
  `tipo_Documento_Huesped` enum('CC','CE','TI','Pasaporte') NOT NULL,
  `fecha_Nacimiento_Huesped` date NOT NULL,
  `edad_Huesped` int(11) NOT NULL,
  `telefono_Huesped` varchar(15) NOT NULL,
  `correo_Huesped` varchar(50) NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`idHuesped`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `huesped` */

insert  into `huesped`(`idHuesped`,`cedula _Huesped`,`primer_Nombre_Huesped`,`segundo_Nombre_Huesped`,`primer_Apellido_Huesped`,`segundo_Apellido_Huesped`,`tipo_Documento_Huesped`,`fecha_Nacimiento_Huesped`,`edad_Huesped`,`telefono_Huesped`,`correo_Huesped`,`nacionalidad`) values (1,'1122334466','Oliver','Henry','Gomez','Davis','CC','1984-03-15',37,'112-233-4466','oliver@example.com','Colombiana'),(2,'2233444577','Ava','Charlotte','Martinez','Williams','TI','2008-10-04',15,'223-344-4577','ava@example.com','Colombiana'),(3,'3344555688','Emma','Sophia','Clark','Smith','CC','1999-08-29',22,'334-455-5688','emma@example.com','Colombiana'),(4,'4455666799','Liam','Jacob','Johnson','Anderson','Pasaporte','1976-07-23',45,'445-566-6799','liam@example.com','Brasileña'),(5,'5566777900','Sophia','Ava','Harris','Garcia','TI','2008-12-01',14,'556-677-7900','sophia@example.com','Colombiana'),(6,'6677888011','Noah','Michael','Brown','Davis','CC','1993-05-07',28,'667-788-8011','noah@example.com','Colombiana'),(7,'7788999122','Olivia','Elizabeth','Smith','Johnson','Pasaporte','1978-01-20',43,'778-899-9122','olivia@example.com','Argentina'),(8,'8899000233','Liam','Jacob','Anderson','Martinez','TI','2000-09-10',3,'889-900-0233','liam@example.com','Colombiana'),(9,'9900111344','Emma','Sophia','Davis','Brown','CC','1995-03-04',26,'990-011-1344','emma@example.com','Colombiana'),(10,'0011222455','Sophia','Ava','Garcia','Clark','CE','1977-11-19',44,'001-122-2455','sophia@example.com','Peruana'),(11,'1122334577','James','Benjamin','Brown','Anderson','Pasaporte','1989-06-28',32,'112-233-4577','james@example.com','Italiana'),(12,'2233445688','Olivia','Elizabeth','Clark','Smith','CE','1974-04-03',47,'223-344-5688','olivia@example.com','Mexicana'),(13,'3344556799','Liam','Jacob','Davis','Harris','CE','1982-02-14',39,'334-455-6799','liam@example.com','Chilena'),(14,'4455667900','Ava','Charlotte','Smith','Johnson','Pasaporte','1997-08-07',24,'445-566-7900','ava@example.com','Española'),(15,'5566778011','Sophia','Ava','Garcia','Martinez','CE','1983-07-01',38,'556-677-8011','sophia@example.com','Uruguaya'),(16,'6677889122','Noah','Michael','Brown','Clark','CC','1990-10-15',31,'667-788-9122','noah@example.com','Colombiana'),(17,'7788999233','Olivia','Elizabeth','Johnson','Anderson','CE','1986-09-25',35,'778-899-9233','olivia@example.com','Paraguaya'),(18,'8899000344','Emma','Sophia','Smith','Davis','TI','2005-12-08',17,'889-900-0344','emma@example.com','Colombiana'),(19,'9900111455','Liam','Jacob','Anderson','Garcia','Pasaporte','1979-03-21',42,'990-011-1455','liam@example.com','Francesa'),(20,'0011222566','Sophia','Ava','Harris','Brown','CC','1994-07-11',27,'001-122-2566','sophia@example.com','Colombiana'),(21,'1122334688','Noah','Michael','Martinez','Johnson','Pasaporte','1984-06-19',37,'112-233-4688','noah@example.com','Canadiense'),(22,'2233445799','Ava','Charlotte','Garcia','Brown','CE','1997-01-02',24,'223-344-5799','ava@example.com','Ecuatoriana'),(23,'3344556800','Emma','Sophia','Smith','Clark','CC','1993-09-27',28,'334-455-6800','emma@example.com','Colombiana'),(24,'4455667911','Liam','Jacob','Harris','Anderson','Pasaporte','1976-12-14',45,'445-566-7911','liam@example.com','Mexicana'),(25,'5566778022','Sophia','Ava','Davis','Gonzalez','TI','2007-08-30',16,'556-677-8022','sophia@example.com','Colombiana'),(26,'6677889133','Oliver','Henry','Brown','Taylor','CC','1989-02-12',32,'667-788-9133','oliver@example.com','Colombiana'),(27,'7788999244','Olivia','Elizabeth','Clark','Smith','CE','1975-04-27',46,'778-899-9244','olivia@example.com','Chilena'),(28,'8899000355','Liam','Jacob','Smith','Davis','TI','2007-11-19',15,'889-900-0355','liam@example.com','Colombiana'),(29,'9900111466','Emma','Sophia','Harris','Garcia','CE','1985-07-03',36,'990-011-1466','emma@example.com','Peruana'),(30,'0011222577','Sophia','Ava','Clark','Davis','CC','1983-03-18',38,'001-122-2577','sophia@example.com','Colombiana'),(31,'1122334799','James','Benjamin','Smith','Anderson','Pasaporte','1996-06-11',25,'112-233-4799','james@example.com','Española'),(32,'2233445800','Olivia','Elizabeth','Garcia','Martinez','CC','1987-12-24',34,'223-344-5800','olivia@example.com','Colombiana'),(33,'3344556911','Liam','Jacob','Davis','Johnson','CE','1994-01-08',27,'334-455-6911','liam@example.com','Venezolana'),(34,'4455668022','Ava','Charlotte','Harris','Brown','TI','2010-09-07',13,'445-566-8022','ava@example.com','Colombiana'),(35,'5566779133','Sophia','Ava','Johnson','Clark','CE','1978-05-29',43,'556-677-9133','sophia@example.com','Mexicana'),(36,'6677889244','Noah','Michael','Clark','Smith','CC','1991-07-22',30,'667-788-9244','noah@example.com','Colombiana'),(37,'7788999355','Olivia','Elizabeth','Smith','Garcia','TI','2008-04-16',15,'778-899-9355','olivia@example.com','Colombiana'),(38,'8899000466','Emma','Sophia','Davis','Brown','CE','1982-10-31',39,'889-900-0466','emma@example.com','Paraguaya'),(39,'9900111577','Sophia','Ava','Harris','Taylor','Pasaporte','1979-08-12',42,'990-011-1577','sophia@example.com','Italiana'),(40,'0011222688','Oliver','Henry','Brown','Anderson','CC','1995-02-03',26,'001-122-2688','oliver@example.com','Colombiana'),(41,'1122334800','Ava','Charlotte','Smith','Brown','CC','1990-04-22',31,'112-233-4800','ava@example.com','Colombiana'),(42,'2233445911','Noah','Michael','Garcia','Martinez','CE','1986-11-15',35,'223-344-5911','noah@example.com','Ecuatoriana'),(43,'3344557022','Emma','Sophia','Davis','Johnson','TI','2008-02-08',15,'334-455-7022','emma@example.com','Colombiana'),(44,'4455668133','Liam','Jacob','Brown','Clark','Pasaporte','1988-07-29',33,'445-566-8133','liam@example.com','Mexicana'),(45,'5566779244','Olivia','Elizabeth','Clark','Davis','CE','1979-09-14',42,'556-677-9244','olivia@example.com','Venezolana'),(46,'6677889355','Sophia','Ava','Harris','Garcia','CC','1992-05-03',29,'667-788-9355','sophia@example.com','Colombiana'),(47,'7788999466','Oliver','Henry','Davis','Smith','TI','2006-12-28',14,'778-899-9466','oliver@example.com','Colombiana'),(48,'8899000577','Liam','Jacob','Harris','Anderson','CE','1983-03-10',38,'889-900-0577','liam@example.com','Chilena'),(49,'9900111688','Emma','Sophia','Garcia','Johnson','Pasaporte','1990-09-18',31,'990-011-1688','emma@example.com','Española'),(50,'0011222799','Sophia','Ava','Martinez','Brown','CC','1993-08-05',28,'001-122-2799','sophia@example.com','Colombiana');

/*Table structure for table `inventario` */

DROP TABLE IF EXISTS `inventario`;

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `Producto_idProducto` int(11) NOT NULL,
  `nombre_Inventario` varchar(100) NOT NULL,
  `existencias_Inventario` int(11) NOT NULL,
  `minimo_Producto` int(11) NOT NULL,
  `maximo_Producto` int(11) NOT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`idInventario`),
  KEY `fk_Sucursal_has_Inventario_Sucursal1` (`Sucursal_id_Sucursal`),
  KEY `fk_Inventario_Producto1` (`Producto_idProducto`),
  CONSTRAINT `fk_Inventario_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Inventario_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `inventario` */

insert  into `inventario`(`idInventario`,`Sucursal_id_Sucursal`,`Producto_idProducto`,`nombre_Inventario`,`existencias_Inventario`,`minimo_Producto`,`maximo_Producto`,`estado`) values (1,1,1,'Inventario de toallas',0,80,150,'Activo'),(2,1,2,'Inventario de jabones',0,80,200,'Activo'),(3,1,3,'Inventario de gaseosas',0,40,80,'Activo'),(4,1,4,'Inventario de cepillos dentales',0,15,30,'Activo'),(5,1,5,'Inventario de sábanas',0,150,200,'Activo'),(6,1,6,'Inventario de champú',0,80,150,'Activo'),(7,1,7,'Inventario de botellas de agua',0,40,80,'Activo'),(8,1,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo'),(9,1,9,'Inventario de almohadas',0,90,100,'Activo'),(10,1,10,'Inventario de jabon de baño',0,80,150,'Activo'),(11,1,11,'Inventario de Snacks variados',0,30,50,'Activo'),(12,1,12,'Inventario de cobijas de lana',0,30,50,'Activo'),(13,1,13,'Inventario de crema dental',0,10,15,'Activo'),(14,1,14,'Inventario de vinotinto',0,5,20,'Activo'),(15,1,15,'Inventario del rollo de papel de cocina',0,5,10,'Activo'),(16,1,16,'Inventario de prendas de ropa interior',0,20,30,'Activo'),(17,1,17,'Inventario de gel de ducha',0,30,50,'Activo'),(18,1,18,'Inventario de latas de cerveza',0,50,80,'Activo'),(19,1,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo'),(20,1,20,'Inventario de alfombras',0,30,40,'Activo'),(21,2,1,'Inventario de toallas',0,80,150,'Activo'),(22,2,2,'Inventario de jabones',0,80,200,'Activo'),(23,2,3,'Inventario de gaseosas',0,40,80,'Activo'),(24,2,5,'Inventario de sábanas',0,150,200,'Activo'),(25,2,6,'Inventario de champú',0,80,150,'Activo'),(26,2,7,'Inventario de botellas de agua',0,40,80,'Activo'),(27,2,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo'),(28,2,9,'Inventario de almohadas',0,90,100,'Activo'),(29,2,11,'Inventario de Snacks variados',0,30,50,'Activo'),(30,2,12,'Inventario de cobijas de lana',0,30,50,'Activo'),(31,2,13,'Inventario de crema dental',0,10,15,'Activo'),(32,2,16,'Inventario de prendas de ropa interior',0,20,30,'Activo'),(33,2,17,'Inventario de gel de ducha',0,30,50,'Activo'),(34,2,18,'Inventario de latas de cerveza',0,50,80,'Activo'),(35,2,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo'),(36,3,1,'Inventario de toallas',0,80,150,'Activo'),(37,3,2,'Inventario de jabones',0,80,200,'Activo'),(38,3,3,'Inventario de gaseosas',0,40,80,'Activo'),(39,3,4,'Inventario de cepillos dentales',0,15,30,'Activo'),(40,3,5,'Inventario de sábanas',0,150,200,'Activo'),(41,3,6,'Inventario de champú',0,80,150,'Activo'),(42,3,7,'Inventario de botellas de agua',0,40,80,'Activo'),(43,3,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo'),(44,3,9,'Inventario de almohadas',0,90,100,'Activo'),(45,3,10,'Inventario de jabon de baño',0,80,150,'Activo'),(46,3,11,'Inventario de Snacks variados',0,30,50,'Activo'),(47,3,12,'Inventario de cobijas de lana',0,30,50,'Activo'),(48,3,13,'Inventario de crema dental',0,10,15,'Activo'),(49,3,14,'Inventario de vinotinto',0,5,20,'Activo'),(50,3,15,'Inventario del rollo de papel de cocina',0,5,10,'Activo'),(51,3,16,'Inventario de prendas de ropa interior',0,20,30,'Activo'),(52,3,17,'Inventario de gel de ducha',0,30,50,'Activo'),(53,3,18,'Inventario de latas de cerveza',0,50,80,'Activo'),(54,3,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo'),(55,3,20,'Inventario de alfombras',0,30,40,'Activo'),(56,3,21,'Preservativos caja de 3',0,15,20,'Activo');

/*Table structure for table `mantenimiento_saneamiento_rutinario` */

DROP TABLE IF EXISTS `mantenimiento_saneamiento_rutinario`;

CREATE TABLE `mantenimiento_saneamiento_rutinario` (
  `idRutina` int(11) NOT NULL AUTO_INCREMENT,
  `item_Rutina` varchar(50) NOT NULL,
  `estado_Rutina` enum('Hecho','Pendiente') NOT NULL,
  `cantidad_Items` int(11) NOT NULL,
  `fecha_Rutina` datetime NOT NULL,
  `Detalle_Mantenimiento_id` int(11) NOT NULL,
  PRIMARY KEY (`idRutina`),
  KEY `Detalle_Mantenimiento_id` (`Detalle_Mantenimiento_id`),
  CONSTRAINT `mantenimiento_saneamiento_rutinario_ibfk_1` FOREIGN KEY (`Detalle_Mantenimiento_id`) REFERENCES `detalle_mantenimiento` (`idDetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mantenimiento_saneamiento_rutinario` */

/*Table structure for table `mantenimiento_sucursal` */

DROP TABLE IF EXISTS `mantenimiento_sucursal`;

CREATE TABLE `mantenimiento_sucursal` (
  `idMantenimiento_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_idSucursal` int(11) NOT NULL,
  `fecha_Mantenimiento` date NOT NULL,
  `descripcion_Mantenimiento` varchar(200) NOT NULL,
  `nombre_Mantenimiento` varchar(50) NOT NULL,
  `tipo_Mantenimiento` enum('Reparacion','Mejora','Saneamiento') NOT NULL,
  `Rol_Empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`idMantenimiento_sucursal`),
  KEY `fk_Mantenimiento_Sucursal` (`Sucursal_idSucursal`),
  KEY `Rol_Empleado_id` (`Rol_Empleado_id`),
  CONSTRAINT `fk_Mantenimiento_Sucursal` FOREIGN KEY (`Sucursal_idSucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mantenimiento_sucursal_ibfk_1` FOREIGN KEY (`Rol_Empleado_id`) REFERENCES `rol_empleado` (`idRol_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mantenimiento_sucursal` */

/*Table structure for table `pago` */

DROP TABLE IF EXISTS `pago`;

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `Hospedaje_idHospedaje` int(11) NOT NULL,
  `titular _Pago` varchar(80) NOT NULL,
  `IDTitular_Pago` varchar(20) NOT NULL,
  `medioDePago_Pago` enum('PSE','Tarjeta de crédito','Tarjeta de dédito','Efectivo') NOT NULL,
  `concepto_Pago` varchar(500) NOT NULL,
  `total_Pago` decimal(10,0) NOT NULL,
  `tipo_Cliente` enum('Persona natural','Persona jurídica') NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_Pago_Hospedaje1` (`Hospedaje_idHospedaje`),
  CONSTRAINT `fk_Pago_Hospedaje1` FOREIGN KEY (`Hospedaje_idHospedaje`) REFERENCES `hospedaje` (`idHospedaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pago` */

/*Table structure for table `pago_recibo` */

DROP TABLE IF EXISTS `pago_recibo`;

CREATE TABLE `pago_recibo` (
  `idPago_Recibo` int(11) NOT NULL AUTO_INCREMENT,
  `Recibo_idRecibo` int(11) NOT NULL,
  `Responsable_idResponsable1` int(11) NOT NULL,
  `fecha_Pago_Recibo` date NOT NULL,
  `monto_Recibo` decimal(10,0) NOT NULL,
  `Pago_Con_Retraso` varchar(2) NOT NULL,
  `motivo_Retraso` varchar(100) NOT NULL,
  PRIMARY KEY (`idPago_Recibo`),
  KEY `fk_Pago_Recibo_Recibo1` (`Recibo_idRecibo`),
  KEY `fk_Pago_Recibo_Responsable1` (`Responsable_idResponsable1`),
  CONSTRAINT `fk_Pago_Recibo_Recibo1` FOREIGN KEY (`Recibo_idRecibo`) REFERENCES `recibo` (`idRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pago_recibo` */

/*Table structure for table `parqueadero` */

DROP TABLE IF EXISTS `parqueadero`;

CREATE TABLE `parqueadero` (
  `idParqueadero` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_idSucursal` int(11) NOT NULL,
  `Vehiculo_idVehiculo` int(11) NOT NULL,
  `entrada_Vehiculo` datetime NOT NULL,
  `salida_Vehiculo` date NOT NULL,
  `ubicacion_Vehiculo` int(11) NOT NULL,
  `Empleado_idRol_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`idParqueadero`),
  KEY `Vehiculo_idVehiculo` (`Vehiculo_idVehiculo`),
  KEY `Sucursal_idSucursal` (`Sucursal_idSucursal`),
  KEY `Empleado_idRol_Empleado` (`Empleado_idRol_Empleado`),
  CONSTRAINT `parqueadero_ibfk_1` FOREIGN KEY (`Vehiculo_idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`),
  CONSTRAINT `parqueadero_ibfk_2` FOREIGN KEY (`Sucursal_idSucursal`) REFERENCES `sucursal` (`id_Sucursal`),
  CONSTRAINT `parqueadero_ibfk_3` FOREIGN KEY (`Empleado_idRol_Empleado`) REFERENCES `rol_empleado` (`idRol_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `parqueadero` */

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `Proveedor_idProveedor` int(11) NOT NULL,
  `fecha_Entrega` datetime NOT NULL,
  `precio_Total_Pedido` decimal(10,0) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `fk_Proveedor_has_Producto_Proveedor1` (`Proveedor_idProveedor`),
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `pedido` */

/*Table structure for table `pqrfs` */

DROP TABLE IF EXISTS `pqrfs`;

CREATE TABLE `pqrfs` (
  `idPqrfs` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_PQRFs` enum('Pregunta','Queja','Reclamo','Felicitaciones') NOT NULL,
  `descripcion_PQRFs` varchar(500) NOT NULL,
  `fecha_Radicado` date NOT NULL,
  `estado_PQRFs` enum('Resuelta','Por resolver') NOT NULL,
  `Huesped_idHuesped` int(11) NOT NULL,
  `Rol_Empleado_idRol_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`idPqrfs`),
  KEY `Huesped_idHuesped` (`Huesped_idHuesped`),
  KEY `Rol_Empleado_idRol_Empleado` (`Rol_Empleado_idRol_Empleado`),
  CONSTRAINT `pqrfs_ibfk_1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`),
  CONSTRAINT `pqrfs_ibfk_2` FOREIGN KEY (`Rol_Empleado_idRol_Empleado`) REFERENCES `rol_empleado` (`idRol_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pqrfs` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `precio_Producto` decimal(10,2) NOT NULL,
  `descripcion_Producto` varchar(200) NOT NULL,
  `nombre_Producto` varchar(50) NOT NULL,
  `categoria_Producto` varchar(50) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`precio_Producto`,`descripcion_Producto`,`nombre_Producto`,`categoria_Producto`) values (1,0.00,'Toallas de algodón','Toallas','Textil '),(2,0.00,'Jabón de manos','Jabón','Aseo'),(3,2500.00,'Bebida gaseosa','Gaseosa','Bebidas'),(4,1200.00,'Cepillo de dientes','Cepillo dental','Aseo'),(5,40000.00,'Sábanas de seda','Sábanas','Textil '),(6,0.00,'Champú suave','Champú','Aseo'),(7,1500.75,'Agua mineral','Agua','Bebidas'),(8,0.00,'Papel higiénico','Papel higiénico','Aseo'),(9,22000.75,'Almohadas de plumas','Almohadas','Textil'),(10,0.00,'Jabón de baño','Jabón de baño','Aseo'),(11,20000.00,'Snacks variados','Snacks','Comestibles'),(12,0.00,'Cobijas de lana','Cobijas','Textil'),(13,5400.25,'Pasta de dientes','Pasta dental','Aseo'),(14,45000.50,'Vino tinto','Vino','Bebidas alcohólicas'),(15,6000.50,'Papel de cocina','Papel de cocina','Cocina'),(16,3000.75,'Ropa interior','Ropa interior','Textil '),(17,9000.99,'Gel de ducha','Gel de ducha','Aseo'),(18,4500.25,'Cerveza','Cerveza','Bebidas alcohólicas'),(19,14000.00,'Cubiertos desechables','Cubiertos','Cocina'),(20,29000.50,'Alfombras','Alfombras','Textil'),(21,4000.00,'Preservativos de x marca','Preservativos','Farmacia');

/*Table structure for table `propiedad` */

DROP TABLE IF EXISTS `propiedad`;

CREATE TABLE `propiedad` (
  `idPropiedad` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_Escritura` varchar(30) NOT NULL,
  `Dueño_idDueño` int(11) NOT NULL,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `fecha_Inicio_Participacion` date NOT NULL,
  `antiguedad_Participacion` int(11) NOT NULL,
  `participacion_Inicial` int(11) NOT NULL,
  PRIMARY KEY (`idPropiedad`),
  KEY `fk_Dueño_has_Sucursal_Dueño1` (`Dueño_idDueño`),
  KEY `fk_Dueño_has_Sucursal_Sucursal1` (`Sucursal_id_Sucursal`),
  CONSTRAINT `fk_Dueño_has_Sucursal_Dueño1` FOREIGN KEY (`Dueño_idDueño`) REFERENCES `dueño` (`idDueño`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueño_has_Sucursal_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `propiedad` */

insert  into `propiedad`(`idPropiedad`,`codigo_Escritura`,`Dueño_idDueño`,`Sucursal_id_Sucursal`,`fecha_Inicio_Participacion`,`antiguedad_Participacion`,`participacion_Inicial`) values (1,'AM-9000',1,1,'2020-09-10',3,100),(2,'AM-8500',2,1,'2020-10-01',3,0),(3,'AM-8700',3,1,'2021-05-10',2,0),(4,'AM-8700',4,3,'2019-06-15',4,60),(5,'AM-8700',5,3,'2019-06-15',4,40),(6,'AM-8700',6,2,'2020-07-10',3,100);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `NIT_Proveedor` varchar(15) NOT NULL,
  `nombre_Proveedor` varchar(45) NOT NULL,
  `telefono_Proveedor` varchar(15) NOT NULL,
  `correo_Proveedor` varchar(45) NOT NULL,
  `categoria_Proveedor` enum('Aseo','Textiles','') DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `proveedor` */

insert  into `proveedor`(`idProveedor`,`NIT_Proveedor`,`nombre_Proveedor`,`telefono_Proveedor`,`correo_Proveedor`,`categoria_Proveedor`) values (1,'123456789-1','Proveedor de Textiles','34567890','proveedor.textiles@example.com','Textiles'),(2,'987654321-2','Proveedor de Productos de Aseo','3123456789','proveedor.aseo@example.com','Aseo'),(3,'555555555-3','Proveedor de Toallas','3333333333','proveedor.toallas@example.com','Textiles');

/*Table structure for table `recibo` */

DROP TABLE IF EXISTS `recibo`;

CREATE TABLE `recibo` (
  `idRecibo` int(11) NOT NULL AUTO_INCREMENT,
  `Servicio_Publico_idServicio_Publico` int(11) NOT NULL,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `concepto_Recibo` varchar(100) NOT NULL,
  `fecha_Pago_Oportuno` date NOT NULL,
  `consumo_Recibo` decimal(11,2) NOT NULL,
  `medida_consumo` varchar(45) NOT NULL,
  PRIMARY KEY (`idRecibo`),
  KEY `fk_Servicio_Publico_has_Sucursal_Servicio_Publico` (`Servicio_Publico_idServicio_Publico`),
  KEY `fk_Servicio_Publico_has_Sucursal_Sucursal1` (`Sucursal_id_Sucursal`),
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Servicio_Publico` FOREIGN KEY (`Servicio_Publico_idServicio_Publico`) REFERENCES `servicio_publico` (`idServicio_Publico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `recibo` */

insert  into `recibo`(`idRecibo`,`Servicio_Publico_idServicio_Publico`,`Sucursal_id_Sucursal`,`concepto_Recibo`,`fecha_Pago_Oportuno`,`consumo_Recibo`,`medida_consumo`) values (1,1,1,'Pago recibo luz, sucursal Medellín','2023-01-23',50.00,'Kilovatio'),(2,1,1,'Pago recibo luz, sucursal Medellín','2023-02-22',49.00,'Kilovatio'),(3,1,1,'Pago recibo luz, sucursal Medellín','2023-03-25',58.00,'Kilovatio'),(4,4,2,'Pago recibo luz, sucursal Sibaté','2023-01-25',45.00,'Kilovatio'),(5,4,2,'Pago recibo luz, sucursal Sibaté','2023-02-24',44.00,'Kilovatio'),(6,4,2,'Pago recibo luz, sucursal Sibaté','2023-03-25',40.00,'Kilovatio'),(7,7,3,'Pago recibo luz, sucursal Bogotá','2023-01-24',50.00,'Kilovatio'),(8,7,3,'Pago recibo luz, sucursal Bogotá','2023-02-24',49.20,'Kilovatio'),(9,7,3,'Pago recibo luz, sucursal Bogotá','2023-03-24',46.70,'Kilovatio'),(10,2,1,'Pago recibo agua, sucursal Medellín','2023-01-17',120.00,'Metro cúbico'),(11,2,1,'Pago recibo agua, sucursal Medellín','2023-02-18',120.60,'Metro cúbico'),(12,2,1,'Pago recibo agua, sucursal Medellín','2023-03-27',140.30,'Metro cúbico'),(13,5,2,'Pago recibo agua, sucursal Sibaté','2023-01-15',98.00,'Metro cúbico'),(14,5,2,'Pago recibo agua, sucursal Sibaté','2023-02-17',99.20,'Metro cúbico'),(15,8,3,'Pago recibo agua, sucursal Bogotá','2023-01-15',109.00,'Metro cúbico'),(16,8,3,'Pago recibo agua, sucursal Bogotá','2023-02-15',101.10,'Metro cúbico'),(17,8,3,'Pago recibo agua, sucursal Bogotá','2023-03-19',110.60,'Metro cúbico'),(18,3,1,'Pago recibo gas, sucursal Medellín','2023-01-08',34.00,'Metro cúbico de gas'),(19,6,2,'Pago recibo gas, sucursal Sibaté','2023-01-10',45.00,'Metro cúbico de gas'),(20,9,3,'Pago recibo gas, sucursal Bogotá','2023-01-11',23.00,'Metro cúbico de gas');

/*Table structure for table `registro_salida_entrada` */

DROP TABLE IF EXISTS `registro_salida_entrada`;

CREATE TABLE `registro_salida_entrada` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `Huesped_idHuesped` int(11) NOT NULL,
  `Hospedaje_idHospedaje` int(11) NOT NULL,
  `tipo_Registro` enum('Salida','Entrada') NOT NULL,
  `hora_registro` int(11) NOT NULL,
  PRIMARY KEY (`idRegistro`),
  KEY `Huesped_idHuesped` (`Huesped_idHuesped`),
  KEY `Hospedaje_idHospedaje` (`Hospedaje_idHospedaje`),
  CONSTRAINT `registro_salida_entrada_ibfk_1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`),
  CONSTRAINT `registro_salida_entrada_ibfk_2` FOREIGN KEY (`Hospedaje_idHospedaje`) REFERENCES `hospedaje` (`idHospedaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `registro_salida_entrada` */

/*Table structure for table `rol_empleado` */

DROP TABLE IF EXISTS `rol_empleado`;

CREATE TABLE `rol_empleado` (
  `idRol_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `Empleado_idEmpleado` int(11) NOT NULL,
  `cargo_Empleado` enum('Gerente','Recepcionista','Camarera','Mantenimiento','Otro') NOT NULL,
  `cargo_Otro_Empleado` varchar(45) DEFAULT NULL,
  `tipo_Contrato` varchar(50) NOT NULL,
  `fecha_Vinculacion_Empleado` date NOT NULL,
  `antiguedad_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`idRol_Empleado`),
  KEY `fk_Sucursal_has_Empleado_Sucursal1` (`Sucursal_id_Sucursal`),
  KEY `fk_Sucursal_has_Empleado_Empleado1` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_Sucursal_has_Empleado_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Empleado_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `rol_empleado` */

insert  into `rol_empleado`(`idRol_Empleado`,`Sucursal_id_Sucursal`,`Empleado_idEmpleado`,`cargo_Empleado`,`cargo_Otro_Empleado`,`tipo_Contrato`,`fecha_Vinculacion_Empleado`,`antiguedad_Empleado`) values (1,1,1,'Gerente','N/A','Contrato a término fijo','2020-12-01',2),(2,1,2,'Recepcionista','N/A','Contrato a término indefinido','2020-12-01',2),(3,1,4,'Camarera','N/A','Contrato a término fijo','2020-12-01',2),(4,1,3,'Mantenimiento','N/A','Contrato a término fijo','2020-12-01',2),(5,2,1,'Gerente','N/A','Contrato a término fijo','2020-10-01',3),(6,2,5,'Recepcionista','N/A','Contrato a término indefinido','2020-10-01',3),(7,2,6,'Camarera','N/A','Contrato a término fijo','2020-10-01',3),(8,2,7,'Mantenimiento','N/A','Contrato a término fijo','2020-10-01',3),(9,3,8,'Gerente','N/A','Contrato a termino indefinido','2019-06-19',4),(10,3,9,'Recepcionista','N/A','Contrato a término indefinido','2019-06-19',4),(11,3,10,'Camarera','N/A','Contrato a término fijo','2019-06-19',4),(12,3,11,'Mantenimiento','N/A','Contrato a término fijo','2019-06-19',4),(13,3,12,'Otro','Portero','Contrato a término fijo','2019-06-19',4);

/*Table structure for table `servicio_publico` */

DROP TABLE IF EXISTS `servicio_publico`;

CREATE TABLE `servicio_publico` (
  `idServicio_Publico` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_Servicio_Publico` varchar(80) NOT NULL,
  `nombre_Servicio_Publico` varchar(45) NOT NULL,
  `carrera_Servicio_Publico` int(11) NOT NULL,
  `calle_Servicio_Publico` int(11) NOT NULL,
  `cuidad_Servicio_Publico` varchar(80) NOT NULL,
  `correo_Servicio_Publico` varchar(50) NOT NULL,
  `telefono_Servicio_Publico` varchar(15) NOT NULL,
  `telefono2_Servicio_Publico` varchar(15) NOT NULL,
  `NIT_Proveedor` varchar(15) NOT NULL,
  PRIMARY KEY (`idServicio_Publico`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `servicio_publico` */

insert  into `servicio_publico`(`idServicio_Publico`,`proveedor_Servicio_Publico`,`nombre_Servicio_Publico`,`carrera_Servicio_Publico`,`calle_Servicio_Publico`,`cuidad_Servicio_Publico`,`correo_Servicio_Publico`,`telefono_Servicio_Publico`,`telefono2_Servicio_Publico`,`NIT_Proveedor`) values (1,'Proveedor 1','Electricidad',1,1,'Medellín','correo1@example.com','123456789','987654321','900734765-1'),(2,'Proveedor 2','Acueducto',2,2,'Medellin','correo2@example.com','987654321','123456789','890984523-9'),(3,'Proveedor 3','Gas',3,3,'Medellin','correo3@example.com','555555555','444444444','899123265-0'),(4,'Proveedor 1','Electricidad',7,8,'Sibaté','correo7@example.com','123456789','987654321','900734765-1'),(5,'Proveedor 2','Acueducto',6,7,'Sibaté','correo6@example.com','987654321','123456789','890984523-9'),(6,'Proveedor 3','Gas',8,2,'Sibaté','correo8@example.com','555555555','444444444','899123265-0'),(7,'Proveedor 1','Electricidad',100,23,'Bogotá','correo100@example.com','123456789','987654321','900734765-1'),(8,'Proveedor 2','Acueducto',27,20,'Bogotá','correo27@example.com','987654321','123456789','890984523-9'),(9,'Proveedor 3','Gas',38,45,'Bogotá','correo38@example.com','555555555','444444444','899123265-0');

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id_Sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `NIT_Sucursal` varchar(50) NOT NULL,
  `nombre_Sucursal` varchar(50) NOT NULL,
  `departamento_Sucursal` enum('Amazonas','Antioquia','Arauca','Atlántico','Bolívar','Boyacá','Caldas','Caquetá','Casanare','Cauca','Cesar','Chocó','Córdoba','Cundinamarca','Guainía','Guaviare','Huila','La Guajira','Magdalena','Meta','Nariño','Norte de Santander','Putumayo','Quindío','Risaralda','San Andrés y Providencia','Santander','Sucre','Tolima','Valle del Cauca','Vaupés','Vichada') NOT NULL,
  `cuidad_Sucursal` varchar(50) NOT NULL,
  `calle_Sucursal` int(11) NOT NULL,
  `carrera_Sucursal` int(11) NOT NULL,
  `telefono_Sucursal` varchar(10) NOT NULL,
  `correo_Sucursal` varchar(80) NOT NULL,
  PRIMARY KEY (`id_Sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `sucursal` */

insert  into `sucursal`(`id_Sucursal`,`NIT_Sucursal`,`nombre_Sucursal`,`departamento_Sucursal`,`cuidad_Sucursal`,`calle_Sucursal`,`carrera_Sucursal`,`telefono_Sucursal`,`correo_Sucursal`) values (1,'123456789-0','Sucursal Medellín','Antioquia','Medellín',123,45,'312-345-67','sucursal@example.com'),(2,'123456789-1','Sucursal Sibaté','Cundinamarca','Sibaté',10,7,'311-111-11','sibate@example.com'),(3,'123456789-2','Sucursal Bogotá','Cundinamarca','Bogotá',2,21,'322-222-22','bogota@example.com');

/*Table structure for table `vehiculo` */

DROP TABLE IF EXISTS `vehiculo`;

CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `Huesped_idHuesped` int(11) NOT NULL,
  `placa_Vehiculo` varchar(10) NOT NULL,
  `modelo_Vehiculo` varchar(45) NOT NULL,
  `color_Vehiculo` varchar(15) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  KEY `fk_Vehiculo_Huesped1` (`Huesped_idHuesped`),
  CONSTRAINT `fk_Vehiculo_Huesped1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `vehiculo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
