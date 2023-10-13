/*---------------Creacion de registros en la tabla Dueño---------------*/
INSERT INTO `dueño`
            (`cedula_Dueño`,
             `primer_Nombre_Dueño`,
             `segundo_Nombre_Dueño`,
             `primer_Apellido_Dueño`,
             `segundo_Apellido_Dueño`,
             `tipo_Documento_Dueño`,
             `fecha_Nacimiento_Dueño`,
             `edad_Dueño`,
             `telefono_Dueño`,
             `correo_Dueño`,
             `nacionalidad`,
             `porcentaje_Participacion`)
VALUES
    ('1122334455', 'Juan', 'Carlos', 'Gomez', 'Perez', 'CC', '1980-05-15', 41, '311-222-3344', 'juan@example.com', 'Colombiana', 50),
    ('2233445566', 'Maria', 'Elena', 'Rodriguez', 'Lopez', 'CC', '1975-10-20', 46, '322-333-4445', 'maria@example.com', 'Colombiana', 30),
    ('3344556677', 'Carlos', 'Antonio', 'Perez', 'Gonzalez', 'CE', '1985-03-25', 36, '300-111-2223', 'carlos@example.com', 'Ecuatoriana', 20),
    ('4455667788', 'Luisa', 'Fernanda', 'Ramirez', 'Castro', 'CC', '1990-12-10', 31, '310-555-6667', 'luisa@example.com', 'Colombiana', 60),
    ('5566778899', 'Javier', 'Alejandro', 'Torres', 'Hernandez', 'CC', '1978-07-05', 43, '315-777-8889', 'javier@example.com', 'Colombiana', 40),
    ('1122334455', 'José', 'Carlos', 'Chiguasuque', 'Perez', 'CC', '1980-05-15', 41, '311-222-3344', 'jose@example.com', 'Colombiana', 100);
 
/*---------------Creacion de registros en la tabla Sucursal---------------*/   
INSERT INTO `sucursal`
            (`NIT_Sucursal`,
             `nombre_Sucursal`,
             `departamento_Sucursal`,
             `cuidad_Sucursal`,
             `calle_Sucursal`,
             `carrera_Sucursal`,
             `telefono_Sucursal`,
             `correo_Sucursal`)
VALUES
    ('123456789-0', 'Sucursal Medellín', 'Antioquia', 'Medellín', 123, 45, '312-345-6789', 'sucursal@example.com'),
    ('123456789-1', 'Sucursal Sibaté', 'Cundinamarca', 'Sibaté', 10, 7, '311-111-1111', 'sibate@example.com'),
    ('123456789-2', 'Sucursal Bogotá', 'Cundinamarca', 'Bogotá', 2, 21, '322-222-2222', 'bogota@example.com');
 
/*---------------Creacion de registros en la tabla Propiedad---------------*/   
INSERT INTO `sjreal`.`propiedad`
            (`Dueño_idDueño`,
             `Sucursal_id_Sucursal`,
             `fecha_Inicio_Participacion`,
             `antiguedad_Participacion`,
             `codigo_Escritura`,
             `participacion_Inicial`)
VALUES 
	(1, 1, '2020-09-10', 3, 'AM-9000', 100),    
	(2, 1, '2020-10-01', 3, 'AM-8500', 0),
	(3, 1, '2021-05-10', 2, 'AM-8700', 0),
	(4, 3, '2019-06-15', 4, 'AM-8700', 60),
	(5, 3, '2019-06-15', 4, 'AM-8700', 40),
	(6, 2, '2020-07-10', 3, 'AM-8700', 100);
	
/*---------------Creacion de registros en la tabla Proveedor---------------*/    
INSERT INTO `proveedor`
            (`NIT_Proveedor`,
             `nombre_Proveedor`,
             `telefono_Proveedor`,
             `correo_Proveedor`,
             `categoria_Proveedor`)
VALUES 
	('123456789-1', 'Proveedor de Textiles', '34567890', 'proveedor.textiles@example.com', 'Textiles'),
	('987654321-2', 'Proveedor de Productos de Aseo', '3123456789', 'proveedor.aseo@example.com', 'Aseo'),
	('555555555-3', 'Proveedor de Toallas', '3333333333', 'proveedor.alimentos@example.com', 'Textiles');
	
/*---------------Creacion de registros en la tabla Cliente_De---------------*/	
INSERT INTO `cliente_de`
            (`Sucursal_id_Sucursal`,
             `Proveedor_idProveedor`,
             `fecha_Inicio_Actividades`,
             `antiguedad_actividades`)
VALUES 
      (1, 3, '2020-12-05', 2),
      (2, 3, '2020-12-05', 2),
      (3, 3, '2019-06-20', 4),
      (1, 1, '2020-12-05', 2),
      (2, 1, '2020-12-05', 2),
      (3, 1, '2019-06-20', 4),
      (1, 2, '2020-12-05', 2),
      (2, 2, '2020-12-05', 2),
      (3, 2, '2019-06-20', 4);     
      
/*---------------Creacion de registros en la tabla Inventario---------------*/     
INSERT INTO `sjreal`.`inventario`
            (`Sucursal_id_Sucursal`,
             `Producto_idProducto`,
             `nombre_Inventario`,
             `existencias_Inventario`,
             `maximo_Producto`,
             `minimo_Producto`)
             
