/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.22-MariaDB : Database - sjreal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sjreal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `cliente_de` */

insert  into `cliente_de`(`idCliente_De`,`Sucursal_id_Sucursal`,`Proveedor_idProveedor`,`fecha_Inicio_Actividades`,`antiguedad_actividades`) values (1,1,3,'2020-12-05',2),(2,2,3,'2020-12-05',2),(3,3,3,'2019-06-20',4),(4,1,1,'2020-12-05',2),(5,2,1,'2020-12-05',2),(6,3,1,'2019-06-20',4),(7,1,2,'2020-12-05',2),(8,2,2,'2020-12-05',2),(9,3,2,'2019-06-20',4),(10,1,4,'2020-12-05',2),(11,2,4,'2020-12-05',2),(12,3,4,'2019-06-20',4),(13,1,5,'2020-12-05',2),(14,2,5,'2020-12-05',2),(15,3,5,'2019-06-20',4),(16,1,6,'2020-12-05',2),(17,2,6,'2020-12-05',2),(18,3,6,'2019-06-20',4),(19,1,7,'2020-12-05',2),(20,2,7,'2020-12-05',2),(21,3,7,'2019-06-20',4);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `control_salida` */

insert  into `control_salida`(`idControl`,`Rol_Empleado_idRol_Empleado`,`Inventario_idInventario`,`concepto_Salida`,`cantidad`) values (1,4,62,'Salida de dos cuñetes de pintura',2),(2,8,63,'Salida de dos cuñetes de pintura',2),(3,12,64,'Salida de dos cuñetes de pintura',2),(4,3,66,'Salida de dos bolsas de jabon',2),(5,7,66,'Salida de dos bolsas de jabon',2),(6,11,67,'Salida de dos bolsas de jabon',2),(7,3,68,'Salida de una botella de cloro',1),(8,7,69,'Salida de una botella de cloro',1),(9,11,70,'Salida de una botella de cloro',1);

/*Table structure for table `detalle_mantenimiento_habitacion` */

DROP TABLE IF EXISTS `detalle_mantenimiento_habitacion`;

