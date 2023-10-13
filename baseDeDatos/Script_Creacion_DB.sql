-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Sucursal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sucursal` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Sucursal` (
  `id_Sucursal` INT NOT NULL AUTO_INCREMENT,
  `NIT_Sucursal` VARCHAR(15) NOT NULL,
  `nombre_Sucursal` VARCHAR(50) NOT NULL,
  `departamento _Sucursal` ENUM('Amazonas', 'Antioquia', 'Arauca', 'Atlántico', 'Bolívar', 'Boyacá', 'Caldas', 'Caquetá', 'Casanare', 'Cauca', 'Cesar', 'Chocó', 'Córdoba', 'Cundinamarca', 'Guainía', 'Guaviare', 'Huila', 'La Guajira', 'Magdalena', 'Meta', 'Nariño', 'Norte de Santander', 'Putumayo', 'Quindío', 'Risaralda', 'San Andrés y Providencia', 'Santander', 'Sucre', 'Tolima', 'Valle del Cauca', 'Vaupés', 'Vichada') NOT NULL,
  `cuidad_Sucursal` VARCHAR(50) NOT NULL,
  `calle_Sucursal` INT NOT NULL,
  `carrera_Sucursal` INT NOT NULL,
  `telefono_Sucursal` VARCHAR(10) NOT NULL,
  `correo_Sucursal` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`id_Sucursal`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Servicio_Publico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Servicio_Publico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Servicio_Publico` (
  `idServicio_Publico` INT NOT NULL AUTO_INCREMENT,
  `proveedor_Servicio_Publico` VARCHAR(80) NOT NULL,
  `nombre_Servicio_Publico` VARCHAR(45) NOT NULL,
  `carrera_Servicio_Publico` INT NOT NULL,
  `calle_Servicio_Publico` INT NOT NULL,
  `cuidad_Servicio_Publico` VARCHAR(80) NOT NULL,
  `correo_Servicio_Publico` VARCHAR(50) NOT NULL,
  `telefono_Servicio_Publico` VARCHAR(15) NOT NULL,
  `telefono2_Servicio_Publico` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idServicio_Publico`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Recibo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Recibo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Recibo` (
  `idRecibo` INT NOT NULL AUTO_INCREMENT,
  `Servicio_Publico_idServicio_Publico` INT NOT NULL,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `concepto_Recibo` VARCHAR(45) NOT NULL,
  `fecha_Pago_Oportuno` DATE NOT NULL,
  `consumo_Recibo` VARCHAR(45) NOT NULL,
  `medida_consumo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRecibo`),
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Servicio_Publico`
    FOREIGN KEY (`Servicio_Publico_idServicio_Publico`)
    REFERENCES `Servicio_Publico` (`idServicio_Publico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicio_Publico_has_Sucursal_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Empleado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `cedula_Empleado` VARCHAR(15) NOT NULL,
  `tipo_Documento` ENUM('CC', 'CE', 'TI', 'Pasaporte') NOT NULL,
  `fecha_Nacimiento` DATE NOT NULL,
  `edad_Empleado` INT NOT NULL,
  `correo_Empleado` VARCHAR(45) NOT NULL,
  `telefono_Empleado` VARCHAR(10) NOT NULL,
  `primer_Nombre_Empleado` VARCHAR(45) NOT NULL,
  `segundo_Nombre_Empleado` VARCHAR(45) NULL,
  `primer_Apellido_Empleado` VARCHAR(45) NOT NULL,
  `segundo_Apellido_Empleado` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Responsable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Responsable` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Responsable` (
  `idResponsable` INT NOT NULL AUTO_INCREMENT,
  `Empleado_idEmpleado` INT NOT NULL,
  `Responsable_De` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idResponsable`),
  CONSTRAINT `fk_Inventario_has_Empleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Producto` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `precio_Producto` DECIMAL(10) NOT NULL,
  `descripcion_Producto` VARCHAR(200) NOT NULL,
  `nombre_Producto` VARCHAR(50) NOT NULL,
  `estado_Producto` ENUM('Activo', 'Inactivo') NOT NULL,
  `existencias` INT NOT NULL,
  `maximo_Producto` INT NOT NULL,
  `minimo_Producto` INT NOT NULL,
  `tipo_Producto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Control_Inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Control_Inventario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Control_Inventario` (
  `idControl_Inventario` INT NOT NULL AUTO_INCREMENT,
  `Responsable_idResponsable` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `fecha_Actualizacion` DATE NOT NULL,
  `tipop_Actualizacion` ENUM('Modificar cantidad producto', 'Añadir nuevo Item', 'Eliminar Item') NOT NULL,
  `cantidad_añadida` INT NOT NULL,
  `cantidad_Restada` INT NOT NULL,
  PRIMARY KEY (`idControl_Inventario`),
  CONSTRAINT `fk_Control_Inventario_Responsable1`
    FOREIGN KEY (`Responsable_idResponsable`)
    REFERENCES `Responsable` (`idResponsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Control_Inventario_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Sucursal_has_Inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sucursal_has_Inventario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Sucursal_has_Inventario` (
  `idSucursal_has_Inventario` INT NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `Control_Inventario_idControl_Inventario` INT NOT NULL,
  `cantidad_inventarios` INT NOT NULL,
  `nombre_Inventario` VARCHAR(45) NOT NULL,
  `categoria_Inventario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSucursal_has_Inventario`),
  CONSTRAINT `fk_Sucursal_has_Inventario_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Inventario_Control_Inventario1`
    FOREIGN KEY (`Control_Inventario_idControl_Inventario`)
    REFERENCES `Control_Inventario` (`idControl_Inventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Habitacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Habitacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Habitacion` (
  `idHabitacion` INT NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `numero_Habitacion` VARCHAR(3) NOT NULL,
  `descripcion _Habitacion` VARCHAR(500) NOT NULL,
  `tipo_Habitacion` ENUM('Sencilla', 'Doble', 'Para pareja') NOT NULL,
  `capacidad_Habitacion` INT NOT NULL,
  `precio_Habitacion` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`idHabitacion`),
  CONSTRAINT `fk_Habitacion_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Huesped`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Huesped` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Huesped` (
  `idHuesped` INT NOT NULL AUTO_INCREMENT,
  `cedula _Huesped` VARCHAR(15) NOT NULL,
  `primer_Nombre_Huesped` VARCHAR(40) NOT NULL,
  `segundo_Nombre_Huesped` VARCHAR(40) NULL,
  `primer_Apellido_Huesped` VARCHAR(45) NOT NULL,
  `segundo_Apellido_Huesped` VARCHAR(45) NULL,
  `tipo_Documento_Huesped` ENUM('CC', 'CE', 'TI', 'Pasaporte') NOT NULL,
  `fecha_Nacimiento_Huesped` DATE NOT NULL,
  `edad_Huesped` INT NOT NULL,
  `telefono_Huesped` VARCHAR(15) NOT NULL,
  `correo_Huesped` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idHuesped`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Hospedaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Hospedaje` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Hospedaje` (
  `idHospedaje` INT NOT NULL AUTO_INCREMENT,
  `codigo_Hospedaje` INT NOT NULL,
  `Habitacion_idHabitacion` INT NOT NULL,
  `Huesped_idHuesped` INT NOT NULL,
  `checkIn_Hospedaje` DATETIME(2) NOT NULL,
  `checkOut_Hospedaje` DATETIME(2) NOT NULL,
  `cantidad_Habitaciones_Hospedaje` INT NOT NULL,
  `cantidad_Personas_Hospedaje` INT NOT NULL,
  `dias_Hospedaje` INT NOT NULL,
  PRIMARY KEY (`idHospedaje`),
  CONSTRAINT `fk_Habitacion_has_Huesped_Habitacion1`
    FOREIGN KEY (`Habitacion_idHabitacion`)
    REFERENCES `Habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitacion_has_Huesped_Huesped1`
    FOREIGN KEY (`Huesped_idHuesped`)
    REFERENCES `Huesped` (`idHuesped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vehiculo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Vehiculo` (
  `idVehiculo` INT NOT NULL AUTO_INCREMENT,
  `Huesped_idHuesped` INT NOT NULL,
  `placa_Vehiculo` VARCHAR(10) NOT NULL,
  `modelo_Vehiculo` VARCHAR(45) NOT NULL,
  `color_Vehiculo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  CONSTRAINT `fk_Vehiculo_Huesped1`
    FOREIGN KEY (`Huesped_idHuesped`)
    REFERENCES `Huesped` (`idHuesped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pago` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pago` (
  `idPago` INT NOT NULL AUTO_INCREMENT,
  `Hospedaje_idHospedaje` INT NOT NULL,
  `titular _Pago` VARCHAR(80) NOT NULL,
  `IDTitular_Pago` VARCHAR(20) NOT NULL,
  `medioDePago_Pago` ENUM('PSE', 'Tarjeta de crédito', 'Tarjeta de dédito', 'Efectivo') NOT NULL,
  `concepto_Pago` VARCHAR(500) NOT NULL,
  `total_Pago` DECIMAL(10) NOT NULL,
  `tipo_Cliente` ENUM('Persona natural', 'Persona jurídica') NOT NULL,
  PRIMARY KEY (`idPago`),
  CONSTRAINT `fk_Pago_Hospedaje1`
    FOREIGN KEY (`Hospedaje_idHospedaje`)
    REFERENCES `Hospedaje` (`idHospedaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proveedor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `NIT_Proveedor` VARCHAR(15) NOT NULL,
  `nombre_Proveedor` VARCHAR(45) NOT NULL,
  `telefono_Proveedor` VARCHAR(15) NOT NULL,
  `correo_Proveedor` VARCHAR(45) NOT NULL,
  `categoria_Proveedor` ENUM('Aseo', 'Textiles', '') NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Cliente_De`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cliente_De` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Cliente_De` (
  `idCliente_De` INT NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `fecha_Inicio_Actividades` DATE NOT NULL,
  `antiguedad_actividades` INT NOT NULL,
  PRIMARY KEY (`idCliente_De`),
  CONSTRAINT `fk_Sucursal_has_Proveedor_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Proveedor_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pedido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pedido` (
  `IdPedido` INT NOT NULL AUTO_INCREMENT,
  `Proveedor_idProveedor` INT NOT NULL,
  `Control_Inventario_idControl_Inventario` INT NOT NULL,
  `cantidad_Producto` INT NOT NULL,
  `fecha_Entrega` DATETIME NOT NULL,
  `precio_Total_Pedido` DECIMAL(10) NOT NULL,
  `precio_Unitario_Producto` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`IdPedido`),
  CONSTRAINT `fk_Proveedor_has_Producto_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Control_Inventario1`
    FOREIGN KEY (`Control_Inventario_idControl_Inventario`)
    REFERENCES `Control_Inventario` (`idControl_Inventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Rol_Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol_Empleado` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Rol_Empleado` (
  `idRol_Empleado` INT NOT NULL AUTO_INCREMENT,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  `cargo_Empleado` ENUM('Gerente', 'Recepcionista', 'Camarera', 'Mantenimiento', 'Otro') NOT NULL,
  `cargo_Otro_Empleado` VARCHAR(45) NULL,
  `tipo_Contrato` VARCHAR(50) NOT NULL,
  `fecha_Vinculacion_Empleado` DATE NOT NULL,
  `antiguedad_Empleado` INT NOT NULL,
  PRIMARY KEY (`idRol_Empleado`),
  CONSTRAINT `fk_Sucursal_has_Empleado_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sucursal_has_Empleado_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Detalle_Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Detalle_Pago` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Detalle_Pago` (
  `id_Detalle_Pago` INT NOT NULL AUTO_INCREMENT,
  `Producto_idProducto` INT NOT NULL,
  `Pago_idPago` INT NOT NULL,
  `precio_Por_Dia_Hospedado` DECIMAL(10) NOT NULL,
  `precio_Total` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`id_Detalle_Pago`),
  CONSTRAINT `fk_Producto_has_Pago_Producto1`
    FOREIGN KEY (`Producto_idProducto`)
    REFERENCES `Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Pago_Pago1`
    FOREIGN KEY (`Pago_idPago`)
    REFERENCES `Pago` (`idPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Dueño`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dueño` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Dueño` (
  `idDueño` INT NOT NULL AUTO_INCREMENT,
  `cedula _Dueño` VARCHAR(15) NOT NULL,
  `primer_Nombre_Dueño` VARCHAR(40) NOT NULL,
  `segundo_Nombre_Dueño` VARCHAR(40) NULL,
  `primer_Apellido_Dueño` VARCHAR(45) NOT NULL,
  `segundo_Apellido_Dueño` VARCHAR(45) NULL,
  `tipo_Documento_Dueño` ENUM('CC', 'CE', 'TI', 'Pasaporte') NOT NULL,
  `fecha_Nacimiento_Dueño` DATE NOT NULL,
  `edad_Dueño` INT NOT NULL,
  `telefono_Dueño` VARCHAR(15) NOT NULL,
  `correo_Dueño` VARCHAR(50) NOT NULL,
  `porcentaje_Participacion` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`idDueño`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Propiedad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Propiedad` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Propiedad` (
  `idPropiedad` INT NOT NULL AUTO_INCREMENT,
  `Dueño_idDueño` INT NOT NULL,
  `Sucursal_id_Sucursal` INT NOT NULL,
  `fecha_Inicio_Participacion` DATE NOT NULL,
  `antiguedad_Participacion` INT NOT NULL,
  PRIMARY KEY (`idPropiedad`),
  CONSTRAINT `fk_Dueño_has_Sucursal_Dueño1`
    FOREIGN KEY (`Dueño_idDueño`)
    REFERENCES `Dueño` (`idDueño`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dueño_has_Sucursal_Sucursal1`
    FOREIGN KEY (`Sucursal_id_Sucursal`)
    REFERENCES `Sucursal` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pago_Recibo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pago_Recibo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Pago_Recibo` (
  `idPago_Recibo` INT NOT NULL AUTO_INCREMENT,
  `Recibo_idRecibo` INT NOT NULL,
  `Responsable_idResponsable1` INT NOT NULL,
  `fecha_Pago_Recibo` DATE NOT NULL,
  `monto_Recibo` DECIMAL(10) NOT NULL,
  `Pago_Con_Retraso` VARCHAR(2) NOT NULL,
  `motivo_Retraso` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idPago_Recibo`),
  CONSTRAINT `fk_Pago_Recibo_Recibo1`
    FOREIGN KEY (`Recibo_idRecibo`)
    REFERENCES `Recibo` (`idRecibo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Recibo_Responsable1`
    FOREIGN KEY (`Responsable_idResponsable1`)
    REFERENCES `Responsable` (`idResponsable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