VALUES 
    (1, 1, 'Inventario de toallas', 'Activo', 0, 150, 80),
    (1, 2, 'Inventario de jabones', 'Activo',  0, 200, 80),
    (1, 3, 'Inventario de gaseosas', 'Activo',  0, 80, 40),
    (1, 4, 'Inventario de cepillos dentales', 'Activo',  0, 30, 15),
    (1, 5, 'Inventario de sábanas', 'Activo', 0, 200, 150),
    (1, 6,'Inventario de champú',  'Activo', 0, 150, 80),
    (1, 7,'Inventario de botellas de agua', 'Activo', 0, 80, 40),
    (1, 8, 'Inventario de paquetes de papel higiénico por 6', 'Activo',  0, 30, 20),
    (1, 9, 'Inventario de almohadas', 'Activo',  0, 100, 90),
    (1, 10, 'Inventario de jabon de baño', 'Activo', , 0, 150, 80),
    (1, 11, 'Inventario de Snacks variados', 'Activo', 0, 50, 30),
    (1, 12, 'Inventario de cobijas de lana', 'Activo', 0, 50, 30),
    (1, 13, 'Inventario de crema dental', 'Activo',  0, 15, 10),
    (1, 14, 'Inventario de vinotinto', 'Activo',  0, 20, 5),
    (1, 15, 'Inventario del rollo de papel de cocina', 'Activo', 0, 10, 5),
    (1, 16, 'Inventario de prendas de ropa interior', 'Activo',  0, 30, 20),
    (1, 17, 'Inventario de gel de ducha', 'Activo', 0, 50, 30),
    (1, 18, 'Inventario de latas de cerveza', 'Activo',  0, 80, 50),
    (1, 19, 'Inventario de empaque de cubiertos desechables', 'Activo',  0, 20, 10),
    (1, 20, 'Inventario de alfombras', 'Activo',  0, 40, 30),
    (2, 1, 'Inventario de toallas', 'Activo',  0, 150, 80),
    (2, 2, 'Inventario de jabones', 'Activo',  0, 200, 80),
    (2, 3, 'Inventario de gaseosas', 'Activo',  0, 80, 40),
    (2, 5, 'Inventario de sábanas', 'Activo', 0, 200, 150),
    (2, 6, 'Inventario de champú', 'Activo',  0, 150, 80),
    (2, 7, 'Inventario de botellas de agua', 'Activo',  0, 80, 40),
    (2, 8, 'Inventario de paquetes de papel higiénico por 6', 'Activo',  0, 30, 20),
    (2, 9, 'Inventario de almohadas', 'Activo',  0, 100, 90),    
    (2, 11, 'Inventario de Snacks variados', 'Activo', 0, 50, 30),
    (2, 12, 'Inventario de cobijas de lana', 'Activo',  0, 50, 30),
    (2, 13, 'Inventario de crema dental', 'Activo',  0, 15, 10),        
    (2, 16, 'Inventario de prendas de ropa interior', 'Activo',  0, 30, 20),
    (2, 17, 'Inventario de gel de ducha', 'Activo',   0, 50, 30),
    (2, 18, 'Inventario de latas de cerveza', 'Activo',  0, 80, 50),
    (2, 19, 'Inventario de empaque de cubiertos desechables', 'Activo', 0, 20, 10),
    (3, 1, 'Inventario de toallas', 'Activo',   0, 150, 80),
    (3, 2, 'Inventario de jabones', 'Activo',  0, 200, 80),
    (3, 3, 'Inventario de gaseosas', 'Activo',  0, 80, 40),
    (3, 4, 'Inventario de cepillos dentales', 'Activo', 0, 30, 15),
    (3, 5, 'Inventario de sábanas', 'Activo', 0, 200, 150),
    (3, 6, 'Inventario de champú', 'Activo', 0, 150, 80),
    (3, 7, 'Inventario de botellas de agua', 'Activo', 0, 80, 40),
    (3, 8, 'Inventario de paquetes de papel higiénico por 6', 'Activo', 0, 30, 20),
    (3, 9, 'Inventario de almohadas', 'Activo',  0, 100, 90),
    (3, 10, 'Inventario de jabon de baño', 'Activo', 0, 150, 80),
    (3, 11, 'Inventario de Snacks variados', 'Activo', 0, 50, 30),
    (3, 12, 'Inventario de cobijas de lana', 'Activo',  0, 50, 30),
    (3, 13, 'Inventario de crema dental', 'Activo',  0, 15, 10),
    (3, 14, 'Inventario de vinotinto', 'Activo', 0, 20, 5),
    (3, 15, 'Inventario del rollo de papel de cocina', 'Activo', 0, 10, 5),
    (3, 16, 'Inventario de prendas de ropa interior', 'Activo', 0, 30, 20),
    (3, 17, 'Inventario de gel de ducha', 'Activo', 0, 50, 30),
    (3, 18, 'Inventario de latas de cerveza', 'Activo', 0, 80, 50),
    (3, 19, 'Inventario de empaque de cubiertos desechables', 'Activo', 0, 20, 10),
    (3, 20, 'Inventario de alfombras', 'Activo', 0, 40, 30),
    (3, 21, 'Preservativos caja de 3', 'Activo', 0, 20, 15);

/*---------------Creacion de registros en la tabla Producto---------------*/      
INSERT INTO `producto`
            (`precio_Producto`,
             `descripcion_Producto`,
             `nombre_Producto`,
             `categoria_Producto`)
VALUES 
    (0.0, 'Toallas de algodón', 'Toallas', 'Textil'),
    (0.0, 'Jabón de manos', 'Jabón', 'aseo'),
    (2500.00, 'Bebida gaseosa', 'Gaseosa', 'Bebida'),
    (1200.00, 'Cepillo de dientes', 'Cepillo dental', 'Aseo'),
    (40000.00, 'Sábanas de seda', 'Sábanas', 'Textil'),
    (0.0, 'Champú suave', 'Champú', 'Asea'),
    (1500.75, 'Agua mineral', 'Agua', 'Bebida'),
    (0.0, 'Papel higiénico', 'Papel higiénico', 'Asea'),
    (22000.75, 'Almohadas de plumas', 'Almohadas', 'Textil'),
    (0.0, 'Jabón de baño', 'Jabón de baño', 'Aseo'),
    (2000.00, 'Snacks variados', 'Snacks', 'Comestible'),
    (0, 'Cobijas de lana', 'Cobijas', 'Textil'),
    (5400.25, 'Pasta de dientes', 'Pasta dental', 'Asea'),
    (45000.50, 'Vino tinto', 'Vino', 'Bebidas alcohólicas'),
    (6000.50, 'Papel de cocina', 'Papel de cocina', 'Cocina'),
    (3000.75, 'Ropa interior', 'Ropa interior', 'Textil'),
    (9000.99, 'Gel de ducha', 'Gel de ducha', 'Aseo'),
    (4500.25, 'Cerveza', 'Cerveza', 'Bebidas alcohólics'),
    (14000.00, 'Cubiertos desechables', 'Cubiertos', 'Cocina'),
    (29000.50, 'Alfombras', 'Alfombras', 'Textil'),
    (4000.00, 'Preservativos de x marca', 'Preservativos', 'Farmacia');