CREATE TABLE `detalle_mantenimiento_habitacion` (
  `idDetalle_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `fecha_Mantenimiento` datetime NOT NULL,
  `descripcion_Mantenimiento` varchar(200) NOT NULL,
  `nombre_Mantenimiento` varchar(50) NOT NULL,
  `tipo_Mantenimiento` enum('Mejora','Reparación','Saneamineto') NOT NULL,
  `Rol_Empleado_id` int(11) NOT NULL,
  `Control_Salida_id` int(11) NOT NULL,
  PRIMARY KEY (`idDetalle_habitacion`),
  KEY `fk_Detalle_Habitacion` (`Habitacion_idHabitacion`),
  KEY `Rol_Empleado_id` (`Rol_Empleado_id`),
  KEY `Control_Salida_id` (`Control_Salida_id`),
  CONSTRAINT `detalle_mantenimiento_habitacion_ibfk_1` FOREIGN KEY (`Rol_Empleado_id`) REFERENCES `rol_empleado` (`idRol_Empleado`),
  CONSTRAINT `detalle_mantenimiento_habitacion_ibfk_2` FOREIGN KEY (`Control_Salida_id`) REFERENCES `control_salida` (`idControl`),
  CONSTRAINT `fk_Detalle_Habitacion` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detalle_mantenimiento_habitacion` */

insert  into `detalle_mantenimiento_habitacion`(`idDetalle_habitacion`,`Habitacion_idHabitacion`,`fecha_Mantenimiento`,`descripcion_Mantenimiento`,`nombre_Mantenimiento`,`tipo_Mantenimiento`,`Rol_Empleado_id`,`Control_Salida_id`) values (1,29,'2023-01-10 17:00:00','Aseo de la habitacion 201 de la sucursal Sibaté','Aseo habitación','Saneamineto',3,5),(2,33,'2023-01-10 17:00:00','Aseo de la habitacion 205 de la sucursal Sibaté','Aseo habitación','Saneamineto',3,5),(3,7,'2023-01-10 15:00:00','Aseo de la habitacion 107 de la sucursal MEdellín','Aseo habitación','Saneamineto',7,5);

/*Table structure for table `detalle_pago` */

DROP TABLE IF EXISTS `detalle_pago`;

CREATE TABLE `detalle_pago` (
  `id_Detalle_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Pago_idPago` int(11) NOT NULL,
  `Inventario_idInventario` int(11) NOT NULL,
  `precio_Total` decimal(10,2) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  `cantidad_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_Detalle_Pago`),
  KEY `fk_Producto_has_Pago_Pago1` (`Pago_idPago`),
  KEY `fk_Producto_idProducto1` (`Inventario_idInventario`),
  CONSTRAINT `fk_Producto_has_Pago_Pago1` FOREIGN KEY (`Pago_idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_idProducto1` FOREIGN KEY (`Inventario_idInventario`) REFERENCES `inventario` (`idInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

/*Data for the table `detalle_pago` */

insert  into `detalle_pago`(`id_Detalle_Pago`,`Pago_idPago`,`Inventario_idInventario`,`precio_Total`,`precio_producto`,`cantidad_producto`) values (1,1,1,0.00,0.00,2),(2,1,8,0.00,0.00,1),(3,2,1,0.00,0.00,2),(4,2,8,0.00,0.00,1),(5,3,21,0.00,0.00,2),(6,3,27,0.00,0.00,1),(7,4,36,0.00,0.00,2),(8,4,43,0.00,0.00,1),(9,5,1,0.00,0.00,2),(10,5,8,0.00,0.00,1),(11,6,1,0.00,0.00,2),(12,6,8,0.00,0.00,1),(13,7,21,0.00,0.00,2),(14,7,27,0.00,0.00,1),(15,8,21,0.00,0.00,2),(16,8,27,0.00,0.00,1),(17,9,36,0.00,0.00,2),(18,9,43,0.00,0.00,1),(19,10,1,0.00,0.00,2),(20,10,8,0.00,0.00,1),(21,11,21,0.00,0.00,2),(22,11,27,0.00,0.00,1),(23,12,36,0.00,0.00,2),(24,12,43,0.00,0.00,1),(25,13,1,0.00,0.00,2),(26,13,8,0.00,0.00,1),(27,14,21,0.00,0.00,2),(28,14,27,0.00,0.00,1),(29,15,36,0.00,0.00,2),(30,15,43,0.00,0.00,1),(31,16,1,0.00,0.00,2),(32,16,8,0.00,0.00,1),(33,17,1,0.00,0.00,2),(34,17,8,0.00,0.00,1),(35,18,21,0.00,0.00,2),(36,18,27,0.00,0.00,1),(37,19,21,0.00,0.00,2),(38,19,27,0.00,0.00,1),(39,20,36,0.00,0.00,2),(40,20,43,0.00,0.00,1),(41,21,1,0.00,0.00,2),(42,21,8,0.00,0.00,1),(43,22,1,0.00,0.00,2),(44,22,8,0.00,0.00,1),(45,23,21,0.00,0.00,2),(46,23,27,0.00,0.00,1),(47,24,36,0.00,0.00,2),(48,24,43,0.00,0.00,1),(49,25,1,0.00,0.00,2),(50,25,8,0.00,0.00,1),(51,26,1,0.00,0.00,2),(52,26,8,0.00,0.00,1),(53,27,21,0.00,0.00,2),(54,27,27,0.00,0.00,1),(55,28,36,0.00,0.00,2),(56,28,43,0.00,0.00,1),(57,29,36,0.00,0.00,2),(58,29,43,0.00,0.00,1),(59,30,21,0.00,0.00,2),(60,30,27,0.00,0.00,1),(61,31,21,0.00,0.00,2),(62,31,27,0.00,0.00,1),(63,32,36,0.00,0.00,2),(64,32,43,0.00,0.00,1),(65,33,1,0.00,0.00,2),(66,33,8,0.00,0.00,1),(67,34,21,0.00,0.00,2),(68,34,27,0.00,0.00,1),(69,35,1,0.00,0.00,2),(70,35,8,0.00,0.00,1),(71,36,1,0.00,0.00,2),(72,36,8,0.00,0.00,1),(73,37,1,0.00,0.00,2),(74,37,8,0.00,0.00,1),(75,38,1,0.00,0.00,2),(76,38,8,0.00,0.00,1),(77,39,1,0.00,0.00,2),(78,39,8,0.00,0.00,1),(79,40,1,0.00,0.00,2),(80,40,8,0.00,0.00,1),(81,41,1,0.00,0.00,2),(82,41,8,0.00,0.00,1),(83,42,1,0.00,0.00,2),(84,42,8,0.00,0.00,1),(85,43,1,0.00,0.00,2),(86,43,8,0.00,0.00,1),(87,44,1,0.00,0.00,2),(88,44,8,0.00,0.00,1),(89,45,1,0.00,0.00,2),(90,45,8,0.00,0.00,1),(91,46,1,0.00,0.00,2),(92,46,8,0.00,0.00,1),(93,47,21,0.00,0.00,2),(94,47,27,0.00,0.00,1),(95,48,21,0.00,0.00,2),(96,48,27,0.00,0.00,1),(97,49,21,0.00,0.00,2),(98,49,27,0.00,0.00,1),(99,50,21,0.00,0.00,2),(100,50,27,0.00,0.00,1),(101,51,1,0.00,0.00,2),(102,51,8,0.00,0.00,1),(103,52,1,0.00,0.00,2),(104,52,8,0.00,0.00,1),(105,53,1,0.00,0.00,2),(106,53,8,0.00,0.00,1),(107,54,21,0.00,0.00,2),(108,54,27,0.00,0.00,1),(109,55,21,0.00,0.00,2),(110,55,27,0.00,0.00,1),(111,56,21,0.00,0.00,2),(112,56,27,0.00,0.00,1),(113,57,36,0.00,0.00,2),(114,57,43,0.00,0.00,1),(115,58,1,0.00,0.00,2),(116,58,8,0.00,0.00,1),(117,59,1,0.00,0.00,2),(118,59,8,0.00,0.00,1),(119,60,1,0.00,0.00,2),(120,60,8,0.00,0.00,1),(121,61,1,0.00,0.00,2),(122,61,8,0.00,0.00,1),(123,62,36,0.00,0.00,2),(124,62,43,0.00,0.00,1),(125,63,36,0.00,0.00,2),(126,63,43,0.00,0.00,1),(127,64,36,0.00,0.00,2),(128,64,43,0.00,0.00,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

/*Data for the table `detallepedido` */

insert  into `detallepedido`(`idDetalle`,`cantidad_Producto`,`precio_unitario`,`precio_Total`,`Pedido_idPedido`,`Inventario_idInventario`) values (1,80,20000.00,1600000.00,1,1),(2,80,2000.00,160000.00,7,2),(3,40,15000.00,600000.00,16,3),(4,15,1500.00,22500.00,7,4),(5,150,30000.00,4500000.00,4,5),(6,80,5000.00,400000.00,7,6),(7,40,15000.00,600000.00,16,7),(8,20,50000.00,1000000.00,7,8),(9,90,10000.00,900000.00,4,9),(10,80,2000.00,160000.00,7,10),(11,30,1200.00,36000.00,19,11),(12,30,40000.00,1200000.00,4,12),(13,10,3500.00,35000.00,7,13),(14,5,40000.00,200000.00,16,14),(15,5,3000.00,15000.00,19,15),(16,20,7000.00,140000.00,4,16),(17,30,4000.00,120000.00,7,17),(18,50,3000.00,150000.00,16,18),(19,10,6000.00,60000.00,19,19),(20,30,50000.00,1500000.00,4,20),(21,80,20000.00,1600000.00,2,21),(22,80,2000.00,160000.00,8,22),(23,40,15000.00,600000.00,17,23),(24,150,30000.00,4500000.00,5,24),(25,80,5000.00,400000.00,8,25),(26,40,15000.00,600000.00,17,26),(27,20,50000.00,1000000.00,8,27),(28,90,10000.00,900000.00,5,28),(29,30,1200.00,36000.00,20,29),(30,30,40000.00,1200000.00,5,30),(31,10,3500.00,35000.00,8,31),(32,20,7000.00,140000.00,5,32),(33,30,4000.00,120000.00,8,33),(34,50,3000.00,150000.00,17,34),(35,10,6000.00,60000.00,20,35),(36,80,20000.00,1600000.00,3,36),(37,80,2000.00,160000.00,9,37),(38,40,15000.00,600000.00,18,38),(39,15,1500.00,22500.00,9,39),(40,150,30000.00,4500000.00,6,40),(41,80,5000.00,400000.00,9,41),(42,40,15000.00,600000.00,18,42),(43,20,50000.00,1000000.00,9,43),(44,90,10000.00,900000.00,6,44),(45,80,2000.00,160000.00,9,45),(46,30,1200.00,36000.00,21,46),(47,30,40000.00,1200000.00,6,47),(48,10,3500.00,35000.00,9,48),(49,5,40000.00,200000.00,18,49),(50,5,3000.00,15000.00,21,50),(51,20,7000.00,140000.00,6,51),(52,30,4000.00,120000.00,9,52),(53,50,3000.00,150000.00,18,53),(54,10,6000.00,60000.00,21,54),(55,30,50000.00,1500000.00,6,55),(56,15,6000.00,90000.00,9,56);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `habitacion` */

insert  into `habitacion`(`idHabitacion`,`Sucursal_id_Sucursal`,`numero_Habitacion`,`descripcion _Habitacion`,`tipo_Habitacion`,`capacidad_Habitacion`,`precio_Habitacion`) values (1,1,'101','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(2,1,'102','Habitación Doble con vista al balcón','Doble',4,120000),(3,1,'103','Habitación Doble con vista al balcón','Doble',4,120000),(4,1,'104','Habitación Doble con vista al balcón','Doble',4,120000),(5,1,'105','Habitación Doble con vista al balcón','Doble',4,120000),(6,1,'106','Habitación Doble con vista al balcón','Doble',4,120000),(7,1,'107','Habitación Doble con vista al balcón','Doble',4,120000),(8,1,'201','Habitación Para pareja con balcón','Para pareja',2,60000),(9,1,'202','Habitación Para pareja con balcón','Para pareja',2,60000),(10,1,'203','Habitación Para pareja con balcón','Para pareja',2,60000),(11,1,'204','Habitación Para pareja con balcón','Para pareja',2,60000),(12,1,'205','Habitación Para pareja con balcón','Para pareja',2,60000),(13,1,'206','Habitación Para pareja con balcón','Para pareja',2,60000),(14,1,'207','Habitación Para pareja con balcón','Para pareja',2,60000),(15,1,'301','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(16,1,'302','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(17,1,'303','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(18,1,'304','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(19,1,'305','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(20,1,'306','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(21,1,'307','Habitación Sencilla con vista al jardín','Sencilla',1,50000),(22,1,'401','Habitación Doble con vista al balcón','Doble',4,120000),(23,1,'402','Habitación Doble con vista al balcón','Doble',4,120000),(24,1,'403','Habitación Doble con vista al balcón','Doble',4,120000),(25,1,'404','Habitación Doble con vista al balcón','Doble',4,120000),(26,1,'405','Habitación Doble con vista al balcón','Doble',4,120000),(27,1,'406','Habitación Doble con vista al balcón','Doble',4,120000),(28,1,'407','Habitación Doble con vista al balcón','Doble',4,120000),(29,2,'201','Habitación Sencilla con balcón','Sencilla',1,50000),(30,2,'202','Habitación Sencilla con balcón','Sencilla',1,50000),(31,2,'203','Habitación Sencilla con balcón','Sencilla',1,50000),(32,2,'204','Habitación Sencilla con balcón','Sencilla',1,50000),(33,2,'205','Habitación Sencilla con balcón','Sencilla',1,50000),(34,2,'206','Habitación Sencilla con balcón','Sencilla',1,50000),(35,2,'207','Habitación Sencilla con balcón','Sencilla',1,50000),(36,2,'301','Habitación Doble con balcón','Doble',4,120000),(37,2,'302','Habitación Doble con balcón','Doble',4,120000),(38,2,'303','Habitación Doble con balcón','Doble',4,120000),(39,2,'304','Habitación Doble con balcón','Doble',4,120000),(40,2,'305','Habitación Doble con balcón','Doble',4,120000),(41,2,'306','Habitación Doble con balcón','Doble',4,120000),(42,2,'307','Habitación Doble con balcón','Doble',4,120000),(43,2,'401','Habitación Para pareja con balcón','Para pareja',2,60000),(44,2,'402','Habitación Para pareja con balcón','Para pareja',2,60000),(45,2,'403','Habitación Para pareja con balcón','Para pareja',2,60000),(46,2,'404','Habitación Para pareja con balcón','Para pareja',2,60000),(47,2,'405','Habitación Para pareja con balcón','Para pareja',2,60000),(48,2,'406','Habitación Para pareja con balcón','Para pareja',2,60000),(49,2,'407','Habitación Para pareja con balcón','Para pareja',2,60000),(50,3,'101','Habitación Sencilla con balcón','Sencilla',1,50000),(51,3,'102','Habitación Sencilla con balcón','Sencilla',1,50000),(52,3,'103','Habitación Sencilla con balcón','Sencilla',1,50000),(53,3,'104','Habitación Sencilla con balcón','Sencilla',1,50000),(54,3,'105','Habitación Sencilla con balcón','Sencilla',1,50000),(55,3,'106','Habitación Sencilla con balcón','Sencilla',1,50000),(56,3,'107','Habitación Sencilla con balcón','Sencilla',1,50000),(57,3,'201','Habitación Doble con balcón','Doble',4,120000),(58,3,'202','Habitación Doble con balcón','Doble',4,120000),(59,3,'203','Habitación Doble con balcón','Doble',4,120000),(60,3,'204','Habitación Doble con balcón','Doble',4,120000),(61,3,'205','Habitación Doble con balcón','Doble',4,120000),(62,3,'206','Habitación Doble con balcón','Doble',4,120000),(63,3,'207','Habitación Doble con balcón','Doble',4,120000),(64,3,'301','Habitación Para pareja con balcón','Para pareja',2,60000),(65,3,'302','Habitación Para pareja con balcón','Para pareja',2,60000),(66,3,'303','Habitación Para pareja con balcón','Para pareja',2,60000),(67,3,'304','Habitación Para pareja con balcón','Para pareja',2,60000),(68,3,'305','Habitación Para pareja con balcón','Para pareja',2,60000);

/*Table structure for table `hospedaje` */

DROP TABLE IF EXISTS `hospedaje`;

CREATE TABLE `hospedaje` (
  `idHospedaje` int(11) NOT NULL AUTO_INCREMENT,
  `Habitacion_idHabitacion` int(11) NOT NULL,
  `tipo_Hospedaje` enum('Reserva','Hospedaje normal') NOT NULL,
  `cantidad_menores` int(11) NOT NULL,
  `cantidad_adultos` int(11) NOT NULL,
  `total_personas` int(11) NOT NULL,
  PRIMARY KEY (`idHospedaje`),
  KEY `fk_Habitacion_has_Huesped_Habitacion1` (`Habitacion_idHabitacion`),
  CONSTRAINT `fk_Habitacion_has_Huesped_Habitacion1` FOREIGN KEY (`Habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `hospedaje` */

insert  into `hospedaje`(`idHospedaje`,`Habitacion_idHabitacion`,`tipo_Hospedaje`,`cantidad_menores`,`cantidad_adultos`,`total_personas`) values (1,7,'Reserva',0,0,0),(2,7,'Reserva',0,0,0),(3,29,'Hospedaje normal',0,0,0),(4,50,'Reserva',0,0,0),(5,9,'Hospedaje normal',0,0,0),(6,9,'Hospedaje normal',0,0,0),(7,36,'Reserva',0,0,0),(8,36,'Reserva',0,0,0),(9,51,'Hospedaje normal',0,0,0),(10,1,'Reserva',0,0,0),(11,33,'Hospedaje normal',0,0,0),(12,56,'Reserva',0,0,0),(13,20,'Hospedaje normal',0,0,0),(14,35,'Reserva',0,0,0),(15,53,'Hospedaje normal',0,0,0),(16,19,'Reserva',0,0,0),(17,21,'Reserva',0,0,0),(18,44,'Hospedaje normal',0,0,0),(19,44,'Hospedaje normal',0,0,0),(20,54,'Reserva',0,0,0),(21,13,'Hospedaje normal',0,0,0),(22,13,'Hospedaje normal',0,0,0),(23,31,'Reserva',0,0,0),(24,50,'Hospedaje normal',0,0,0),(25,1,'Reserva',0,0,0),(26,1,'Hospedaje normal',0,0,0),(27,30,'Reserva',0,0,0),(28,61,'Hospedaje normal',0,0,0),(29,61,'Hospedaje normal',0,0,0),(30,46,'Reserva',0,0,0),(31,46,'Reserva',0,0,0),(32,52,'Hospedaje normal',0,0,0),(33,14,'Reserva',0,0,0),(34,31,'Hospedaje normal',0,0,0),(35,1,'Reserva',0,0,0),(36,15,'Hospedaje normal',0,0,0),(37,16,'Reserva',0,0,0),(38,9,'Hospedaje normal',0,0,0),(39,9,'Hospedaje normal',0,0,0),(40,17,'Reserva',0,0,0),(41,18,'Hospedaje normal',0,0,0),(42,19,'Reserva',0,0,0),(43,10,'Hospedaje normal',0,0,0),(44,10,'Hospedaje normal',0,0,0),(45,20,'Reserva',0,0,0),(46,21,'Hospedaje normal',0,0,0),(47,29,'Reserva',0,0,0),(48,30,'Hospedaje normal',0,0,0),(49,31,'Reserva',0,0,0),(50,32,'Hospedaje normal',0,0,0),(51,2,'Hospedaje normal',0,0,0),(52,2,'Hospedaje normal',0,0,0),(53,2,'Reserva',0,0,0),(54,33,'Hospedaje normal',0,0,0),(55,34,'Reserva',0,0,0),(56,35,'Hospedaje normal',0,0,0),(57,50,'Reserva',0,0,0),(58,11,'Hospedaje normal',0,0,0),(59,11,'Hospedaje normal',0,0,0),(60,12,'Reserva',0,0,0),(61,12,'Reserva',0,0,0),(62,51,'Hospedaje normal',0,0,0),(63,52,'Reserva',0,0,0),(64,53,'Hospedaje normal',0,0,0),(65,54,'Reserva',0,0,0),(66,55,'Reserva',0,0,0),(67,56,'Reserva',0,0,0),(68,13,'Reserva',0,0,0),(69,13,'Reserva',0,0,0),(70,1,'Reserva',0,0,0),(71,15,'Reserva',0,0,0),(72,16,'Reserva',0,0,0),(73,17,'Reserva',0,0,0),(74,18,'Reserva',0,0,0),(75,19,'Reserva',0,0,0),(76,20,'Reserva',0,0,0),(77,21,'Reserva',0,0,0),(78,29,'Reserva',0,0,0),(79,30,'Reserva',0,0,0),(80,31,'Reserva',0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

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
  `estado` enum('Activo','Inactivo') NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idInventario`),
  KEY `fk_Sucursal_has_Inventario_Sucursal1` (`Sucursal_id_Sucursal`),
  KEY `fk_Inventario_Producto1` (`Producto_idProducto`),
  CONSTRAINT `fk_Inventario_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Inventario_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Data for the table `inventario` */

insert  into `inventario`(`idInventario`,`Sucursal_id_Sucursal`,`Producto_idProducto`,`nombre_Inventario`,`existencias_Inventario`,`minimo_Producto`,`maximo_Producto`,`estado`,`precio_producto`) values (1,1,1,'Inventario de toallas',0,80,150,'Activo',0.00),(2,1,2,'Inventario de jabones',0,80,200,'Activo',0.00),(3,1,3,'Inventario de gaseosas',0,40,80,'Activo',0.00),(4,1,4,'Inventario de cepillos dentales',0,15,30,'Activo',0.00),(5,1,5,'Inventario de sábanas',0,150,200,'Activo',0.00),(6,1,6,'Inventario de champú',0,80,150,'Activo',0.00),(7,1,7,'Inventario de botellas de agua',0,40,80,'Activo',0.00),(8,1,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo',0.00),(9,1,9,'Inventario de almohadas',0,90,100,'Activo',0.00),(10,1,10,'Inventario de jabon de baño',0,80,150,'Activo',0.00),(11,1,11,'Inventario de Snacks variados',0,30,50,'Activo',0.00),(12,1,12,'Inventario de cobijas de lana',0,30,50,'Activo',0.00),(13,1,13,'Inventario de crema dental',0,10,15,'Activo',0.00),(14,1,14,'Inventario de vinotinto',0,5,20,'Activo',0.00),(15,1,15,'Inventario del rollo de papel de cocina',0,5,10,'Activo',0.00),(16,1,16,'Inventario de prendas de ropa interior',0,20,30,'Activo',0.00),(17,1,17,'Inventario de gel de ducha',0,30,50,'Activo',0.00),(18,1,18,'Inventario de latas de cerveza',0,50,80,'Activo',0.00),(19,1,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo',0.00),(20,1,20,'Inventario de alfombras',0,30,40,'Activo',0.00),(21,2,1,'Inventario de toallas',0,80,150,'Activo',0.00),(22,2,2,'Inventario de jabones',0,80,200,'Activo',0.00),(23,2,3,'Inventario de gaseosas',0,40,80,'Activo',0.00),(24,2,5,'Inventario de sábanas',0,150,200,'Activo',0.00),(25,2,6,'Inventario de champú',0,80,150,'Activo',0.00),(26,2,7,'Inventario de botellas de agua',0,40,80,'Activo',0.00),(27,2,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo',0.00),(28,2,9,'Inventario de almohadas',0,90,100,'Activo',0.00),(29,2,11,'Inventario de Snacks variados',0,30,50,'Activo',0.00),(30,2,12,'Inventario de cobijas de lana',0,30,50,'Activo',0.00),(31,2,13,'Inventario de crema dental',0,10,15,'Activo',0.00),(32,2,16,'Inventario de prendas de ropa interior',0,20,30,'Activo',0.00),(33,2,17,'Inventario de gel de ducha',0,30,50,'Activo',0.00),(34,2,18,'Inventario de latas de cerveza',0,50,80,'Activo',0.00),(35,2,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo',0.00),(36,3,1,'Inventario de toallas',0,80,150,'Activo',0.00),(37,3,2,'Inventario de jabones',0,80,200,'Activo',0.00),(38,3,3,'Inventario de gaseosas',0,40,80,'Activo',0.00),(39,3,4,'Inventario de cepillos dentales',0,15,30,'Activo',0.00),(40,3,5,'Inventario de sábanas',0,150,200,'Activo',0.00),(41,3,6,'Inventario de champú',0,80,150,'Activo',0.00),(42,3,7,'Inventario de botellas de agua',0,40,80,'Activo',0.00),(43,3,8,'Inventario de paquetes de papel higiénico por 6',0,20,30,'Activo',0.00),(44,3,9,'Inventario de almohadas',0,90,100,'Activo',0.00),(45,3,10,'Inventario de jabon de baño',0,80,150,'Activo',0.00),(46,3,11,'Inventario de Snacks variados',0,30,50,'Activo',0.00),(47,3,12,'Inventario de cobijas de lana',0,30,50,'Activo',0.00),(48,3,13,'Inventario de crema dental',0,10,15,'Activo',0.00),(49,3,14,'Inventario de vinotinto',0,5,20,'Activo',0.00),(50,3,15,'Inventario del rollo de papel de cocina',0,5,10,'Activo',0.00),(51,3,16,'Inventario de prendas de ropa interior',0,20,30,'Activo',0.00),(52,3,17,'Inventario de gel de ducha',0,30,50,'Activo',0.00),(53,3,18,'Inventario de latas de cerveza',0,50,80,'Activo',0.00),(54,3,19,'Inventario de empaque de cubiertos desechables',0,10,20,'Activo',0.00),(55,3,20,'Inventario de alfombras',0,30,40,'Activo',0.00),(56,3,21,'Preservativos caja de 3',0,15,20,'Activo',0.00),(62,1,22,'Inventario de pintura',0,2,10,'Activo',0.00),(63,2,22,'Inventario de pintura',0,2,10,'Activo',0.00),(64,3,22,'Inventario de pintura',0,2,10,'Activo',0.00),(65,1,23,'Inventario de jabon en la sucursal Medellín ',0,10,20,'Activo',0.00),(66,2,23,'Inventario de jabon en la sucursal Sibaté ',0,10,25,'Activo',0.00),(67,3,23,'Inventario de jabon en la sucursal Medellín ',0,20,30,'Activo',0.00),(68,1,24,'Inventario de cloro en Medellín ',0,10,15,'Activo',0.00),(69,2,24,'Inventario de cloro en Sibacho',0,15,20,'Activo',0.00),(70,3,24,'Inventario de cloro en Bogotá ',0,10,20,'Activo',0.00);

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
  CONSTRAINT `mantenimiento_saneamiento_rutinario_ibfk_1` FOREIGN KEY (`Detalle_Mantenimiento_id`) REFERENCES `detalle_mantenimiento_habitacion` (`idDetalle_habitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Control_Salida_id` int(11) NOT NULL,
  PRIMARY KEY (`idMantenimiento_sucursal`),
  KEY `fk_Mantenimiento_Sucursal` (`Sucursal_idSucursal`),
  KEY `Rol_Empleado_id` (`Rol_Empleado_id`),
  KEY `Control_Salida_id` (`Control_Salida_id`),
  CONSTRAINT `fk_Mantenimiento_Sucursal` FOREIGN KEY (`Sucursal_idSucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mantenimiento_sucursal_ibfk_1` FOREIGN KEY (`Rol_Empleado_id`) REFERENCES `rol_empleado` (`idRol_Empleado`),
  CONSTRAINT `mantenimiento_sucursal_ibfk_2` FOREIGN KEY (`Control_Salida_id`) REFERENCES `control_salida` (`idControl`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `mantenimiento_sucursal` */

insert  into `mantenimiento_sucursal`(`idMantenimiento_sucursal`,`Sucursal_idSucursal`,`fecha_Mantenimiento`,`descripcion_Mantenimiento`,`nombre_Mantenimiento`,`tipo_Mantenimiento`,`Rol_Empleado_id`,`Control_Salida_id`) values (1,1,'2022-02-20','Pintura de la fachada de la sucursal','Retoque de pintura','Reparacion',4,1),(7,2,'2022-02-20','Pintura fachada de la sucursal de Sibacjo','Retoque de pintura','Reparacion',8,2);

/*Table structure for table `pago` */

DROP TABLE IF EXISTS `pago`;

CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `Hospedaje_idHospedaje` int(11) NOT NULL,
  `titular _Pago` varchar(80) NOT NULL,
  `IDTitular_Pago` varchar(20) NOT NULL,
  `tipo_Cliente` enum('Persona natural','Persona jurídica') NOT NULL,
  `medioDePago_Pago` enum('PSE','Tarjeta de crédito','Tarjeta de dédito','Efectivo') NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `concepto_Pago` varchar(500) NOT NULL,
  `descuento_pago` decimal(10,2) NOT NULL,
  `total_Pago` decimal(10,0) NOT NULL,
  `dias_hospedaje` int(11) NOT NULL,
  `precio_por_dia` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_Pago_Hospedaje1` (`Hospedaje_idHospedaje`),
  CONSTRAINT `fk_Pago_Hospedaje1` FOREIGN KEY (`Hospedaje_idHospedaje`) REFERENCES `hospedaje` (`idHospedaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `pago` */

insert  into `pago`(`idPago`,`Hospedaje_idHospedaje`,`titular _Pago`,`IDTitular_Pago`,`tipo_Cliente`,`medioDePago_Pago`,`fecha_pago`,`concepto_Pago`,`descuento_pago`,`total_Pago`,`dias_hospedaje`,`precio_por_dia`) values (1,1,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(2,2,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(3,3,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(4,4,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(5,5,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(6,6,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(7,7,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(8,8,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(9,9,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(10,10,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(11,11,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(12,12,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(13,13,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(14,14,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(15,15,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(16,16,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(17,17,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(18,18,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(19,19,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(20,20,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(21,21,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(22,22,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(23,23,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(24,24,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(25,25,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(26,26,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(27,27,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(28,28,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(29,29,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(30,30,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(31,31,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(32,32,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(33,33,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(34,34,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(35,35,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(36,36,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(37,37,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(38,38,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(39,39,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(40,40,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(41,41,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(42,42,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(43,43,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(44,44,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(45,45,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(46,46,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(47,47,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(48,48,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(49,49,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(50,50,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(51,51,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(52,52,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(53,53,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(54,54,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(55,55,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(56,56,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(57,57,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(58,58,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(59,59,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(60,60,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(61,61,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(62,62,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(63,63,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00),(64,64,'Por definir','Por definir','Persona natural','Efectivo','2031-03-30 12:00:00','Hospedaje',0.00,0,0,0.00);

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
  `concepto_Recibo` varchar(100) NOT NULL,
  `medida_consumo` varchar(50) NOT NULL,
  `consumo_Recibo` decimal(10,2) NOT NULL,
  `precio_medida` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idPago_Recibo`),
  KEY `fk_Pago_Recibo_Recibo1` (`Recibo_idRecibo`),
  KEY `fk_Pago_Recibo_Responsable1` (`Responsable_idResponsable1`),
  CONSTRAINT `fk_Pago_Recibo_Recibo1` FOREIGN KEY (`Recibo_idRecibo`) REFERENCES `recibo` (`idRecibo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `pago_recibo` */

insert  into `pago_recibo`(`idPago_Recibo`,`Recibo_idRecibo`,`Responsable_idResponsable1`,`fecha_Pago_Recibo`,`monto_Recibo`,`Pago_Con_Retraso`,`motivo_Retraso`,`concepto_Recibo`,`medida_consumo`,`consumo_Recibo`,`precio_medida`) values (1,1,1,'2023-01-23',230000,'No','N/A','Pago recibo luz Enero, sucursal Medellín','Kilovatio',50.00,2000.00),(2,18,1,'2023-01-08',231000,'No','N/A','Pago recibo gas Enero, sucursal Medellín','Metro cúbico de gas',34.00,1500.00),(3,10,1,'2023-03-27',198000,'No','N/A','Pago recibo agua Marzo, sucursal Medellín','Metro cúbico',140.30,1000.00),(4,10,1,'2023-02-18',198000,'No','N/A','Pago recibo agua Febrero, sucursal Medellín','Metro cúbico',120.60,1000.00),(5,10,1,'2023-01-17',198000,'No','N/A','Pago recibo agua Enero, sucursal Medellín','Metro cúbico',120.00,1000.00),(6,1,1,'2023-02-22',230000,'No','N/A','Pago recibo luz Febrero, sucursal Medellín','Kilovatio',49.00,2000.00),(7,1,1,'2023-03-25',230000,'No','N/A','Pago recibo luz Marzo, sucursal Medellín','Kilovatio',58.00,2000.00),(8,6,5,'2023-03-25',290000,'No','N/A','Pago recibo luz Marzo, sucursal Sibaté','Kilovatio',40.00,2000.00),(9,22,5,'2023-01-10',150000,'No','N/A','Pago recibo gas Enero, sucursal Sibaté','Metro cúbico de gas',45.00,1500.00),(10,21,5,'2023-02-17',150000,'No','N/A','Pago recibo agua Febrero, sucursal Sibaté','Metro cúbico',99.20,1000.00),(11,21,5,'2023-01-15',290000,'No','N/A','Pago recibo agua Enero, sucursal Sibaté','Metro cúbico',98.00,1000.00),(12,6,5,'2023-01-25',290000,'No','N/A','Pago recibo luz Enero, sucursal Sibaté','Kilovatio',45.00,2000.00),(13,6,5,'2023-02-24',290000,'No','N/A','Pago recibo luz Febrero, sucursal Sibaté','Kilovatio',44.00,2000.00),(14,9,9,'2023-03-24',310000,'No','N/A','Pago recibo luz Marzo, sucursal Bogotá','Kilovatio',46.70,2000.00),(15,17,9,'2023-01-15',200000,'No','N/A','Pago recibo agua Enero, sucursal Bogotá','Metro cúbico',109.00,1000.00),(16,17,9,'2023-02-15',200000,'No','N/A','Pago recibo agua Febrero, sucursal Bogotá','Metro cúbico',101.10,1000.00),(17,17,9,'2023-03-19',200000,'No','N/A','Pago recibo agua Marzo, sucursal Bogotá','Metro cúbico',110.60,1000.00),(18,9,9,'2023-02-24',310000,'No','N/A','Pago recibo luz Febrero, sucursal Bogotá','Kilovatio',49.20,2000.00),(19,9,9,'2023-01-24',310000,'No','N/A','Pago recibo luz Enero, sucursal Bogotá','Kilovatio',50.00,2000.00),(20,20,9,'2023-01-11',250000,'No','N/A','Pago recibo gas Enero, sucursal Bogotá','Metro cúbico de gas',23.00,1500.00);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

/*Data for the table `parqueadero` */

insert  into `parqueadero`(`idParqueadero`,`Sucursal_idSucursal`,`Vehiculo_idVehiculo`,`entrada_Vehiculo`,`salida_Vehiculo`,`ubicacion_Vehiculo`,`Empleado_idRol_Empleado`) values (1,1,1,'2023-02-07 12:15:00','2023-02-12',1,4),(2,1,1,'2023-03-01 12:15:00','2023-03-05',1,4),(3,1,2,'2023-01-15 13:30:00','2023-01-20',2,4),(4,1,2,'2023-02-12 15:45:00','2023-02-17',3,4),(5,1,2,'2023-03-06 11:45:00','2023-03-11',4,4),(6,1,6,'2023-02-18 09:30:00','2023-02-28',5,4),(7,1,8,'2023-03-13 16:15:00','2023-03-15',6,4),(8,1,8,'2023-03-05 12:30:00','2023-03-10',7,4),(9,1,6,'2023-02-07 12:15:00','2023-02-12',8,4),(10,1,6,'2023-02-18 11:30:00','2023-02-28',9,4),(11,1,9,'2023-02-26 16:30:00','2023-02-28',10,4),(12,1,9,'2023-03-10 14:45:00','2023-03-15',11,4),(13,1,4,'2023-02-18 11:30:00','2023-02-28',12,4),(14,1,4,'2023-02-18 11:30:00','2023-02-28',13,4),(15,1,3,'2023-02-06 14:45:00','2023-02-12',13,4),(16,1,3,'2023-01-20 16:30:00','2023-01-25',14,4),(17,1,3,'2023-01-09 13:30:00','2023-01-14',1,4),(18,1,5,'2023-02-28 14:15:00','2023-02-28',2,4),(19,2,7,'2023-02-07 14:30:00','2023-02-09',10,8),(20,2,9,'2023-02-10 14:30:00','2023-02-15',9,8),(21,2,6,'2023-01-04 08:00:00','2023-01-10',8,8),(22,2,1,'2023-01-10 14:30:00','2023-01-15',7,8),(23,2,3,'2023-01-20 16:30:00','2023-01-25',6,8),(24,2,3,'2023-02-20 16:30:00','2023-02-25',5,8),(25,2,3,'0023-01-20 16:30:00','2023-01-25',4,8),(26,2,10,'2023-02-19 09:15:00','2023-02-25',3,8),(27,2,10,'2023-01-08 12:00:00','2023-01-13',2,8),(28,2,10,'2023-03-04 08:15:00','2023-03-10',1,8),(29,3,9,'2023-02-04 08:00:00','2023-02-10',1,13);

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `IdPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_Entrega` datetime NOT NULL,
  `precio_Total_Pedido` decimal(10,0) NOT NULL,
  `cliente_De_id` int(11) NOT NULL,
  `Rol_idRol_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `fk_Pedido_Cliente_De1` (`cliente_De_id`),
  KEY `fk_Pedido_Rol_Empleado` (`Rol_idRol_Empleado`),
  CONSTRAINT `fk_Pedido_Cliente_De1` FOREIGN KEY (`cliente_De_id`) REFERENCES `cliente_de` (`idCliente_De`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Rol_Empleado` FOREIGN KEY (`Rol_idRol_Empleado`) REFERENCES `rol_empleado` (`idRol_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `pedido` */

insert  into `pedido`(`IdPedido`,`fecha_Entrega`,`precio_Total_Pedido`,`cliente_De_id`,`Rol_idRol_Empleado`) values (1,'2020-12-10 00:00:00',1600000,1,1),(2,'2020-12-10 00:00:00',1600000,2,5),(3,'2019-06-30 00:00:00',1600000,3,9),(4,'2020-12-10 00:00:00',8240000,4,1),(5,'2020-12-10 00:00:00',6740000,5,5),(6,'2019-06-30 00:00:00',8240000,6,9),(7,'2020-12-10 00:00:00',1897500,7,1),(8,'2020-12-10 00:00:00',1715000,8,5),(9,'2019-06-30 00:00:00',1987500,9,9),(10,'2020-12-10 00:00:00',0,10,1),(11,'2020-12-10 00:00:00',0,11,5),(12,'2019-06-30 00:00:00',0,12,9),(13,'2020-12-10 00:00:00',0,13,1),(14,'2020-12-10 00:00:00',0,14,5),(15,'2019-06-30 00:00:00',0,15,9),(16,'2020-12-10 00:00:00',1550000,16,1),(17,'2020-12-10 00:00:00',1350000,17,5),(18,'2019-06-30 00:00:00',1550000,18,9),(19,'2020-12-10 00:00:00',111000,19,1),(20,'2020-12-10 00:00:00',96000,20,5),(21,'2019-06-30 00:00:00',111000,21,9);

/*Table structure for table `pqrfs` */

DROP TABLE IF EXISTS `pqrfs`;

CREATE TABLE `pqrfs` (
  `idPqrfs` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_PQRFs` enum('Pregunta','Queja','Reclamo','Felicitaciones') NOT NULL,
  `descripcion_PQRFs` varchar(500) NOT NULL,
  `fecha_Radicado` datetime NOT NULL,
  `estado_PQRFs` enum('Resuelta','Por resolver') NOT NULL,
  `Huesped_idHuesped` int(11) NOT NULL,
  `Rol_Empleado_idRol_Empleado` int(11) NOT NULL,
  PRIMARY KEY (`idPqrfs`),
  KEY `Huesped_idHuesped` (`Huesped_idHuesped`),
  KEY `Rol_Empleado_idRol_Empleado` (`Rol_Empleado_idRol_Empleado`),
  CONSTRAINT `pqrfs_ibfk_1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`),
  CONSTRAINT `pqrfs_ibfk_2` FOREIGN KEY (`Rol_Empleado_idRol_Empleado`) REFERENCES `rol_empleado` (`idRol_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `pqrfs` */

insert  into `pqrfs`(`idPqrfs`,`tipo_PQRFs`,`descripcion_PQRFs`,`fecha_Radicado`,`estado_PQRFs`,`Huesped_idHuesped`,`Rol_Empleado_idRol_Empleado`) values (1,'Queja','El dia x me quede en la sucursal x y las toallas estaban sucias','2023-02-01 12:30:00','Por resolver',29,1),(2,'Pregunta','¿Cuando abren una sucursal en Bucaramanga?','2023-01-13 10:45:00','Resuelta',11,5),(3,'Reclamo','El dia x me quede en la sucursal x y se me quedó un reloj negro','2023-02-15 10:15:00','Por resolver',10,9);

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `precio_Producto` decimal(10,2) NOT NULL,
  `descripcion_Producto` varchar(200) NOT NULL,
  `nombre_Producto` varchar(50) NOT NULL,
  `categoria_Producto` varchar(50) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `producto` */

insert  into `producto`(`idProducto`,`precio_Producto`,`descripcion_Producto`,`nombre_Producto`,`categoria_Producto`) values (1,0.00,'Toallas de algodón','Toallas','Textil '),(2,0.00,'Jabón de manos','Jabón','Aseo'),(3,2500.00,'Bebida gaseosa','Gaseosa','Bebidas'),(4,1200.00,'Cepillo de dientes','Cepillo dental','Aseo'),(5,40000.00,'Sábanas de seda','Sábanas','Textil '),(6,0.00,'Champú suave','Champú','Aseo'),(7,1500.75,'Agua mineral','Agua','Bebidas'),(8,0.00,'Papel higiénico','Papel higiénico','Aseo'),(9,22000.75,'Almohadas de plumas','Almohadas','Textil'),(10,0.00,'Jabón de baño','Jabón de baño','Aseo'),(11,20000.00,'Snacks variados','Snacks','Comestibles'),(12,0.00,'Cobijas de lana','Cobijas','Textil'),(13,5400.25,'Pasta de dientes','Pasta dental','Aseo'),(14,45000.50,'Vino tinto','Vino','Bebidas alcohólicas'),(15,6000.50,'Papel de cocina','Papel de cocina','Cocina'),(16,3000.75,'Ropa interior','Ropa interior','Textil '),(17,9000.99,'Gel de ducha','Gel de ducha','Aseo'),(18,4500.25,'Cerveza','Cerveza','Bebidas alcohólicas'),(19,14000.00,'Cubiertos desechables','Cubiertos','Cocina'),(20,29000.50,'Alfombras','Alfombras','Textil'),(21,4000.00,'Preservativos de x marca','Preservativos','Farmacia'),(22,60000.00,'Cuñete de pintura','Pintura','Ferretería '),(23,20000.00,'Bolsa de cuatro kilos de jabon','Jabon','Aseo'),(24,10000.00,'Pimpina de cuatro litro de cloro','Cloro','Aseo');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
  `categoria_Proveedor` enum('Aseo','Textiles','Ferretería','Muebles','Comestibles','Bebidas') DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `proveedor` */

insert  into `proveedor`(`idProveedor`,`NIT_Proveedor`,`nombre_Proveedor`,`telefono_Proveedor`,`correo_Proveedor`,`categoria_Proveedor`) values (1,'123456789-1','Proveedor de Textiles','34567890','proveedor.textiles@example.com','Textiles'),(2,'987654321-2','Proveedor de Productos de Aseo','3123456789','proveedor.aseo@example.com','Aseo'),(3,'555555555-3','Proveedor de Toallas','3333333333','proveedor.toallas@example.com','Textiles'),(4,'555545655-3','Proveedor de mobiliario','3213333333','proveedor.mobiliario@example.com',''),(5,'890545655-3','Proveedor de ferretería','3213333358','proveedor.ferreteria@example.com','Ferretería'),(6,'890545655-3','Proveedor de bebidas','3213333358','proveedor@example.com','Bebidas'),(7,'890545655-3','Proveedor de comestibles','3213333358','proveedor.fe@example.com','Comestibles');

/*Table structure for table `recibo` */

DROP TABLE IF EXISTS `recibo`;

CREATE TABLE `recibo` (
  `idRecibo` int(11) NOT NULL AUTO_INCREMENT,
  `Servicio_Publico_idServicio_Publico` int(11) NOT NULL,
  `Sucursal_id_Sucursal` int(11) NOT NULL,
  `concepto_Recibo` varchar(100) NOT NULL,
  PRIMARY KEY (`idRecibo`),
  KEY `fk_Servicio_Publico_has_Sucursal_Servicio_Publico` (`Servicio_Publico_idServicio_Publico`),
  KEY `fk_Servicio_Publico_has_Sucursal_Sucursal1` (`Sucursal_id_Sucursal`),
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Servicio_Publico` FOREIGN KEY (`Servicio_Publico_idServicio_Publico`) REFERENCES `servicio_publico` (`idServicio_Publico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Sucursal1` FOREIGN KEY (`Sucursal_id_Sucursal`) REFERENCES `sucursal` (`id_Sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `recibo` */

insert  into `recibo`(`idRecibo`,`Servicio_Publico_idServicio_Publico`,`Sucursal_id_Sucursal`,`concepto_Recibo`) values (1,1,1,'Pago recibo luz, sucursal Medellín'),(6,4,2,'Pago recibo luz, sucursal Sibaté'),(9,7,3,'Pago recibo luz, sucursal Bogotá'),(10,2,1,'Pago recibo agua, sucursal Medellín'),(17,8,3,'Pago recibo agua, sucursal Bogotá'),(18,3,1,'Pago recibo gas, sucursal Medellín'),(20,9,3,'Pago recibo gas, sucursal Bogotá'),(21,5,2,'Pago recibo agua, sucursal Sibaté'),(22,6,2,'Pago recibo gas, sucursal Sibaté');

/*Table structure for table `registro_salida_entrada` */

DROP TABLE IF EXISTS `registro_salida_entrada`;

CREATE TABLE `registro_salida_entrada` (
  `idRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `Hospedaje_IdHospedaje` int(11) NOT NULL,
  `Huesped_idHuesped` int(11) NOT NULL,
  `checkIn_Hospedaje` datetime(2) NOT NULL,
  `checkOut_Hospedaje` datetime(2) NOT NULL,
  PRIMARY KEY (`idRegistro`),
  KEY `fk_Habitacion_has_Huesped_Huesped1` (`Huesped_idHuesped`),
  KEY `Hospedaje_IdHospedaje` (`Hospedaje_IdHospedaje`),
  CONSTRAINT `registro_salida_entrada_ibfk_1` FOREIGN KEY (`Huesped_idHuesped`) REFERENCES `huesped` (`idHuesped`),
  CONSTRAINT `registro_salida_entrada_ibfk_2` FOREIGN KEY (`Hospedaje_IdHospedaje`) REFERENCES `hospedaje` (`idHospedaje`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

/*Data for the table `registro_salida_entrada` */

insert  into `registro_salida_entrada`(`idRegistro`,`Hospedaje_IdHospedaje`,`Huesped_idHuesped`,`checkIn_Hospedaje`,`checkOut_Hospedaje`) values (1,1,1,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00'),(2,1,2,'2023-01-05 12:00:00.00','2023-01-10 14:00:00.00'),(3,2,3,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00'),(4,3,22,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00'),(5,4,14,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00'),(6,4,31,'2023-01-15 13:30:00.00','2023-01-20 15:30:00.00'),(7,5,40,'2023-01-20 16:30:00.00','2023-01-25 12:00:00.00'),(8,5,9,'2023-01-12 10:45:00.00','2023-01-24 13:00:00.00'),(9,6,1,'2023-01-25 12:45:00.00','2023-01-28 11:00:00.00'),(10,7,49,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00'),(11,8,44,'2023-01-08 12:00:00.00','2023-01-13 14:00:00.00'),(12,9,29,'2023-02-01 09:30:00.00','2023-01-07 14:15:00.00'),(13,10,39,'2023-01-10 14:30:00.00','2023-01-15 09:45:00.00'),(14,11,23,'2023-01-04 08:00:00.00','2023-01-10 16:30:00.00'),(15,12,15,'2023-01-15 10:15:00.00','2023-01-20 15:30:00.00'),(16,13,40,'2023-01-09 13:30:00.00','2023-01-14 11:45:00.00'),(17,65,40,'2023-01-20 16:30:00.00','2023-01-25 12:00:00.00'),(18,14,11,'2023-01-12 10:45:00.00','2023-01-17 13:00:00.00'),(19,14,32,'2023-01-12 12:45:00.00','2023-01-18 11:00:00.00'),(20,15,45,'2023-01-19 09:15:00.00','2023-01-25 14:45:00.00'),(21,16,15,'2023-02-05 12:00:00.00','2023-02-10 14:00:00.00'),(22,16,30,'2023-02-02 09:30:00.00','2023-02-08 14:15:00.00'),(23,17,26,'2023-02-10 14:30:00.00','2023-02-15 09:45:00.00'),(24,18,26,'2023-02-04 08:00:00.00','2023-02-10 16:30:00.00'),(25,19,10,'2023-02-15 10:15:00.00','2023-02-20 15:30:00.00'),(26,20,4,'2023-02-09 13:30:00.00','2023-02-14 11:45:00.00'),(27,21,40,'2023-02-20 16:30:00.00','2023-02-25 12:00:00.00'),(28,22,19,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00'),(29,22,8,'2023-02-25 10:45:00.00','2023-02-28 13:00:00.00'),(30,23,44,'2023-02-19 09:15:00.00','2023-02-25 14:45:00.00'),(31,23,30,'2023-02-06 08:30:00.00','2023-02-12 12:15:00.00'),(32,24,49,'2023-02-11 11:00:00.00','2023-02-16 13:30:00.00'),(33,25,15,'2023-02-16 14:45:00.00','2023-02-20 09:00:00.00'),(34,26,15,'2023-02-21 08:00:00.00','2023-02-27 15:15:00.00'),(35,27,26,'2023-02-26 16:30:00.00','2023-02-28 10:45:00.00'),(36,28,3,'2023-02-07 12:15:00.00','2023-02-12 14:30:00.00'),(37,29,14,'2023-02-12 15:45:00.00','2023-02-17 09:30:00.00'),(38,30,22,'2023-02-17 12:00:00.00','2023-02-22 13:45:00.00'),(39,30,31,'2023-02-17 12:30:00.00','2023-02-22 13:00:00.00'),(40,31,9,'2023-02-27 14:15:00.00','2023-02-28 09:00:00.00'),(41,32,40,'2023-02-06 14:45:00.00','2023-02-12 16:30:00.00'),(42,33,20,'2023-02-13 08:00:00.00','2023-02-18 10:15:00.00'),(43,34,33,'2023-02-18 11:30:00.00','2023-02-28 15:45:00.00'),(44,34,23,'2023-02-18 09:30:00.00','2023-02-28 13:00:00.00'),(45,35,50,'2023-02-28 14:15:00.00','2023-02-28 23:59:59.00'),(46,36,6,'2023-02-01 12:00:00.00','2023-02-03 14:00:00.00'),(47,37,46,'2023-02-04 09:30:00.00','2023-02-06 14:15:00.00'),(48,38,36,'2023-02-07 14:30:00.00','2023-02-09 09:45:00.00'),(49,39,16,'2023-02-10 10:00:00.00','2023-02-12 16:30:00.00'),(50,40,49,'2023-02-13 16:15:00.00','2023-02-15 10:30:00.00'),(51,40,41,'2023-03-05 12:30:00.00','2023-03-10 14:45:00.00'),(52,40,11,'2023-03-02 09:45:00.00','2023-03-08 14:30:00.00'),(53,41,26,'2023-03-10 14:45:00.00','2023-03-15 09:15:00.00'),(54,42,44,'2023-03-04 08:15:00.00','2023-03-10 16:45:00.00'),(55,43,32,'2023-03-15 10:00:00.00','2023-03-20 15:45:00.00'),(56,44,42,'2023-03-09 13:45:00.00','2023-03-14 11:30:00.00'),(57,45,17,'2023-03-20 16:45:00.00','2023-03-25 12:15:00.00'),(58,46,29,'2023-03-12 10:30:00.00','2023-03-17 13:15:00.00'),(59,46,21,'2023-03-25 12:45:00.00','2023-03-28 11:15:00.00'),(60,48,1,'2023-03-19 09:30:00.00','2023-03-25 14:00:00.00'),(61,48,15,'2023-03-06 08:45:00.00','2023-03-12 12:30:00.00'),(62,49,30,'2023-03-11 11:15:00.00','2023-03-16 13:45:00.00'),(63,50,48,'2023-03-16 15:00:00.00','2023-03-20 09:15:00.00'),(64,51,38,'2023-03-21 08:15:00.00','2023-03-27 15:30:00.00'),(65,52,13,'2023-03-26 16:45:00.00','2023-03-28 10:30:00.00'),(66,53,45,'2023-03-07 12:30:00.00','2023-03-12 14:45:00.00'),(67,54,39,'2023-03-12 15:45:00.00','2023-03-17 09:45:00.00'),(68,55,19,'2023-03-17 10:15:00.00','2023-03-22 11:30:00.00'),(69,55,35,'2023-03-22 12:45:00.00','2023-03-27 13:15:00.00'),(70,56,7,'2023-03-27 14:30:00.00','2023-03-28 09:30:00.00'),(71,57,10,'2023-03-06 15:00:00.00','2023-03-12 16:45:00.00'),(72,58,24,'2023-03-13 08:15:00.00','2023-03-18 10:30:00.00'),(73,59,4,'2023-03-18 11:45:00.00','2023-03-22 15:15:00.00'),(74,59,27,'2023-03-23 09:45:00.00','2023-03-28 13:45:00.00'),(75,60,12,'2023-03-28 14:00:00.00','2023-03-28 23:59:59.00'),(76,60,3,'2023-03-01 12:15:00.00','2023-03-05 10:30:00.00'),(77,61,14,'2023-03-06 11:45:00.00','2023-03-11 14:00:00.00'),(78,62,22,'2023-03-09 15:15:00.00','2023-03-14 10:45:00.00'),(79,63,31,'2023-03-16 13:00:00.00','2023-03-21 15:30:00.00'),(80,64,9,'2023-03-23 16:45:00.00','2023-03-28 08:15:00.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `vehiculo` */

insert  into `vehiculo`(`idVehiculo`,`Huesped_idHuesped`,`placa_Vehiculo`,`modelo_Vehiculo`,`color_Vehiculo`) values (1,3,'123ABC','Sedán','Rojo'),(2,14,'XYZ789','Camioneta','Azul'),(3,40,'LMN456','Motocicleta','Negro'),(4,33,'PQR321','Camioneta','Blanco'),(5,50,'UVW654','Sedán','Verde'),(6,23,'EFG987','Motocicleta','Rojo'),(7,36,'124ABC','Ford fiesta','Blanco'),(8,41,'145ABE','Mazda x','Rojo'),(9,26,'106ABC','Camioneta Prado','Negra'),(10,44,'125TBC','Moto RTX','Rojo');

/* Procedure structure for procedure `sp_actualizar_pedido_precio_total` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_actualizar_pedido_precio_total` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_pedido_precio_total`(in id int)
BEGIN
	UPDATE sjreal.`pedido`
	SET pedido.`precio_Total_Pedido`= (SELECT SUM(precio_Total)
					FROM sjreal.`detallepedido`
					WHERE Pedido_idPedido=id)
	WHERE idPedido=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_actualizar_total_detallePedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_actualizar_total_detallePedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_total_detallePedido`(in idDetalle int)
BEGIN
	UPDATE sjreal.`detallepedido`
	SET detallepedido.`precio_Total`= cantidad_Producto*precio_unitario
	WHERE detallepedido.`idDetalle`=idDetalle;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
