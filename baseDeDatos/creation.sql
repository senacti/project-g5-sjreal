-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sjreal
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sjreal` ;

-- -----------------------------------------------------
-- Schema sjreal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sjreal` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `sjreal` ;

-- -----------------------------------------------------
-- Table `sucursales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sucursales` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `nit_sucursal` VARCHAR(15) NOT NULL,
  `nombre_sucursal` VARCHAR(50) NOT NULL,
  `departamento_sucursal` ENUM('Amazonas', 'Antioquia', 'Arauca', 'Atlántico', 'Bolívar', 'Boyacá', 'Caldas', 'Caquetá', 'Casanare', 'Cauca', 'Cesar', 'Chocó', 'Córdoba', 'Cundinamarca', 'Guainía', 'Guaviare', 'Huila', 'La Guajira', 'Magdalena', 'Meta', 'Nariño', 'Norte de Santander', 'Putumayo', 'Quindío', 'Risaralda', 'San Andrés y Providencia', 'Santander', 'Sucre', 'Tolima', 'Valle del Cauca', 'Vaupés', 'Vichada') NOT NULL,
  `cuidad_sucursal` VARCHAR(50) NOT NULL,
  `calle_sucursal` INT NOT NULL,
  `carrera_sucursal` INT NOT NULL,
  `telefono_sucursal` VARCHAR(10) NOT NULL,
  `correo_sucursal` VARCHAR(80) NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `servicios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `servicios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `precio_servicio` DOUBLE NOT NULL,
  `descripcion_servicio` VARCHAR(200) NULL,
  `nombre_servicio` VARCHAR(50) NOT NULL,
  `estado_servicio` ENUM('Activo', 'Inactivo') NOT NULL,
  `tipo_servicio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_servicio`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_actualizacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_actualizacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `tipo_actualizacion` (
  `id_tipo_actualizacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_actualizacion`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `control_inventario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `control_inventario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `control_inventario` (
  `id_control` INT NOT NULL AUTO_INCREMENT,
  `control_id_servicio` INT NOT NULL,
  `control_id_tipo_actualizacion` INT NOT NULL,
  `fecha_control` DATE NOT NULL,
  `cantidad_modificada` INT NOT NULL,
  PRIMARY KEY (`id_control`),
  CONSTRAINT `fk_control_inventarios_productos1`
    FOREIGN KEY (`control_id_servicio`)
    REFERENCES `servicios` (`id_servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_control_inventario_tipo_actualizacion1`
    FOREIGN KEY (`control_id_tipo_actualizacion`)
    REFERENCES `tipo_actualizacion` (`id_tipo_actualizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `inventarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventarios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `inventarios` (
  `id_inventario` INT NOT NULL AUTO_INCREMENT,
  `inventario_id_control` INT NOT NULL,
  `inventario_id_sucursal` INT NOT NULL,
  `nombre_inventario` VARCHAR(45) NOT NULL,
  `cantidad_inventario` INT NOT NULL,
  `categoria_inventario` VARCHAR(45) NOT NULL,
  `fecha_inventario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_inventario`),
  CONSTRAINT `fk_Sucursal_has_Inventario_Control_Inventario1`
    FOREIGN KEY (`inventario_id_control`)
    REFERENCES `control_inventario` (`id_control`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sucursal_has_inventario_sucursales1`
    FOREIGN KEY (`inventario_id_sucursal`)
    REFERENCES `sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `tipo_habitacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_habitacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `tipo_habitacion` (
  `id_tipo_habitacion` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_habitacion`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `habitaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `habitaciones` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `habitaciones` (
  `id_habitacion` INT NOT NULL AUTO_INCREMENT,
  `habitacion_id_sucursal` INT NOT NULL,
  `habitacion_id_tipo_habitacion` INT NOT NULL,
  `numero_habitacion` VARCHAR(3) NOT NULL,
  `descripcion_habitacion` VARCHAR(500) NOT NULL,
  `capacidad_habitacion` INT NOT NULL,
  `status_habitacion` TINYINT NOT NULL,
  `precio_habitacion` DECIMAL NOT NULL,
  PRIMARY KEY (`id_habitacion`),
  CONSTRAINT `fk_habitaciones_sucursales1`
    FOREIGN KEY (`habitacion_id_sucursal`)
    REFERENCES `sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_tipo_habitacion1`
    FOREIGN KEY (`habitacion_id_tipo_habitacion`)
    REFERENCES `tipo_habitacion` (`id_tipo_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `reservas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id_reserva` INT NOT NULL AUTO_INCREMENT,
  `checkin_reserva` DATETIME NOT NULL,
  `checkout_reserva` DATETIME NOT NULL,
  `ch_reserva` INT NULL,
  `cp_reserva` INT NULL,
  PRIMARY KEY (`id_reserva`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `personas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` INT NOT NULL AUTO_INCREMENT,
  `nombre_persona` VARCHAR(45) NOT NULL,
  `apellido_persona` VARCHAR(55) NULL,
  `documento_persona` VARCHAR(20) NOT NULL,
  `telefono_persona` VARCHAR(10) NOT NULL,
  `correo_persona` VARCHAR(70) NOT NULL,
  `tipo_documento` VARCHAR(30) NOT NULL,
  `nacionalidad` VARCHAR(100) NOT NULL,
  `tipo_persona` ENUM('juridica', 'natural') NOT NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `vehiculos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vehiculos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id_vehiculo` INT NOT NULL AUTO_INCREMENT,
  `vehiculo_id_persona` INT NOT NULL,
  `placa_vehiculo` VARCHAR(10) NOT NULL,
  `modelo_vehiculo` VARCHAR(45) NOT NULL,
  `color_vehiculo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_vehiculo`),
  CONSTRAINT `fk_vehiculos_personas1`
    FOREIGN KEY (`vehiculo_id_persona`)
    REFERENCES `personas` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pagos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pagos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `pago_id_persona` INT NOT NULL,
  `total_pago` DECIMAL(10) NOT NULL,
  `concepto_pago` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_pago`),
  CONSTRAINT `fk_pagos_personas1`
    FOREIGN KEY (`pago_id_persona`)
    REFERENCES `personas` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `user_id_persona` INT NOT NULL,
  `usuario_nombre` VARCHAR(16) NOT NULL,
  `usuario_email` VARCHAR(255) NULL,
  `usuario_password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT `fk_users_personas1`
    FOREIGN KEY (`user_id_persona`)
    REFERENCES `personas` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pedidos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `pedido_id_user` INT NOT NULL,
  `fecha_pedido` DATETIME NOT NULL,
  `precio_pedido` DECIMAL(10) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  CONSTRAINT `fk_pedidos_users1`
    FOREIGN KEY (`pedido_id_user`)
    REFERENCES `users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `medio_pagos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medio_pagos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `medio_pagos` (
  `id_medio_pago` INT NOT NULL AUTO_INCREMENT,
  `nombre_mp` VARCHAR(45) NOT NULL,
  `tipo_mp` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medio_pago`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalles_pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalles_pago` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `detalles_pago` (
  `id_detalle_pago` INT NOT NULL AUTO_INCREMENT,
  `detalle_pago_id_pago` INT NOT NULL,
  `detalle_pago_id_servicio` INT NOT NULL,
  `detalle_id_reserva` INT NOT NULL,
  `detalle_id_medio_pago` INT NOT NULL,
  `precio_por_item` DOUBLE NOT NULL,
  `cantidad_item` INT NOT NULL,
  `detalle_precio_total` DOUBLE NOT NULL,
  PRIMARY KEY (`id_detalle_pago`),
  CONSTRAINT `fk_detalles_pago_pagos1`
    FOREIGN KEY (`detalle_pago_id_pago`)
    REFERENCES `pagos` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_pago_productos1`
    FOREIGN KEY (`detalle_pago_id_servicio`)
    REFERENCES `servicios` (`id_servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_pago_reservas1`
    FOREIGN KEY (`detalle_id_reserva`)
    REFERENCES `reservas` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalles_pago_medio_pagos1`
    FOREIGN KEY (`detalle_id_medio_pago`)
    REFERENCES `medio_pagos` (`id_medio_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roles` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PQRS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PQRS` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PQRS` (
  `id_pqrs` INT NOT NULL AUTO_INCREMENT,
  `pqrs_id_reserva` INT NOT NULL,
  `pqrs_id_user` INT NOT NULL,
  `fecha_pqrs` DATETIME NOT NULL,
  `tipo_pqrs` VARCHAR(45) NOT NULL,
  `descripcion_pqrs` LONGTEXT NOT NULL,
  `estado_pqrs` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pqrs`),
  CONSTRAINT `fk_PQRS_reservas1`
    FOREIGN KEY (`pqrs_id_reserva`)
    REFERENCES `reservas` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PQRS_users1`
    FOREIGN KEY (`pqrs_id_user`)
    REFERENCES `users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `parqueadero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parqueadero` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `parqueadero` (
  `id_parqueadero` INT NOT NULL AUTO_INCREMENT,
  `parqueadero_id_vehiculo` INT NOT NULL,
  `parqueadero_id_reserva` INT NOT NULL,
  `code` VARCHAR(5) NOT NULL,
  `status` TINYINT NOT NULL,
  `entrada` DATETIME NOT NULL,
  `salida` DATETIME NOT NULL,
  PRIMARY KEY (`id_parqueadero`),
  CONSTRAINT `fk_parqueadero_vehiculos1`
    FOREIGN KEY (`parqueadero_id_vehiculo`)
    REFERENCES `vehiculos` (`id_vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_parqueadero_reservas1`
    FOREIGN KEY (`parqueadero_id_reserva`)
    REFERENCES `reservas` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `permisos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `permisos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permisos` INT NOT NULL AUTO_INCREMENT,
  `nombre_permiso` ENUM('select', 'update', 'delete', 'create') NOT NULL,
  PRIMARY KEY (`id_permisos`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `credenciales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `credenciales` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `credenciales` (
  `id_credencial` INT NOT NULL AUTO_INCREMENT,
  `credencial_id_rol` INT NOT NULL,
  `credencial_id_user` INT NOT NULL,
  `credencial_id_permisos` INT NOT NULL,
  PRIMARY KEY (`id_credencial`),
  CONSTRAINT `fk_roles_has_usuarios_roles1`
    FOREIGN KEY (`credencial_id_rol`)
    REFERENCES `roles` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credenciales_users1`
    FOREIGN KEY (`credencial_id_user`)
    REFERENCES `users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_credenciales_permisos1`
    FOREIGN KEY (`credencial_id_permisos`)
    REFERENCES `permisos` (`id_permisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `detalle_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detalle_pedido` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle_pedido` INT NOT NULL AUTO_INCREMENT,
  `detalle_id_pedido` INT NOT NULL,
  `detalle_id_control` INT NOT NULL,
  `detalle_cp` INT NOT NULL,
  `detalle_pp` DECIMAL NOT NULL,
  `detalle_total` DECIMAL NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  CONSTRAINT `fk_detalle_pedido_pedidos1`
    FOREIGN KEY (`detalle_id_pedido`)
    REFERENCES `pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_pedido_control_inventario1`
    FOREIGN KEY (`detalle_id_control`)
    REFERENCES `control_inventario` (`id_control`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `relevos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `relevos` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `relevos` (
  `id_relevo` INT NOT NULL AUTO_INCREMENT,
  `relevo_id_user` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  `concepto_relevo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_relevo`),
  CONSTRAINT `fk_relevos_users1`
    FOREIGN KEY (`relevo_id_user`)
    REFERENCES `users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `estado_aseohs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estado_aseohs` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `estado_aseohs` (
  `id_estado_aseohs` INT NOT NULL AUTO_INCREMENT,
  `nombre_estado_aseohs` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estado_aseohs`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lista_relevo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lista_relevo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `lista_relevo` (
  `id_lista_relevo` INT NOT NULL AUTO_INCREMENT,
  `lista_id_habitacion` INT NOT NULL,
  `lista_id_relevo` INT NOT NULL,
  `lista_id_estado_aseohs` INT NOT NULL,
  PRIMARY KEY (`id_lista_relevo`),
  CONSTRAINT `fk_habitaciones_has_relevos_habitaciones1`
    FOREIGN KEY (`lista_id_habitacion`)
    REFERENCES `habitaciones` (`id_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_habitaciones_has_relevos_relevos1`
    FOREIGN KEY (`lista_id_relevo`)
    REFERENCES `relevos` (`id_relevo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_relevo_estado_aseohs1`
    FOREIGN KEY (`lista_id_estado_aseohs`)
    REFERENCES `estado_aseohs` (`id_estado_aseohs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `estado_reserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estado_reserva` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `estado_reserva` (
  `id_estado_reserva` INT NOT NULL AUTO_INCREMENT,
  `estado_reserva_id_reserva` INT NOT NULL,
  `nombre_er` VARCHAR(45) NOT NULL,
  `fecha_er` DATETIME NOT NULL,
  PRIMARY KEY (`id_estado_reserva`),
  CONSTRAINT `fk_estado_reserva_reservas1`
    FOREIGN KEY (`estado_reserva_id_reserva`)
    REFERENCES `reservas` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `hospedajes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospedajes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `hospedajes` (
  `id_hospedaje` INT NOT NULL AUTO_INCREMENT,
  `hospedaje_id_reserva` INT NOT NULL,
  `hospedaje_id_habitacion` INT NOT NULL,
  `hospedaje_id_persona` INT NOT NULL,
  `checkin_hospedaje` DATETIME NOT NULL,
  `checkout_hospedaje` DATETIME NOT NULL,
  PRIMARY KEY (`id_hospedaje`),
  CONSTRAINT `fk_hospedajes_reservas1`
    FOREIGN KEY (`hospedaje_id_reserva`)
    REFERENCES `reservas` (`id_reserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospedajes_habitaciones1`
    FOREIGN KEY (`hospedaje_id_habitacion`)
    REFERENCES `habitaciones` (`id_habitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hospedajes_personas1`
    FOREIGN KEY (`hospedaje_id_persona`)
    REFERENCES `personas` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