/*---------------Creacion de registros en la tabla Servicio_Publico---------------*/            
INSERT INTO `servicio_publico`
            (`proveedor_Servicio_Publico`,
             `NIT_Proveedor`,            
             `nombre_Servicio_Publico`,
             `carrera_Servicio_Publico`,
             `calle_Servicio_Publico`,
             `cuidad_Servicio_Publico`,
             `correo_Servicio_Publico`,
             `telefono_Servicio_Publico`,
             `telefono2_Servicio_Publico`)
VALUES
    ('Proveedor 1', '900734765-1', 'Electricidad', 1, 1, 'Medellín', 'correo1@example.com', '123456789', '987654321'),             
    ('Proveedor 2', '890984523-9', 'Acueducto', 2, 2, 'Medellin', 'correo2@example.com', '987654321', '123456789'),
    ('Proveedor 3', '899123265-0', 'Gas', 3, 3, 'Medellin', 'correo3@example.com', '555555555', '444444444');
    ('Proveedor 1', '900734765-1', 'Electricidad', 7, 8, 'Sibaté', 'correo7@example.com', '123456789', '987654321'),             
    ('Proveedor 2', '890984523-9', 'Acueducto', 6, 7, 'Sibaté', 'correo6@example.com', '987654321', '123456789'),
    ('Proveedor 3', '899123265-0', 'Gas', 8, 2, 'Sibaté', 'correo8@example.com', '555555555', '444444444'),
    ('Proveedor 1', '900734765-1', 'Electricidad', 100, 23, 'Bogotá', 'correo100@example.com', '123456789', '987654321'),             
    ('Proveedor 2', '890984523-9', 'Acueducto', 27, 20, 'Bogotá', 'correo27@example.com', '987654321', '123456789'),
    ('Proveedor 3', '899123265-0', 'Gas', 38, 45, 'Bogotá', 'correo38@example.com', '555555555', '444444444');
 
/*---------------Creacion de registros en la tabla Recibo---------------*/    
INSERT INTO `recibo`
            (`Servicio_Publico_idServicio_Publico`,
             `Sucursal_id_Sucursal`,
             `concepto_Recibo`,
             `fecha_Pago_Oportuno`,
             `consumo_Recibo`,
             `medida_consumo`)
VALUES 
    (1, 1, 'Pago recibo luz, sucursal Medellín', '2023-01-23', 50, 'Kilovatio'),
    (1, 1, 'Pago recibo luz, sucursal Medellín', '2023-02-22', 49, 'Kilovatio'),
    (1, 1, 'Pago recibo luz, sucursal Medellín', '2023-03-25', 58, 'Kilovatio'),
    (4, 2, 'Pago recibo luz, sucursal Sibaté', '2023-01-25', 45, 'Kilovatio'),
    (4, 2, 'Pago recibo luz, sucursal Sibaté', '2023-02-24', 44, 'Kilovatio'),
    (4, 2, 'Pago recibo luz, sucursal Sibaté', '2023-03-25', 40, 'Kilovatio'),
    (7, 3, 'Pago recibo luz, sucursal Bogotá', '2023-01-24', 50, 'Kilovatio'),
    (7, 3, 'Pago recibo luz, sucursal Bogotá', '2023-02-24', 49.2, 'Kilovatio'),
    (7, 3, 'Pago recibo luz, sucursal Bogotá', '2023-03-24', 46.7, 'Kilovatio'),
    (2, 1, 'Pago recibo agua, sucursal Medellín', '2023-01-17', 120, 'Metro cúbico'),
    (2, 1, 'Pago recibo agua, sucursal Medellín', '2023-02-18', 120.6, 'Metro cúbico'),
    (2, 1, 'Pago recibo agua, sucursal Medellín', '2023-03-27', 140.3, 'Metro cúbico'),
    (5, 2, 'Pago recibo agua, sucursal Sibaté', '2023-01-15', 98, 'Metro cúbico'),
    (5, 2, 'Pago recibo agua, sucursal Sibaté', '2023-02-17', 99.2, 'Metro cúbico'),
    (8, 3, 'Pago recibo agua, sucursal Bogotá', '2023-01-15', 109, 'Metro cúbico'),
    (8, 3, 'Pago recibo agua, sucursal Bogotá', '2023-02-15', 101.1, 'Metro cúbico'),
    (8, 3, 'Pago recibo agua, sucursal Bogotá', '2023-03-19', 110.6, 'Metro cúbico'),
    (3, 1, 'Pago recibo gas, sucursal Medellín', '2023-01-08', 34, 'Metro cúbico de gas'),
    (6, 2, 'Pago recibo gas, sucursal Sibaté', '2023-01-10', 45, 'Metro cúbico de gas'),
    (9, 3, 'Pago recibo gas, sucursal Bogotá', '2023-01-11', 23, 'Metro cúbico de gas');
 
/*---------------Creacion de registros en la tabla Empleado---------------*/        
INSERT INTO `empleado`
            (`cedula_Empleado`,
             `tipo_Documento`,
             `fecha_Nacimiento`,
             `edad_Empleado`,
             `correo_Empleado`,
             `telefono_Empleado`,
             `primer_Nombre_Empleado`,
             `segundo_Nombre_Empleado`,
             `primer_Apellido_Empleado`,
             `segundo_Apellido_Empleado`,
             `nacionalidad`)
VALUES
    ('1122334455', 'CC', '1990-05-15', 31, 'empleado1@example.com', '311-222-3344', 'Juan', 'Carlos', 'Gomez', 'Perez', 'Colombiana'),
    ('2233445566', 'CC', '1985-10-20', 36, 'empleado2@example.com', '322-333-4445', 'Maria', 'Elena', 'Rodriguez', 'Lopez', 'Colombiana'),
    ('3344556677', 'CE', '1995-03-25', 26, 'empleado3@example.com', '300-111-2223', 'Carlos', 'Antonio', 'Perez', 'Gonzalez', 'Ecuatoriana'),
    ('4455667788', 'CC', '1980-12-10', 41, 'empleado4@example.com', '310-555-6667', 'Luisa', 'Fernanda', 'Ramirez', 'Castro', 'Colombiana'),
    ('5566778899', 'CC', '1975-07-05', 46, 'empleado5@example.com', '315-777-8889', 'Javier', 'Alejandro', 'Torres', 'Hernandez', 'Colombiana'),
    ('5566778899', 'CC', '1993-08-12', 28, 'empleado5@example.com', '315-777-8889', 'Ana', 'Isabel', 'Gonzalez', 'Ramirez', 'Colombiana'),
    ('6677889900', 'CE', '1987-02-28', 34, 'empleado6@example.com', '321-888-9990', 'Pedro', 'Luis', 'Silva', 'Santos', 'Venezolana'),
    ('7788990011', 'CC', '1998-11-05', 23, 'empleado7@example.com', '318-999-0011', 'Marcela', 'Camila', 'Perez', 'Gomez', 'Colombiana'),
    ('8899001122', 'CC', '1983-04-22', 38, 'empleado8@example.com', '317-111-2233', 'Andres', 'Felipe', 'Torres', 'Lopez', 'Colombiana'),
    ('9900112233', 'CE', '1991-09-30', 30, 'empleado9@example.com', '319-222-3344', 'Alejandro', 'Jose', 'Gutierrez', 'Mendoza', 'Ecuatoriana'),
    ('0011223344', 'CC', '1989-06-17', 32, 'empleado10@example.com', '316-333-4455', 'Camilo', 'Andres', 'Sanchez', 'Rojas', 'Colombiana'),
    ('1122334455', 'TI', '2000-01-01', 21, 'empleado11@example.com', '313-444-5566', 'Marta', 'Luz', 'Mendez', 'Pardo', 'Colombiana');
    
 
/*---------------Creacion de registros en la tabla Rol_Empleado---------------*/   
INSERT INTO `rol_empleado`
            (`Sucursal_id_Sucursal`,
             `Empleado_idEmpleado`,
             `cargo_Empleado`,
             `cargo_Otro_Empleado`,
             `tipo_Contrato`,
             `fecha_Vinculacion_Empleado`,
             `antiguedad_Empleado`)
VALUES 
    (1, 1,'Gerente', 'N/A', 'Contrato a término fijo', '2020-12-01', 2),
    (1, 2,'Recepcionista', 'N/A', 'Contrato a término indefinido', '2020-12-01', 2),
    (1, 4,'Camarera', 'N/A', 'Contrato a término fijo', '2020-12-01', 2),
    (1, 3,'Mantenimiento', 'N/A', 'Contrato a término fijo', '2020-12-01', 2),
    (2, 1,'Gerente', 'N/A', 'Contrato a término fijo', '2020-10-01', 3),
    (2, 5,'Recepcionista', 'N/A', 'Contrato a término indefinido', '2020-10-01', 3),
    (2, 6,'Camarera', 'N/A', 'Contrato a término fijo', '2020-10-01', 3),
    (2, 7,'Mantenimiento', 'N/A', 'Contrato a término fijo', '2020-10-01', 3),
    (3, 8, 'Gerente', 'N/A', 'Contrato a termino indefinido', '2019-06-19', 4),
    (3, 9,'Recepcionista', 'N/A', 'Contrato a término indefinido', '2019-06-19', 4),
    (3, 10,'Camarera', 'N/A', 'Contrato a término fijo', '2019-06-19', 4),
    (3, 11,'Mantenimiento', 'N/A', 'Contrato a término fijo', '2019-06-19', 4),
    (3, 12,'Otro', 'Portero','Contrato a término fijo', '2019-06-19', 4);

/*---------------Creacion de registros en la tabla Huesped---------------*/           
INSERT INTO `huesped`
            (`cedula _Huesped`,
             `primer_Nombre_Huesped`,
             `segundo_Nombre_Huesped`,
             `primer_Apellido_Huesped`,
             `segundo_Apellido_Huesped`,
             `tipo_Documento_Huesped`,
             `nacionalidad`,
             `fecha_Nacimiento_Huesped`,
             `edad_Huesped`,
             `telefono_Huesped`,
             `correo_Huesped`)
VALUES
   ('1122334466', 'Oliver', 'Henry', 'Gomez', 'Davis', 'CC', 'Colombiana', '1984-03-15', 37, '112-233-4466', 'oliver@example.com'),
   ('2233444577', 'Ava', 'Charlotte', 'Martinez', 'Williams', 'TI', 'Colombiana', '2008-10-04', 15, '223-344-4577', 'ava@example.com'),
   ('3344555688', 'Emma', 'Sophia', 'Clark', 'Smith', 'CC', 'Colombiana', '1999-08-29', 22, '334-455-5688', 'emma@example.com'),
   ('4455666799', 'Liam', 'Jacob', 'Johnson', 'Anderson', 'Pasaporte', 'Brasileña', '1976-07-23', 45, '445-566-6799', 'liam@example.com'),
   ('5566777900', 'Sophia', 'Ava', 'Harris', 'Garcia', 'TI', 'Colombiana', '2008-12-01', 14, '556-677-7900', 'sophia@example.com'),
   ('6677888011', 'Noah', 'Michael', 'Brown', 'Davis', 'CC', 'Colombiana', '1993-05-07', 28, '667-788-8011', 'noah@example.com'),
   ('7788999122', 'Olivia', 'Elizabeth', 'Smith', 'Johnson', 'Pasaporte', 'Argentina', '1978-01-20', 43, '778-899-9122', 'olivia@example.com'),
   ('8899000233', 'Liam', 'Jacob', 'Anderson', 'Martinez', 'TI', 'Colombiana', '2000-09-10', 3, '889-900-0233', 'liam@example.com'),
   ('9900111344', 'Emma', 'Sophia', 'Davis', 'Brown', 'CC', 'Colombiana', '1995-03-04', 26, '990-011-1344', 'emma@example.com'),
   ('0011222455', 'Sophia', 'Ava', 'Garcia', 'Clark', 'CE', 'Peruana', '1977-11-19', 44, '001-122-2455', 'sophia@example.com'),
   ('1122334577', 'James', 'Benjamin', 'Brown', 'Anderson', 'Pasaporte', 'Italiana', '1989-06-28', 32, '112-233-4577', 'james@example.com'),
   ('2233445688', 'Olivia', 'Elizabeth', 'Clark', 'Smith', 'CE', 'Mexicana', '1974-04-03', 47, '223-344-5688', 'olivia@example.com'),
   ('3344556799', 'Liam', 'Jacob', 'Davis', 'Harris', 'CE', 'Chilena', '1982-02-14', 39, '334-455-6799', 'liam@example.com'),
   ('4455667900', 'Ava', 'Charlotte', 'Smith', 'Johnson', 'Pasaporte', 'Española', '1997-08-07', 24, '445-566-7900', 'ava@example.com'),
   ('5566778011', 'Sophia', 'Ava', 'Garcia', 'Martinez', 'CE', 'Uruguaya', '1983-07-01', 38, '556-677-8011', 'sophia@example.com'),
   ('6677889122', 'Noah', 'Michael', 'Brown', 'Clark', 'CC', 'Colombiana', '1990-10-15', 31, '667-788-9122', 'noah@example.com'),
   ('7788999233', 'Olivia', 'Elizabeth', 'Johnson', 'Anderson', 'CE', 'Paraguaya', '1986-09-25', 35, '778-899-9233', 'olivia@example.com'),
   ('8899000344', 'Emma', 'Sophia', 'Smith', 'Davis', 'TI', 'Colombiana', '2005-12-08', 17, '889-900-0344', 'emma@example.com'),
   ('9900111455', 'Liam', 'Jacob', 'Anderson', 'Garcia', 'Pasaporte', 'Francesa', '1979-03-21', 42, '990-011-1455', 'liam@example.com'),
   ('0011222566', 'Sophia', 'Ava', 'Harris', 'Brown', 'CC', 'Colombiana', '1994-07-11', 27, '001-122-2566', 'sophia@example.com'),
   ('1122334688', 'Noah', 'Michael', 'Martinez', 'Johnson', 'Pasaporte', 'Canadiense', '1984-06-19', 37, '112-233-4688', 'noah@example.com'),
   ('2233445799', 'Ava', 'Charlotte', 'Garcia', 'Brown', 'CE', 'Ecuatoriana', '1997-01-02', 24, '223-344-5799', 'ava@example.com'),
   ('3344556800', 'Emma', 'Sophia', 'Smith', 'Clark', 'CC', 'Colombiana', '1993-09-27', 28, '334-455-6800', 'emma@example.com'),
   ('4455667911', 'Liam', 'Jacob', 'Harris', 'Anderson', 'Pasaporte', 'Mexicana', '1976-12-14', 45, '445-566-7911', 'liam@example.com'),
   ('5566778022', 'Sophia', 'Ava', 'Davis', 'Gonzalez', 'TI', 'Colombiana', '2007-08-30', 16, '556-677-8022', 'sophia@example.com'),
   ('6677889133', 'Oliver', 'Henry', 'Brown', 'Taylor', 'CC', 'Colombiana', '1989-02-12', 32, '667-788-9133', 'oliver@example.com'),
   ('7788999244', 'Olivia', 'Elizabeth', 'Clark', 'Smith', 'CE', 'Chilena', '1975-04-27', 46, '778-899-9244', 'olivia@example.com'),
   ('8899000355', 'Liam', 'Jacob', 'Smith', 'Davis', 'TI', 'Colombiana', '2007-11-19', 15, '889-900-0355', 'liam@example.com'),
   ('9900111466', 'Emma', 'Sophia', 'Harris', 'Garcia', 'CE', 'Peruana', '1985-07-03', 36, '990-011-1466', 'emma@example.com'),
   ('0011222577', 'Sophia', 'Ava', 'Clark', 'Davis', 'CC', 'Colombiana', '1983-03-18', 38, '001-122-2577', 'sophia@example.com'),
   ('1122334799', 'James', 'Benjamin', 'Smith', 'Anderson', 'Pasaporte', 'Española', '1996-06-11', 25, '112-233-4799', 'james@example.com'),
   ('2233445800', 'Olivia', 'Elizabeth', 'Garcia', 'Martinez', 'CC', 'Colombiana', '1987-12-24', 34, '223-344-5800', 'olivia@example.com'),
   ('3344556911', 'Liam', 'Jacob', 'Davis', 'Johnson', 'CE', 'Venezolana', '1994-01-08', 27, '334-455-6911', 'liam@example.com'),
   ('4455668022', 'Ava', 'Charlotte', 'Harris', 'Brown', 'TI', 'Colombiana', '2010-09-07', 13, '445-566-8022', 'ava@example.com'),
   ('5566779133', 'Sophia', 'Ava', 'Johnson', 'Clark', 'CE', 'Mexicana', '1978-05-29', 43, '556-677-9133', 'sophia@example.com'),
   ('6677889244', 'Noah', 'Michael', 'Clark', 'Smith', 'CC', 'Colombiana', '1991-07-22', 30, '667-788-9244', 'noah@example.com'),
   ('7788999355', 'Olivia', 'Elizabeth', 'Smith', 'Garcia', 'TI', 'Colombiana', '2008-04-16', 15, '778-899-9355', 'olivia@example.com'),
   ('8899000466', 'Emma', 'Sophia', 'Davis', 'Brown', 'CE', 'Paraguaya', '1982-10-31', 39, '889-900-0466', 'emma@example.com'),
   ('9900111577', 'Sophia', 'Ava', 'Harris', 'Taylor', 'Pasaporte', 'Italiana', '1979-08-12', 42, '990-011-1577', 'sophia@example.com'),
   ('0011222688', 'Oliver', 'Henry', 'Brown', 'Anderson', 'CC', 'Colombiana', '1995-02-03', 26, '001-122-2688', 'oliver@example.com'),
   ('1122334800', 'Ava', 'Charlotte', 'Smith', 'Brown', 'CC', 'Colombiana', '1990-04-22', 31, '112-233-4800', 'ava@example.com'),
   ('2233445911', 'Noah', 'Michael', 'Garcia', 'Martinez', 'CE', 'Ecuatoriana', '1986-11-15', 35, '223-344-5911', 'noah@example.com'),
   ('3344557022', 'Emma', 'Sophia', 'Davis', 'Johnson', 'TI', 'Colombiana', '2008-02-08', 15, '334-455-7022', 'emma@example.com'),
   ('4455668133', 'Liam', 'Jacob', 'Brown', 'Clark', 'Pasaporte', 'Mexicana', '1988-07-29', 33, '445-566-8133', 'liam@example.com'),
   ('5566779244', 'Olivia', 'Elizabeth', 'Clark', 'Davis', 'CE', 'Venezolana', '1979-09-14', 42, '556-677-9244', 'olivia@example.com'),
   ('6677889355', 'Sophia', 'Ava', 'Harris', 'Garcia', 'CC', 'Colombiana', '1992-05-03', 29, '667-788-9355', 'sophia@example.com'),
   ('7788999466', 'Oliver', 'Henry', 'Davis', 'Smith', 'TI', 'Colombiana', '2006-12-28', 14, '778-899-9466', 'oliver@example.com'),
   ('8899000577', 'Liam', 'Jacob', 'Harris', 'Anderson', 'CE', 'Chilena', '1983-03-10', 38, '889-900-0577', 'liam@example.com'),
   ('9900111688', 'Emma', 'Sophia', 'Garcia', 'Johnson', 'Pasaporte', 'Española', '1990-09-18', 31, '990-011-1688', 'emma@example.com'),
   ('0011222799', 'Sophia', 'Ava', 'Martinez', 'Brown', 'CC', 'Colombiana', '1993-08-05', 28, '001-122-2799', 'sophia@example.com');

/*---------------Creacion de registros en la tabla Habitacion---------------*/
INSERT INTO `habitacion`
            (`Sucursal_id_Sucursal`,
            `numero_Habitacion`,
             `descripcion _Habitacion`,
             `tipo_Habitacion`,
             `capacidad_Habitacion`,
             `precio_Habitacion`)
VALUES
/*-----------------------------Sucursal Medellin----------------------------------------*/
    (1, '101', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '102', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '103', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '104', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '105', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '106', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '107', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '201', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '202', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '203', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '204', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '205', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '206', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '207', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (1, '301', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '302', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '303', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '304', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '305', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '306', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '307', 'Habitación Sencilla con vista al jardín', 'Sencilla', 1, 50000),
    (1, '401', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '402', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '403', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '404', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '405', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '406', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
    (1, '407', 'Habitación Doble con vista al balcón', 'Doble', 4, 120000),
/*---------------------Sucursal Sibate-----------------------------*/    
    (2, '201', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '202', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '203', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '204', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '205', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '206', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '207', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (2, '301', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '302', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '303', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '304', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '305', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '306', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '307', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (2, '401', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '402', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '403', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '404', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '405', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '406', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (2, '407', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
/*--------------------------Sucursal Bogota-----------------------------------*/    
    (3, '101', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '102', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '103', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '104', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '105', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '106', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '107', 'Habitación Sencilla con balcón', 'Sencilla', 1, 50000),
    (3, '201', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '202', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '203', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '204', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '205', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '206', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '207', 'Habitación Doble con balcón', 'Doble', 4, 120000),
    (3, '301', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (3, '302', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (3, '303', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (3, '304', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000),
    (3, '305', 'Habitación Para pareja con balcón', 'Para pareja', 2, 60000);


/*---------------Creacion de registros en la tabla Hospedaje---------------*/    
INSERT INTO `sjreal`.`hospedaje`
            (`codigo_Hospedaje`,
             `Habitacion_idHabitacion`,
             `Huesped_idHuesped`,
             `checkIn_Hospedaje`,
             `checkOut_Hospedaje`,
             `tipo_Hospedaje`)
VALUES 
    (1 , 7 , 1 , '2023-01-05 12:00:00', '2023-01-10 14:00:00', 'Reserva'), /*1*/
    (1 , 7 , 2 , '2023-01-05 12:00:00', '2023-01-10 14:00:00', 'Reserva'), /*2*/    
    (2 , 29, 3 , '2023-01-10 14:30:00', '2023-01-15 09:45:00', 'Hospedaje normal'), /*3*/    
    (3 , 50, 22, '2023-01-04 08:00:00', '2023-01-10 16:30:00', 'Reserva'), /*4*/
    (4 , 9 , 14, '2023-01-15 13:30:00', '2023-01-20 15:30:00', 'Hospedaje normal'), /*5*/
    (4 , 9 , 31, '2023-01-15 13:30:00', '2023-01-20 15:30:00', 'Hospedaje normal'), /*6*/    
    (5 , 36, 40, '2023-01-20 16:30:00', '2023-01-25 13:00:00', 'Reserva'), /*7*/
    (5 , 36, 9 , '2023-01-20 16:45:00', '2023-01-25 13:00:00', 'Reserva'), /*8*/    
    (6 , 51, 1 , '2023-01-25 12:45:00', '2023-01-28 11:00:00', 'Hospedaje normal'), /*9*/
    (7 , 1 , 49, '2023-01-19 09:15:00', '2023-01-25 14:45:00', 'Reserva'), /*10*/   
    (8 , 33, 44, '2023-01-08 12:00:00', '2023-01-13 14:00:00', 'Hospedaje normal'), /*11*/    
    (9 , 56, 29, '2023-01-01 09:30:00', '2023-01-07 14:15:00', 'Reserva'), /*12*/
    (10, 20, 39, '2023-01-10 14:30:00', '2023-01-15 09:45:00', 'Hospedaje normal'), /*13*/
    (11, 35, 23, '2023-01-04 08:00:00', '2023-01-10 16:30:00', 'Reserva'), /*14*/    
    (12, 53, 15, '2023-01-15 10:15:00', '2023-01-20 15:30:00', 'Hospedaje normal'), /*15*/
    (13, 19, 40, '2023-01-09 13:30:00', '2023-01-14 11:45:00', 'Reserva'), /*16*/
    (65, 21, 40, '2023-01-20 16:30:00', '2023-01-25 12:00:00', 'Reserva'), /*17*/
    (14, 44, 11, '2023-01-12 10:45:00', '2023-01-17 13:00:00', 'Hospedaje normal'), /*18*/
    (14, 44, 32, '2023-01-12 12:45:00', '2023-01-18 11:00:00', 'Hospedaje normal'), /*19*/    
    (15, 54, 45, '2023-01-19 09:15:00', '2023-01-25 14:45:00', 'Reserva'), /*20*/
    (16, 13, 15, '2023-02-05 12:00:00', '2023-02-10 14:00:00', 'Hospedaje normal'), /*21*/
    (16, 13, 30, '2023-02-02 09:30:00', '2023-02-08 14:15:00', 'Hospedaje normal'), /*22*/    
    (17, 31, 26, '2023-02-10 14:30:00', '2023-02-15 09:45:00', 'Reserva'), /*23*/
    (18, 50, 26, '2023-02-04 08:00:00', '2023-02-10 16:30:00', 'Hospedaje normal'), /*24*/       
    (19, 1 , 10, '2023-02-15 10:15:00', '2023-02-20 15:30:00', 'Reserva'), /*25*/
    (20, 1 , 4 , '2023-02-09 13:30:00', '2023-02-14 11:45:00', 'Hospedaje normal'), /*26*/
    (21, 30, 40, '2023-02-20 16:30:00', '2023-02-25 12:00:00', 'Reserva'), /*27*/
    (22, 61, 19, '2023-02-25 10:45:00', '2023-02-28 13:00:00', 'Hospedaje normal'), /*28*/
    (22, 61, 8 , '2023-02-25 10:45:00', '2023-02-28 13:00:00', 'Hospedaje normal'), /*29*/
    (23, 46, 44, '2023-02-19 09:15:00', '2023-02-25 14:45:00', 'Reserva'), /*30*/
    (23, 46, 30, '2023-02-06 08:30:00', '2023-02-25 14:45:00', 'Reserva'), /*31*/
    (24, 52, 49, '2023-02-11 11:00:00', '2023-02-16 13:30:00', 'Hospedaje normal'), /*32*/
    (25, 14, 15, '2023-02-16 14:45:00', '2023-02-20 09:00:00', 'Reserva'), /*33*/
    (26, 31, 15, '2023-02-21 08:00:00', '2023-02-27 15:15:00', 'Hospedaje normal'), /*34*/
    (27, 1 , 26, '2023-02-26 16:30:00', '2023-02-28 10:45:00', 'Reserva'), /*35*/
    (28, 15, 3 , '2023-02-07 12:15:00', '2023-02-12 14:30:00', 'Hospedaje normal'), /*36*/
    (29, 16, 14, '2023-02-12 15:45:00', '2023-02-17 09:30:00', 'Reserva'), /*37*/
    (30, 9 , 22, '2023-02-17 12:00:00', '2023-02-22 13:45:00', 'Hospedaje normal'), /*38*/
    (30, 9 , 31, '2023-02-17 12:30:00', '2023-02-22 13:00:00', 'Hospedaje normal'), /*39*/
    (31, 17, 9 , '2023-02-27 14:15:00', '2023-02-28 09:00:00', 'Reserva'), /*40*/
    (32, 18, 40, '2023-02-06 14:45:00', '2023-02-12 16:30:00', 'Hospedaje normal'), /*41*/
    (33, 19, 20, '2023-02-13 08:00:00', '2023-02-18 10:15:00', 'Reserva'), /*42*/
    (34, 10, 33, '2023-02-18 11:30:00', '2023-02-28 13:00:00', 'Hospedaje normal'), /*43*/
    (34, 10, 23, '2023-02-18 11:30:00', '2023-02-28 13:00:00', 'Hospedaje normal'), /*44*/
    (35, 20, 50, '2023-02-28 14:15:00', '2023-02-28 23:59:59', 'Reserva'), /*45*/
    (36, 21, 6 , '2023-02-01 12:00:00', '2023-02-03 14:00:00', 'Hospedaje normal'), /*46*/
    (37, 29, 46, '2023-02-04 09:30:00', '2023-02-06 14:15:00', 'Reserva'), /*47*/
    (38, 30, 36, '2023-02-07 14:30:00', '2023-02-09 09:45:00', 'Hospedaje normal'), /*48*/
    (39, 31, 16, '2023-02-10 10:00:00', '2023-02-12 16:30:00', 'Reserva'), /*49*/
    (40, 32, 49, '2023-02-13 16:15:00', '2023-02-15 10:30:00', 'Hospedaje normal'), /*50*/
    (40, 2 , 41, '2023-03-13 16:15:00', '2023-03-15 10:30:00', 'Hospedaje normal'), /*51*/
    (40, 2 , 11, '2023-03-13 16:15:00', '2023-03-15 10:30:00', 'Hospedaje normal'), /*52*/
    (41, 2 , 26, '2023-03-10 14:45:00', '2023-03-15 09:15:00', 'Reserva'), /*53*/
    (42, 33, 44, '2023-03-04 08:15:00', '2023-03-10 16:45:00', 'Hospedaje normal'), /*54*/
    (43, 34, 32, '2023-03-15 10:00:00', '2023-03-20 15:45:00', 'Reserva'), /*55*/
    (44, 35, 42, '2023-03-09 13:45:00', '2023-03-14 11:30:00', 'Hospedaje normal'), /*56*/
    (45, 50, 17, '2023-03-20 16:45:00', '2023-03-25 12:15:00', 'Reserva'), /*57*/
    (46, 11, 29, '2023-03-12 10:30:00', '2023-03-17 13:15:00', 'Hospedaje normal'), /*58*/
    (46, 11, 21, '2023-03-25 12:45:00', '2023-03-28 11:15:00', 'Hospedaje normal'), /*59*/
    (48, 12, 1 , '2023-03-19 09:30:00', '2023-03-25 14:00:00', 'Reserva'), /*60*/
    (48, 12, 15, '2023-03-06 08:45:00', '2023-03-12 12:30:00', 'Reserva'), /*61*/
    (49, 51, 30, '2023-03-11 11:15:00', '2023-03-16 13:45:00', 'Hospedaje normal'), /*62*/
    (50, 52, 48, '2023-03-16 15:00:00', '2023-03-20 09:15:00', 'Reserva'), /*63*/
    (51, 53, 38, '2023-03-21 08:15:00', '2023-03-27 15:30:00', 'Hospedaje normal'), /*64*/
    (52, 54, 13, '2023-03-26 16:45:00', '2023-03-28 10:30:00', 'Reserva'), /*65*/
    (53, 55, 45, '2023-03-07 12:30:00', '2023-03-12 14:45:00', 'Hospedaje normal'), /*66*/
    (54, 56, 39, '2023-03-12 15:45:00', '2023-03-17 09:45:00', 'Reserva'), /*67*/
    (55, 13, 19, '2023-03-17 10:15:00', '2023-03-22 11:30:00', 'Hospedaje normal'), /*68*/
    (55, 13, 35, '2023-03-22 12:45:00', '2023-03-27 13:15:00', 'Hospedaje normal'), /*69*/
    (56, 1 , 7 , '2023-03-27 14:30:00', '2023-03-28 09:30:00', 'Reserva'), /*70*/
    (57, 15, 10, '2023-03-06 15:00:00', '2023-03-12 16:45:00', 'Hospedaje normal'), /*71*/
    (58, 16, 24, '2023-03-13 08:15:00', '2023-03-18 10:30:00', 'Reserva'), /*72*/
    (59, 17, 4 , '2023-03-18 11:45:00', '2023-03-22 15:15:00', 'Hospedaje normal'), /*73*/
    (59, 18, 27, '2023-03-23 09:45:00', '2023-03-28 13:45:00', 'Hospedaje normal'), /*74*/
    (60, 19, 12, '2023-03-28 14:00:00', '2023-03-28 23:59:59', 'Reserva'), /*75*/
    (60, 20, 3 , '2023-03-01 12:15:00', '2023-03-05 10:30:00', 'Reserva'), /*76*/
    (61, 21, 14, '2023-03-06 11:45:00', '2023-03-11 14:00:00', 'Hospedaje normal'), /*77*/
    (62, 29, 22, '2023-03-09 15:15:00', '2023-03-14 10:45:00', 'Reserva'), /*78*/
    (63, 30, 31, '2023-03-16 13:00:00', '2023-03-21 15:30:00', 'Hospedaje normal'), /*79*/
    (64, 31, 9 , '2023-03-23 16:45:00', '2023-03-28 08:15:00', 'Reserva'); /*80*/
    
  
/*--------------------------------------------------------------------------------------------------------------------*/     

INSERT INTO `sjreal`.`mantenimiento`
            (`nombre_Mantenimiento`,
             `tipo_Mantenimiento`,
             `Rol_Empleado`)
VALUES ('nombre_Mantenimiento','tipo_Mantenimiento','Rol_Empleado');
        
  
INSERT INTO `sjreal`.`detalle_mantenimiento`
            (`fecha_Mantenimiento`,
             `costo_Mantenimiento`,
             `descripcion_Mantenimiento`,
             `Habitacion_idHabitacion`,
             `Mantenimiento_idMantenimiento`)
VALUES ('fecha_Mantenimiento','costo_Mantenimiento','descripcion_Mantenimiento','Habitacion_idHabitacion','Mantenimiento_idMantenimiento');   
        
INSERT INTO `sjreal`.`mantenimiento_sucursal`
            (`Sucursal_idSucursal`,`fecha_Mantenimiento`,
             `costo_Mantenimiento`,
             `descripcion_Mantenimiento`,
             `Mantenimiento_idMantenimineto`)
VALUES ('Sucursal_idSucursal','fecha_Mantenimiento','costo_Mantenimiento','descripcion_Mantenimiento','Mantenimiento_idMantenimineto');
        
INSERT INTO `sjreal`.`pqrfs`
            (`tipo_PQRFs`,
             `descripcion_PQRFs`,
             `fecha_Radicado`,
             `estado_PQRFs`,
             `Huesped_idHuesped`,
             `Rol_Empleado_idRol_Empleado`)
VALUES ('tipo_PQRFs','descripcion_PQRFs','fecha_Radicado','estado_PQRFs','Huesped_idHuesped','Rol_Empleado_idRol_Empleado');        
           
INSERT INTO `sjreal`.`detalle_pago`
            (`Producto_idProducto`,
             `Pago_idPago`,
             `precio_Por_Dia_Hospedado`,
             `precio_Total`)
VALUES ('Producto_idProducto','Pago_idPago','precio_Por_Dia_Hospedado','precio_Total');
        
INSERT INTO `sjreal`.`pago`
            (`Hospedaje_idHospedaje`,
             `titular _Pago`,
             `IDTitular_Pago`,
             `medioDePago_Pago`,
             `concepto_Pago`,
             `total_Pago`,
             `tipo_Cliente`)
VALUES ('Hospedaje_idHospedaje','titular _Pago','IDTitular_Pago','medioDePago_Pago','concepto_Pago','total_Pago','tipo_Cliente');
        
INSERT INTO `sjreal`.`pago_recibo`
            (`Recibo_idRecibo`,
             `Responsable_idResponsable1`,
             `fecha_Pago_Recibo`,
             `monto_Recibo`,
             `Pago_Con_Retraso`,
             `motivo_Retraso`)
VALUES ('Recibo_idRecibo','Responsable_idResponsable1','fecha_Pago_Recibo','monto_Recibo','Pago_Con_Retraso','motivo_Retraso');

INSERT INTO `sjreal`.`pedido`
            (`Proveedor_idProveedor`,
             `Control_Inventario_idControl_Inventario`,
             `cantidad_Producto`,
             `fecha_Entrega`,
             `precio_Total_Pedido`,
             `precio_Unitario_Producto`)
VALUES ('Proveedor_idProveedor','Control_Inventario_idControl_Inventario','cantidad_Producto','fecha_Entrega','precio_Total_Pedido','precio_Unitario_Producto');
      
INSERT INTO `sjreal`.`vehiculo`
            (`Huesped_idHuesped`,
             `placa_Vehiculo`,
             `modelo_Vehiculo`,
             `color_Vehiculo`)
VALUES ('Huesped_idHuesped','placa_Vehiculo','modelo_Vehiculo','color_Vehiculo');
        
                                                                                
        
        
        