create database laboratorioTaller;
use laboratorioTaller;

CREATE TABLE sucursales (
    id_sucursal INT PRIMARY KEY,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono_fijo VARCHAR(15) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(15) NOT NULL,
    direccion_residencia VARCHAR(200) NOT NULL,
    ciudad_residencia VARCHAR(100) NOT NULL,
    celular VARCHAR(15) NOT NULL
);

CREATE TABLE vehiculos (
    id_vehiculo INT PRIMARY KEY,
    tipo_vehiculo VARCHAR(50) NOT NULL,
    placa VARCHAR(20) NOT NULL,
    referencia VARCHAR(50) NOT NULL,
    modelo INT NOT NULL,
    puertas INT NOT NULL,
    capacidad INT NOT NULL,
    sunroof BOOLEAN NOT NULL,
    motor VARCHAR(20) NOT NULL,
    color VARCHAR(30) NOT NULL
);
alter table vehiculos modify column placa VARCHAR(30);

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    id_sucursal INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(15) NOT NULL,
    direccion_residencia VARCHAR(200) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    celular VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE alquileres (
    id_alquiler INT PRIMARY KEY,
    id_vehiculo INT NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_sucursal_salida INT NOT NULL,
    id_sucursal_entrada INT NOT NULL,
    fecha_salida DATE NOT NULL,
    fecha_entrada DATE NOT NULL,
    fecha_esperada_llegada DATE NOT NULL,
    valor_semana DECIMAL(10,2) NOT NULL,
    valor_dia DECIMAL(10,2) NOT NULL,
    porcentaje_descuento DECIMAL(5,2) NOT NULL,
    valor_cotizado DECIMAL(10,2) NOT NULL,
    valor_pagado DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_sucursal_salida) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_sucursal_entrada) REFERENCES sucursales(id_sucursal)
);


INSERT INTO sucursales (id_sucursal, ciudad, direccion, telefono_fijo, correo_electronico) VALUES
(1, 'Bogotá', 'Calle 123 #45-67', '6011234567', 'bogota@sucursal.com'),
(2, 'Medellín', 'Carrera 89 #34-56', '6047654321', 'medellin@sucursal.com'),
(3, 'Cali', 'Avenida 45 #23-78', '6029876543', 'cali@sucursal.com'),
(4, 'Barranquilla', 'Calle 67 #89-01', '6054567890', 'barranquilla@sucursal.com'),
(5, 'Cartagena', 'Carrera 12 #34-56', '6052345678', 'cartagena@sucursal.com');

INSERT INTO clientes (id_cliente, nombre, apellido, cedula, direccion_residencia, ciudad_residencia, celular)
VALUES 
(1, 'Pedro', 'Ramírez', '6789012345', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(2, 'Luisa', 'Fernández', '7890123456', 'Carrera 13 #20-21', 'Medellín', '3012345678'),
(3, 'Andrés', 'García', '8901234567', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(4, 'Sofía', 'Hernández', '9012345678', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(5, 'Miguel', 'Torres', '0123456789', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(6, 'Juan', 'Pérez', '1234567890', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(7, 'María', 'Gómez', '2345678901', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(8, 'Carlos', 'López', '3456789012', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(9, 'Ana', 'Martínez', '4567890123', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(10, 'Luis', 'Rodríguez', '5678901234', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(11, 'Elena', 'Jiménez', '6789012346', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(12, 'Javier', 'Ruiz', '7890123457', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(13, 'Laura', 'Mendoza', '8901234568', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(14, 'Ricardo', 'Castro', '9012345679', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(15, 'Patricia', 'Vargas', '0123456780', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(16, 'Santiago', 'Silva', '1234567891', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(17, 'Daniela', 'Ortega', '2345678902', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(18, 'Cristian', 'Cortés', '3456789013', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(19, 'Natalia', 'Paredes', '4567890124', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(20, 'Fernando', 'Reyes', '5678901235', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(21, 'Isabel', 'Morales', '6789012347', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(22, 'Alberto', 'Ríos', '7890123458', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(23, 'Verónica', 'Quintero', '8901234569', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(24, 'Diego', 'Acosta', '9012345670', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(25, 'Mónica', 'Vega', '0123456781', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(26, 'Héctor', 'Luna', '1234567892', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(27, 'Gloria', 'Navarro', '2345678903', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(28, 'Jorge', 'Molina', '3456789014', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(29, 'Paula', 'Ocampo', '4567890125', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(30, 'Francisco', 'Suárez', '5678901236', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(31, 'Rosa', 'Álvarez', '6789012348', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(32, 'Mauricio', 'Ramos', '7890123459', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(33, 'Claudia', 'Díaz', '8901234570', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(34, 'Hernán', 'Guzmán', '9012345671', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(35, 'Valeria', 'Prieto', '0123456782', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(36, 'Oscar', 'Beltrán', '1234567893', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(37, 'Ángela', 'Escobar', '2345678904', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(38, 'Roberto', 'Mora', '3456789015', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(39, 'Silvia', 'Cárdenas', '4567890126', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(40, 'Gabriel', 'Mejía', '5678901237', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(41, 'Adriana', 'Fajardo', '6789012349', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(42, 'Manuel', 'Salazar', '7890123460', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(43, 'Yolanda', 'Muñoz', '8901234571', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(44, 'Armando', 'Montoya', '9012345672', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(45, 'Julia', 'Bermúdez', '0123456783', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(46, 'Guillermo', 'Velásquez', '1234567894', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(47, 'Rafael', 'Vargas', '2345678905', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(48, 'Lina', 'Galeano', '3456789016', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(49, 'Arturo', 'Serrano', '4567890127', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(50, 'Olga', 'Peralta', '5678901238', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(51, 'Diana', 'Cruz', '6789012350', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(52, 'Germán', 'Rueda', '7890123461', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(53, 'Rocío', 'Herrera', '8901234572', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(54, 'Jaime', 'Navarro', '9012345673', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(55, 'Liliana', 'Peña', '0123456784', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(56, 'Sebastián', 'Ríos', '1234567895', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(57, 'Beatriz', 'Ramírez', '2345678906', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(58, 'Nelson', 'González', '3456789017', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(59, 'Camila', 'Zapata', '4567890128', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(60, 'Pablo', 'Lara', '5678901239', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(61, 'Lorena', 'Maldonado', '6789012351', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(62, 'Martín', 'Cabrera', '7890123462', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(63, 'Sara', 'Patiño', '8901234573', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(64, 'Felipe', 'Barreto', '9012345674', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(65, 'Gloria', 'Ramírez', '0123456785', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(66, 'Rodrigo', 'Ramírez', '1234567896', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(67, 'Verónica', 'Torres', '2345678907', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(68, 'Samuel', 'Díaz', '3456789018', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(69, 'Adriana', 'Pérez', '4567890129', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(70, 'Juan', 'Vargas', '5678901240', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(71, 'Mariana', 'Gómez', '6789012352', 'Calle 16 #17-18', 'Bogotá', '3001234567'),
(72, 'Alejandro', 'López', '7890123463', 'Carrera 19 #20-21', 'Medellín', '3012345678'),
(73, 'María', 'González', '8901234574', 'Avenida 22 #23-24', 'Cali', '3023456789'),
(74, 'Iván', 'Martínez', '9012345675', 'Calle 25 #26-27', 'Barranquilla', '3034567890'),
(75, 'Andrea', 'Rodríguez', '0123456786', 'Carrera 28 #29-30', 'Cartagena', '3045678901'),
(76, 'Gabriela', 'Castaño', '1234567897', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(77, 'David', 'Moreno', '2345678908', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(78, 'Clara', 'Ramos', '3456789019', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(79, 'Jorge', 'Fajardo', '4567890130', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(80, 'Juliana', 'López', '5678901241', 'Carrera 13 #14-15', 'Cartagena', '3045678901'),
(81, 'Rodrigo', 'Ramírez', '6789012353', 'Calle 130 #11-31', 'Barranquilla', '3434567890'),
(82, 'Mónica', 'Gómez', '4523456789', 'Avenida 133 #134-135', 'Cartagena', '3456789011'),
(83, 'Fernando', 'Ruiz', '4623456789', 'Calle 136 #137-138', 'Bogotá', '3456789012'),
(84, 'Antonia', 'Ortiz', '4723456789', 'Avenida 139 #140-141', 'Medellín', '3467890123'),
(85, 'Mauricio', 'Cruz', '4823456789', 'Carrera 142 #143-144', 'Cali', '3478901234'),
(86, 'Fabián', 'López', '4923456789', 'Calle 145 #146-147', 'Barranquilla', '3489012345'),
(87, 'Andrea', 'Martínez', '5023456789', 'Avenida 148 #149-150', 'Cartagena', '3490123456'),
(88, 'Santiago', 'Hernández', '5123456789', 'Calle 151 #152-153', 'Bogotá', '3501234567'),
(89, 'Julieta', 'Morales', '5223456789', 'Carrera 154 #155-156', 'Medellín', '3512345678'),
(90, 'Manuel', 'Rodríguez', '5323456789', 'Avenida 157 #158-159', 'Cali', '3523456789'),
(91, 'Isabel', 'Ramírez', '5423456789', 'Calle 160 #161-162', 'Barranquilla', '3534567890'),
(92, 'Sebastián', 'García', '5523456789', 'Carrera 163 #164-165', 'Cartagena', '3545678901'),
(93, 'María', 'Gómez', '5623456789', 'Avenida 166 #167-168', 'Bogotá', '3556789012'),
(94, 'Carlos', 'López', '5723456789', 'Calle 169 #170-171', 'Medellín', '3567890123'),
(95, 'Ana', 'Martínez', '5823456789', 'Carrera 172 #173-174', 'Cali', '3578901234'),
(96, 'Luis', 'Rodríguez', '5923456789', 'Avenida 175 #176-177', 'Barranquilla', '3589012345'),
(97, 'Elena', 'Jiménez', '6023456789', 'Calle 178 #179-180', 'Cartagena', '3590123456'),
(98, 'Javier', 'Ruiz', '6123456789', 'Carrera 181 #182-183', 'Bogotá', '3601234567'),
(99, 'Laura', 'Mendoza', '6223456789', 'Avenida 184 #185-186', 'Medellín', '3612345678'),
(100, 'Ricardo', 'Castro', '6323456789', 'Calle 187 #188-189', 'Cali', '3623456789');



SELECT COUNT(*) FROM alquileres;


INSERT INTO vehiculos (id_vehiculo, tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) VALUES
(1, 'Sedán', 'ABC123', 'Toyota Corolla', 2022, 4, 5, TRUE, '1.8L', 'Rojo'),
(2, 'Compacto', 'DEF456', 'Hyundai i10', 2021, 4, 5, FALSE, '1.2L', 'Blanco'),
(3, 'Camioneta', 'GHI789', 'Ford Ranger', 2023, 4, 5, TRUE, '2.3L', 'Negro'),
(4, 'Deportivo', 'JKL012', 'Chevrolet Camaro', 2020, 2, 4, TRUE, '3.6L', 'Amarillo'),
(5, 'SUV', 'MNO345', 'Honda CR-V', 2022, 4, 7, TRUE, '2.4L', 'Azul'),
(6, 'SUV', 'PQR678', 'Mazda CX-5', 2023, 4, 5, TRUE, '2.5L', 'Gris'),
(7, 'Compacto', 'STU901', 'Kia Rio', 2022, 4, 5, FALSE, '1.6L', 'Plata'),
(8, 'Camioneta', 'VWX234', 'Toyota Hilux', 2021, 4, 5, TRUE, '2.8L', 'Blanco'),
(9, 'Deportivo', 'YZA567', 'Ford Mustang', 2023, 2, 4, TRUE, '5.0L', 'Rojo'),
(10, 'Sedán', 'BCD890', 'Honda Civic', 2021, 4, 5, FALSE, '1.5L', 'Negro'),
(11, 'SUV', 'EFG123', 'Nissan X-Trail', 2023, 4, 5, TRUE, '2.0L', 'Plateado'),
(12, 'Sedán', 'HIJ456', 'Volkswagen Jetta', 2022, 4, 5, TRUE, '1.4L', 'Azul Oscuro'),
(13, 'Compacto', 'KLM789', 'Renault Kwid', 2021, 4, 5, FALSE, '1.0L', 'Gris Claro'),
(14, 'Camioneta', 'NOP012', 'Mitsubishi Montero Sport', 2023, 4, 7, TRUE, '3.0L', 'Verde'),
(15, 'Deportivo', 'QRS345', 'BMW M4', 2020, 2, 4, TRUE, '3.0L', 'Blanco'),
(16, 'SUV', 'TUV678', 'Subaru Forester', 2022, 4, 5, TRUE, '2.5L', 'Gris Oscuro'),
(17, 'Compacto', 'WXY901', 'Peugeot 208', 2021, 4, 5, FALSE, '1.2L', 'Rojo'),
(18, 'Camioneta', 'ZAB234', 'Chevrolet Tahoe', 2021, 4, 8, TRUE, '5.3L', 'Negro'),
(19, 'Deportivo', 'CDE567', 'Audi R8', 2023, 2, 4, TRUE, '5.2L', 'Plata'),
(20, 'Sedán', 'FGH890', 'Mercedes-Benz C-Class', 2022, 4, 5, TRUE, '2.0L', 'Blanco'),
(21, 'SUV', 'IJK123', 'Jeep Grand Cherokee', 2023, 4, 5, TRUE, '3.6L', 'Negro'),
(22, 'Sedán', 'LMN456', 'Volvo S60', 2021, 4, 5, TRUE, '2.0L', 'Gris'),
(23, 'Compacto', 'OPQ789', 'Hyundai Accent', 2022, 4, 5, FALSE, '1.6L', 'Azul Claro'),
(24, 'Camioneta', 'RST012', 'Ford Explorer', 2023, 4, 7, TRUE, '3.0L', 'Rojo'),
(25, 'Deportivo', 'UVW345', 'Porsche 911', 2020, 2, 4, TRUE, '3.0L', 'Amarillo'),
(26, 'SUV', 'XYZ678', 'Toyota RAV4', 2021, 4, 5, TRUE, '2.5L', 'Verde Oscuro'),
(27, 'Compacto', '123ABC', 'Seat Ibiza', 2022, 4, 5, FALSE, '1.0L', 'Blanco Perla'),
(28, 'Camioneta', '456DEF', 'GMC Yukon', 2021, 4, 8, TRUE, '6.2L', 'Negro Mate'),
(29, 'Deportivo', '789GHI', 'Ferrari 488 GTB', 2023, 2, 4, TRUE, '3.9L', 'Rojo Ferrari'),
(30, 'Sedán', 'JKL123', 'Acura TLX', 2022, 4, 5, TRUE, '2.0L', 'Gris Titanio'),
(31, 'SUV', 'MNO456', 'Lexus RX', 2023, 4, 5, TRUE, '3.5L', 'Plata'),
(32, 'Sedán', 'PQR789', 'Infiniti Q50', 2021, 4, 5, TRUE, '3.0L', 'Azul Profundo'),
(33, 'Compacto', 'STU012', 'Mazda 2', 2022, 4, 5, FALSE, '1.5L', 'Rojo Intenso'),
(34, 'Camioneta', 'VWX345', 'Jeep Wrangler', 2021, 2, 4, TRUE, '3.6L', 'Verde Militar'),
(35, 'Deportivo', 'YZA678', 'McLaren 720S', 2023, 2, 4, TRUE, '4.0L', 'Naranja'),
(36, 'SUV', 'BCD901', 'Cadillac XT5', 2022, 4, 5, TRUE, '3.6L', 'Blanco Diamante'),
(37, 'Compacto', 'EFG234', 'Kia Picanto', 2021, 4, 5, FALSE, '1.0L', 'Amarillo Chillón'),
(38, 'Camioneta', 'HIJ567', 'Land Rover Discovery', 2023, 4, 7, TRUE, '3.0L', 'Gris Metalizado'),
(39, 'Deportivo', 'KLM890', 'Nissan GT-R', 2020, 2, 4, TRUE, '3.8L', 'Plata Brillante'),
(40, 'Sedán', 'NOP123', 'Alfa Romeo Giulia', 2022, 4, 5, TRUE, '2.0L', 'Rojo Competizione'),
(41, 'SUV', 'QRS456', 'Ford Escape', 2023, 4, 5, TRUE, '2.5L', 'Gris Espacial'),
(42, 'Compacto', 'TUV789', 'Volkswagen Polo', 2022, 4, 5, FALSE, '1.0L', 'Blanco Puro'),
(43, 'Camioneta', 'WXY012', 'Chevrolet Blazer', 2021, 4, 5, TRUE, '3.6L', 'Negro Clásico'),
(44, 'Deportivo', 'ZAB345', 'Mercedes-AMG GT', 2023, 2, 4, TRUE, '4.0L', 'Plata Brillante'),
(45, 'Sedán', 'CDE678', 'BMW 3 Series', 2022, 4, 5, TRUE, '2.0L', 'Azul Mediterráneo'),
(46, 'SUV', 'FGH901', 'Toyota Highlander', 2023, 4, 7, TRUE, '3.5L', 'Blanco Perlado'),
(47, 'Sedán', 'IJK234', 'Audi A4', 2021, 4, 5, TRUE, '2.0L', 'Negro Mythos'),
(48, 'Compacto', 'LMN567', 'Renault Sandero', 2022, 4, 5, FALSE, '1.6L', 'Rojo Fuego'),
(49, 'Camioneta', 'OPQ890', 'Nissan Pathfinder', 2021, 4, 7, TRUE, '3.5L', 'Plateado Brillante'),
(50, 'Deportivo', 'RST123', 'Lamborghini Huracán', 2023, 2, 4, TRUE, '5.2L', 'Naranja Arancio'),
(51, 'SUV', 'UVW456', 'Volvo XC90', 2022, 4, 7, TRUE, '2.0L', 'Gris Metal'),
(52, 'Sedán', 'XYZ789', 'Hyundai Elantra', 2021, 4, 5, TRUE, '2.0L', 'Blanco Crema'),
(53, 'Compacto', '123EFG', 'Ford Fiesta', 2022, 4, 5, FALSE, '1.6L', 'Negro Azabache'),
(54, 'Camioneta', '456HIJ', 'Jeep Compass', 2021, 4, 5, TRUE, '2.4L', 'Rojo Colorado'),
(55, 'Deportivo', '789KLM', 'Porsche Cayman', 2023, 2, 4, TRUE, '2.0L', 'Blanco Carrara'),
(56, 'SUV', 'ABCNOP', 'Mitsubishi Outlander', 2022, 4, 5, TRUE, '2.5L', 'Gris Plomo'),
(57, 'Compacto', 'DEFPQR', 'Kia Soul', 2021, 4, 5, FALSE, '2.0L', 'Amarillo Limón'),
(58, 'Camioneta', 'GHISTU', 'Subaru Ascent', 2023, 4, 7, TRUE, '2.4L', 'Verde Bosque'),
(59, 'Deportivo', 'VWXYZA', 'Ferrari F8 Tributo', 2020, 2, 4, TRUE, '3.9L', 'Rojo Corsa'),
(60, 'Sedán', 'BCD123', 'Mercedes-Benz E-Class', 2022, 4, 5, TRUE, '3.0L', 'Blanco Diamante'),
(61, 'SUV', 'EFG456', 'Lexus NX', 2023, 4, 5, TRUE, '2.5L', 'Gris Metálico'),
(62, 'Sedán', 'HIJ789', 'Volvo S90', 2021, 4, 5, TRUE, '2.0L', 'Azul Eléctrico'),
(63, 'Compacto', 'KLM012', 'Seat Arona', 2022, 4, 5, FALSE, '1.0L', 'Rojo Emoción'),
(64, 'Camioneta', 'NOP345', 'Land Rover Defender', 2021, 4, 7, TRUE, '2.0L', 'Verde Británico'),
(65, 'Deportivo', 'QRS678', 'Aston Martin Vantage', 2023, 2, 4, TRUE, '4.0L', 'Plata Lunar'),
(66, 'SUV', 'TUV901', 'Cadillac Escalade', 2022, 4, 7, TRUE, '6.2L', 'Negro Obsidiana'),
(67, 'Compacto', 'WXY234', 'Honda Fit', 2021, 4, 5, FALSE, '1.5L', 'Azul Cielo'),
(68, 'Camioneta', 'ZAB567', 'Toyota 4Runner', 2023, 4, 5, TRUE, '4.0L', 'Blanco Nácar'),
(69, 'Deportivo', 'CDE890', 'Nissan 370Z', 2020, 2, 4, TRUE, '3.7L', 'Rojo Carmesí'),
(70, 'Sedán', 'FGH123', 'BMW 5 Series', 2022, 4, 5, TRUE, '2.0L', 'Gris Grafito'),
(71, 'SUV', 'IJK456', 'Audi Q5', 2023, 4, 5, TRUE, '2.0L', 'Negro Mitológico'),
(72, 'Sedán', 'LMN789', 'Hyundai Sonata', 2021, 4, 5, TRUE, '2.5L', 'Blanco Crepúsculo'),
(73, 'Compacto', 'OPQ012', 'Chevrolet Spark', 2022, 4, 5, FALSE, '1.0L', 'Amarillo Primavera'),
(74, 'Camioneta', 'RST345', 'Ford Bronco', 2023, 4, 7, TRUE, '2.7L', 'Gris Carbón'),
(75, 'Deportivo', 'UVW678', 'McLaren 600LT', 2020, 2, 4, TRUE, '3.8L', 'Naranja Mantis'),
(76, 'SUV', 'XYZ901', 'Kia Sorento', 2021, 4, 7, TRUE, '3.5L', 'Blanco Perlado'),
(77, 'Compacto', '123ABC', 'Renault Clio', 2022, 4, 5, FALSE, '1.3L', 'Negro Profundo'),
(78, 'Camioneta', '456DEF', 'Jeep Renegade', 2021, 4, 5, TRUE, '1.3L', 'Rojo Colorado'),
(79, 'Deportivo', '789GHI', 'Porsche Panamera', 2023, 2, 4, TRUE, '3.0L', 'Blanco Carrara'),
(80, 'Sedán', 'JKL123', 'Toyota Avalon', 2022, 4, 5, TRUE, '3.5L', 'Gris Metálico'),
(81, 'SUV', 'MNO456', 'Subaru Outback', 2023, 4, 5, TRUE, '2.4L', 'Azul Abyss'),
(82, 'Sedán', 'PQR789', 'Infiniti Q60', 2021, 4, 5, TRUE, '3.0L', 'Rojo Dinámico'),
(83, 'Compacto', 'STU012', 'Mazda 3', 2022, 4, 5, FALSE, '2.5L', 'Gris Meteorito'),
(84, 'Camioneta', 'VWX345', 'Chevrolet Traverse', 2021, 4, 7, TRUE, '3.6L', 'Blanco Alpino'),
(85, 'Deportivo', 'YZA678', 'Ford GT', 2023, 2, 4, TRUE, '3.5L', 'Azul Liquidación'),
(86, 'SUV', 'BCD901', 'Volvo XC60', 2022, 4, 5, TRUE, '2.0L', 'Gris Sideral'),
(87, 'Compacto', 'EFG234', 'Hyundai i20', 2021, 4, 5, FALSE, '1.2L', 'Verde Oliva'),
(88, 'Camioneta', 'HIJ567', 'Jeep Grand Wagoneer', 2023, 4, 7, TRUE, '6.4L', 'Blanco Ártico'),
(89, 'Deportivo', 'KLM890', 'BMW M5', 2020, 2, 4, TRUE, '4.4L', 'Gris Space'),
(90, 'Sedán', 'NOP123', 'Mercedes-Benz A-Class', 2022, 4, 5, TRUE, '2.0L', 'Rojo Júpiter'),
(91, 'SUV', 'QRS456', 'Mazda CX-9', 2023, 4, 7, TRUE, '2.5L', 'Plata Luna'),
(92, 'Sedán', 'TUV789', 'Acura ILX', 2021, 4, 5, TRUE, '2.4L', 'Azul Ébano'),
(93, 'Compacto', 'WXY012', 'Toyota Yaris', 2022, 4, 5, FALSE, '1.5L', 'Rojo Pasión'),
(94, 'Camioneta', 'ZAB345', 'GMC Acadia', 2021, 4, 7, TRUE, '3.6L', 'Blanco Perla'),
(95, 'Deportivo', 'CDE678', 'Nissan GT-R Nismo', 2023, 2, 4, TRUE, '3.8L', 'Negro Oscuro'),
(96, 'SUV', 'FGH901', 'Honda Pilot', 2022, 4, 7, TRUE, '3.5L', 'Verde Bosque'),
(97, 'Compacto', 'IJK234', 'Kia Stonic', 2021, 4, 5, FALSE, '1.0L', 'Gris Grafito'),
(98, 'Camioneta', 'LMN567', 'Ford Expedition', 2023, 4, 7, TRUE, '3.5L', 'Azul Icono'),
(99, 'Deportivo', 'OPQ890', 'Chevrolet Corvette', 2020, 2, 4, TRUE, '6.2L', 'Rojo Torch'),
(100, 'Sedán', 'RST123', 'Lexus IS', 2022, 4, 5, TRUE, '2.0L', 'Blanco Ártico');


INSERT INTO empleados (id_empleado, id_sucursal, nombre, apellido, cedula, direccion_residencia, correo_electronico, celular) VALUES
(1, 1, 'Pedro', 'Ramírez', '6789012345', 'Calle 16 #17-18', 'pedro.ramirez@autorental.com', '3101234567'),
(2, 2, 'Luisa', 'Fernández', '7890123456', 'Carrera 19 #20-21', 'luisa.fernandez@autorental.com', '3112345678'),
(3, 3, 'Andrés', 'García', '8901234567', 'Avenida 22 #23-24', 'andres.garcia@autorental.com', '3123456789'),
(4, 4, 'Sofía', 'Hernández', '9012345678', 'Calle 25 #26-27', 'sofia.hernandez@autorental.com', '3134567890'),
(5, 5, 'Miguel', 'Torres', '0123456789', 'Carrera 28 #29-30', 'miguel.torres@autorental.com', '3145678901'),
(6, 1, 'Ana', 'López', '1234567890', 'Calle 31 #32-33', 'ana.lopez@autorental.com', '3156789012'),
(7, 2, 'Jorge', 'Martínez', '2345678901', 'Carrera 34 #35-36', 'jorge.martinez@autorental.com', '3167890123'),
(8, 3, 'María', 'Pérez', '3456789012', 'Avenida 37 #38-39', 'maria.perez@autorental.com', '3178901234'),
(9, 4, 'Carlos', 'Gómez', '4567890123', 'Calle 40 #41-42', 'carlos.gomez@autorental.com', '3189012345'),
(10, 5, 'Laura', 'Díaz', '5678901234', 'Carrera 43 #44-45', 'laura.diaz@autorental.com', '3190123456'),
(11, 1, 'Juan', 'Sanchez', '6789012345', 'Calle 46 #47-48', 'juan.sanchez@autorental.com', '3201234567'),
(12, 2, 'Ana', 'Ramírez', '7890123456', 'Carrera 49 #50-51', 'ana.ramirez@autorental.com', '3212345678'),
(13, 3, 'Javier', 'Gutierrez', '8901234567', 'Avenida 52 #53-54', 'javier.gutierrez@autorental.com', '3223456789'),
(14, 4, 'Patricia', 'López', '9012345678', 'Calle 55 #56-57', 'patricia.lopez@autorental.com', '3234567890'),
(15, 5, 'Roberto', 'Martínez', '0123456789', 'Carrera 58 #59-60', 'roberto.martinez@autorental.com', '3245678901'),
(16, 3, 'Gabriela', 'Martínez', '2345678901', 'Calle 61 #62-63', 'gabriela.martinez@autorental.com', '3256789012'),
(17, 4, 'Héctor', 'García', '3456789012', 'Carrera 64 #65-66', 'hector.garcia@autorental.com', '3267890123'),
(18, 5, 'Alejandra', 'López', '4567890123', 'Avenida 67 #68-69', 'alejandra.lopez@autorental.com', '3278901234'),
(19, 1, 'Roberto', 'Fernández', '5678901234', 'Calle 70 #71-72', 'roberto.fernandez@autorental.com', '3289012345'),
(20, 2, 'Valeria', 'Ramírez', '6789012345', 'Carrera 73 #74-75', 'valeria.ramirez@autorental.com', '3290123456'),
(21, 3, 'Diego', 'Pérez', '7890123456', 'Avenida 76 #77-78', 'diego.perez@autorental.com', '3301234567'),
(22, 4, 'Laura', 'Gómez', '8901234567', 'Calle 79 #80-81', 'laura.gomez@autorental.com', '3312345678'),
(23, 5, 'Santiago', 'Torres', '9012345678', 'Carrera 82 #83-84', 'santiago.torres@autorental.com', '3323456789'),
(24, 1, 'Daniela', 'Hernández', '0123456789', 'Avenida 85 #86-87', 'daniela.hernandez@autorental.com', '3334567890'),
(25, 2, 'Manuel', 'Díaz', '1234567890', 'Calle 88 #89-90', 'manuel.diaz@autorental.com', '3345678901'),
(26, 3, 'Carolina', 'Martín', '2345678901', 'Carrera 91 #92-93', 'carolina.martin@autorental.com', '3356789012'),
(27, 4, 'Joaquín', 'López', '3456789012', 'Avenida 94 #95-96', 'joaquin.lopez@autorental.com', '3367890123'),
(28, 5, 'Marcela', 'González', '4567890123', 'Calle 97 #98-99', 'marcela.gonzalez@autorental.com', '3378901234'),
(29, 1, 'Lucas', 'Rodríguez', '5678901234', 'Carrera 100 #101-102', 'lucas.rodriguez@autorental.com', '3389012345'),
(30, 2, 'Valentina', 'Sánchez', '6789012345', 'Avenida 103 #104-105', 'valentina.sanchez@autorental.com', '3390123456'),
(31, 3, 'Gustavo', 'Romero', '7890123456', 'Calle 106 #107-108', 'gustavo.romero@autorental.com', '3401234567'),
(32, 4, 'Fernanda', 'Gutiérrez', '8901234567', 'Carrera 109 #110-111', 'fernanda.gutierrez@autorental.com', '3412345678'),
(33, 5, 'Maximiliano', 'Gómez', '9012345678', 'Avenida 112 #113-114', 'maximiliano.gomez@autorental.com', '3423456789'),
(34, 1, 'Ana María', 'Pérez', '0123456789', 'Calle 115 #116-117', 'anamaria.perez@autorental.com', '3434567890'),
(35, 2, 'David', 'Martínez', '1234567890', 'Carrera 118 #119-120', 'david.martinez@autorental.com', '3445678901'),
(36, 3, 'Isabella', 'García', '2345678901', 'Calle 121 #122-123', 'isabella.garcia@autorental.com', '3456789012'),
(37, 4, 'Mateo', 'Suárez', '3456789012', 'Carrera 124 #125-126', 'mateo.suarez@autorental.com', '3467890123'),
(38, 5, 'Camila', 'Hernández', '4567890123', 'Avenida 127 #128-129', 'camila.hernandez@autorental.com', '3478901234'),
(39, 1, 'Sebastián', 'Martínez', '5678901234', 'Calle 130 #131-132', 'sebastian.martinez@autorental.com', '3489012345'),
(40, 2, 'Valeria', 'Gómez', '6789012345', 'Carrera 133 #134-135', 'valeria.gomez@autorental.com', '3490123456'),
(41, 3, 'Alejandro', 'López', '7890123456', 'Avenida 136 #137-138', 'alejandro.lopez@autorental.com', '3501234567'),
(42, 4, 'María José', 'Rodríguez', '8901234567', 'Calle 139 #140-141', 'mariajose.rodriguez@autorental.com', '3512345678'),
(43, 5, 'Juan Pablo', 'Díaz', '9012345678', 'Carrera 142 #143-144', 'juanpablo.diaz@autorental.com', '3523456789'),
(44, 1, 'Lucía', 'Torres', '0123456789', 'Avenida 145 #146-147', 'lucia.torres@autorental.com', '3534567890'),
(45, 2, 'Martín', 'Sánchez', '1234567890', 'Calle 148 #149-150', 'martin.sanchez@autorental.com', '3545678901'),
(46, 3, 'Valentina', 'Ramírez', '2345678901', 'Carrera 151 #152-153', 'valentina.ramirez@autorental.com', '3556789012'),
(47, 4, 'Emilio', 'Gutiérrez', '3456789012', 'Avenida 154 #155-156', 'emilio.gutierrez@autorental.com', '3567890123'),
(48, 5, 'Abril', 'Martínez', '4567890123', 'Calle 157 #158-159', 'abril.martinez@autorental.com', '3578901234'),
(49, 1, 'Felipe', 'López', '5678901234', 'Carrera 160 #161-162', 'felipe.lopez@autorental.com', '3589012345'),
(50, 2, 'Juana', 'Gómez', '6789012345', 'Avenida 163 #164-165', 'juana.gomez@autorental.com', '3590123456'),
(51, 3, 'Simón', 'Pérez', '7890123456', 'Calle 166 #167-168', 'simon.perez@autorental.com', '3601234567'),
(52, 4, 'Constanza', 'García', '8901234567', 'Carrera 169 #170-171', 'constanza.garcia@autorental.com', '3612345678'),
(53, 5, 'Benjamín', 'Hernández', '9012345678', 'Avenida 172 #173-174', 'benjamin.hernandez@autorental.com', '3623456789'),
(54, 1, 'Renata', 'Martínez', '0123456789', 'Calle 175 #176-177', 'renata.martinez@autorental.com', '3634567890'),
(55, 2, 'Tomás', 'Díaz', '1234567890', 'Carrera 178 #179-180', 'tomas.diaz@autorental.com', '3645678901'),
(56, 3, 'Isabel', 'Gómez', '2345678901', 'Avenida 181 #182-183', 'isabel.gomez@autorental.com', '3656789012'),
(57, 4, 'Lucas', 'Rodríguez', '3456789012', 'Calle 184 #185-186', 'lucas.rodriguez@autorental.com', '3667890123'),
(58, 5, 'Valentina', 'Sánchez', '4567890123', 'Carrera 187 #188-189', 'valentina.sanchez@autorental.com', '3678901234'),
(59, 1, 'Santiago', 'Romero', '5678901234', 'Avenida 190 #191-192', 'santiago.romero@autorental.com', '3689012345'),
(60, 2, 'Mariana', 'Gutiérrez', '6789012345', 'Calle 193 #194-195', 'mariana.gutierrez@autorental.com', '3690123456'),
(61, 3, 'Julián', 'López', '7890123456', 'Carrera 196 #197-198', 'julian.lopez@autorental.com', '3701234567'),
(62, 4, 'Daniela', 'Martínez', '8901234567', 'Avenida 199 #200-201', 'daniela.martinez@autorental.com', '3712345678'),
(63, 5, 'Martín', 'Sánchez', '9012345678', 'Calle 202 #203-204', 'martin.sanchez@autorental.com', '3723456789'),
(64, 1, 'Abril', 'Gómez', '0123456789', 'Carrera 205 #206-207', 'abril.gomez@autorental.com', '3734567890'),
(65, 2, 'Felipe', 'Pérez', '1234567890', 'Avenida 208 #209-210', 'felipe.perez@autorental.com', '3745678901'),
(66, 3, 'Camila', 'Ramírez', '2345678901', 'Calle 211 #212-213', 'camila.ramirez@autorental.com', '3756789012'),
(67, 4, 'Luis', 'González', '3456789012', 'Carrera 214 #215-216', 'luis.gonzalez@autorental.com', '3767890123'),
(68, 5, 'Valentina', 'López', '4567890123', 'Avenida 217 #218-219', 'valentina.lopez@autorental.com', '3778901234'),
(69, 1, 'Matías', 'Martínez', '5678901234', 'Calle 220 #221-222', 'matias.martinez@autorental.com', '3789012345'),
(70, 2, 'Gabriela', 'Gómez', '6789012345', 'Carrera 223 #224-225', 'gabriela.gomez@autorental.com', '3790123456'),
(71, 3, 'Andrés', 'Pérez', '7890123456', 'Avenida 226 #227-228', 'andres.perez@autorental.com', '3801234567'),
(72, 4, 'María', 'Sánchez', '8901234567', 'Calle 229 #230-231', 'maria.sanchez@autorental.com', '3812345678'),
(73, 5, 'Juan', 'Gutiérrez', '9012345678', 'Carrera 232 #233-234', 'juan.gutierrez@autorental.com', '3823456789'),
(74, 1, 'Lucía', 'Martínez', '0123456789', 'Avenida 235 #236-237', 'lucia.martinez@autorental.com', '3834567890'),
(75, 2, 'Diego', 'Hernández', '1234567890', 'Calle 238 #239-240', 'diego.hernandez@autorental.com', '3845678901'),
(76, 3, 'Sofía', 'López', '2345678901', 'Carrera 241 #242-243', 'sofia.lopez@autorental.com', '3856789012'),
(77, 4, 'Mateo', 'Ramírez', '3456789012', 'Avenida 244 #245-246', 'mateo.ramirez@autorental.com', '3867890123'),
(78, 5, 'Valeria', 'Gómez', '4567890123', 'Calle 247 #248-249', 'valeria.gomez@autorental.com', '3878901234'),
(79, 1, 'Lucas', 'Pérez', '5678901234', 'Carrera 250 #251-252', 'lucas.perez@autorental.com', '3889012345'),
(80, 2, 'Isabella', 'Martínez', '6789012345', 'Avenida 253 #254-255', 'isabella.martinez@autorental.com', '3890123456'),
(81, 3, 'Joaquín', 'García', '7890123456', 'Calle 256 #257-258', 'joaquin.garcia@autorental.com', '3901234567'),
(82, 4, 'Valentina', 'Gutiérrez', '8901234567', 'Carrera 259 #260-261', 'valentina.gutierrez@autorental.com', '3912345678'),
(83, 5, 'Martín', 'López', '9012345678', 'Avenida 262 #263-264', 'martin.lopez@autorental.com', '3923456789'),
(84, 1, 'Abril', 'Hernández', '0123456789', 'Calle 265 #266-267', 'abril.hernandez@autorental.com', '3934567890'),
(85, 2, 'Diego', 'Gómez', '1234567890', 'Carrera 268 #269-270', 'diego.gomez@autorental.com', '3945678901'),
(86, 3, 'Sara', 'Martínez', '2345678901', 'Avenida 271 #272-273', 'sara.martinez@autorental.com', '3956789012'),
(87, 4, 'Javier', 'Sánchez', '3456789012', 'Calle 274 #275-276', 'javier.sanchez@autorental.com', '3967890123'),
(88, 5, 'María José', 'Pérez', '4567890123', 'Carrera 277 #278-279', 'mariajose.perez@autorental.com', '3978901234'),
(89, 1, 'Carlos', 'Gómez', '5678901234', 'Avenida 280 #281-282', 'carlos.gomez@autorental.com', '3989012345'),
(90, 2, 'Ana', 'Ramírez', '6789012345', 'Calle 283 #284-285', 'ana.ramirez@autorental.com', '3990123456'),
(91, 3, 'Jorge', 'Hernández', '7890123456', 'Carrera 286 #287-288', 'jorge.hernandez@autorental.com', '4001234567'),
(92, 4, 'Valentina', 'García', '8901234567', 'Avenida 289 #290-291', 'valentina.garcia@autorental.com', '4012345678'),
(93, 5, 'Lucas', 'López', '9012345678', 'Calle 292 #293-294', 'lucas.lopez@autorental.com', '4023456789'),
(94, 1, 'Isabella', 'Martínez', '0123456789', 'Carrera 295 #296-297', 'isabella.martinez@autorental.com', '4034567890'),
(95, 2, 'Santiago', 'Gómez', '1234567890', 'Avenida 298 #299-300', 'santiago.gomez@autorental.com', '4045678901'),
(96, 3, 'Valeria', 'Pérez', '2345678901', 'Calle 301 #302-303', 'valeria.perez@autorental.com', '4056789012'),
(97, 4, 'Julián', 'Ramírez', '3456789012', 'Carrera 304 #305-306', 'julian.ramirez@autorental.com', '4067890123'),
(98, 5, 'Renata', 'Gutiérrez', '4567890123', 'Avenida 307 #308-309', 'renata.gutierrez@autorental.com', '4078901234'),
(99, 1, 'Martín', 'López', '5678901234', 'Calle 310 #311-312', 'martin.lopez@autorental.com', '4089012345'),
(100, 2, 'Abril', 'Martínez', '6789012345', 'Carrera 313 #314-315', 'abril.martinez@autorental.com', '4090123456');


INSERT INTO alquileres (id_alquiler, id_vehiculo, id_cliente, id_empleado, id_sucursal_salida, id_sucursal_entrada, fecha_salida, fecha_entrada, fecha_esperada_llegada, valor_semana, valor_dia, porcentaje_descuento, valor_cotizado, valor_pagado)
VALUES
(1, 1, 1, 1, 1, 2, '2024-06-01', '2024-06-08', '2024-06-07', 700.00, 100.00, 10.00, 800.00, 720.00),
(2, 2, 2, 2, 2, 3, '2024-06-02', '2024-06-10', '2024-06-09', 600.00, 90.00, 5.00, 720.00, 684.00),
(3, 3, 3, 3, 3, 4, '2024-06-03', '2024-06-12', '2024-06-11', 900.00, 130.00, 15.00, 1040.00, 884.00),
(4, 4, 4, 4, 4, 5, '2024-06-04', '2024-06-11', '2024-06-10', 1200.00, 170.00, 20.00, 1370.00, 1096.00),
(5, 5, 5, 5, 5, 1, '2024-06-05', '2024-06-12', '2024-06-11', 800.00, 110.00, 10.00, 990.00, 891.00),
(6, 6, 6, 6, 1, 2, '2024-06-06', '2024-06-13', '2024-06-12', 650.00, 95.00, 5.00, 780.00, 741.00),
(7, 7, 7, 7, 2, 3, '2024-06-07', '2024-06-14', '2024-06-13', 900.00, 120.00, 15.00, 1080.00, 918.00),
(8, 8, 8, 8, 3, 4, '2024-06-08', '2024-06-15', '2024-06-14', 1100.00, 150.00, 20.00, 1250.00, 1125.00),
(9, 9, 9, 9, 4, 5, '2024-06-09', '2024-06-16', '2024-06-15', 950.00, 130.00, 10.00, 1080.00, 972.00),
(10, 10, 10, 10, 5, 1, '2024-06-10', '2024-06-17', '2024-06-16', 850.00, 120.00, 5.00, 1020.00, 969.00),
(11, 11, 11, 11, 1, 2, '2024-06-11', '2024-06-18', '2024-06-17', 700.00, 100.00, 10.00, 800.00, 720.00),
(12, 12, 12, 12, 2, 3, '2024-06-12', '2024-06-19', '2024-06-18', 600.00, 90.00, 5.00, 720.00, 684.00),
(13, 13, 13, 13, 3, 4, '2024-06-13', '2024-06-20', '2024-06-19', 900.00, 130.00, 15.00, 1040.00, 884.00),
(14, 14, 14, 14, 4, 5, '2024-06-14', '2024-06-21', '2024-06-20', 1200.00, 170.00, 20.00, 1370.00, 1096.00),
(15, 15, 15, 15, 5, 1, '2024-06-15', '2024-06-22', '2024-06-21', 1000.00, 140.00, 10.00, 1140.00, 1026.00),
(16, 16, 16, 16, 1, 2, '2024-06-16', '2024-06-23', '2024-06-22', 850.00, 120.00, 5.00, 1020.00, 969.00),
(17, 17, 17, 17, 2, 3, '2024-06-17', '2024-06-24', '2024-06-23', 800.00, 110.00, 10.00, 970.00, 913.60),
(18, 18, 18, 18, 3, 4, '2024-06-18', '2024-06-25', '2024-06-24', 1000.00, 140.00, 15.00, 1180.00, 1003.60),
(19, 19, 19, 19, 4, 5, '2024-06-19', '2024-06-26', '2024-06-25', 1300.00, 180.00, 20.00, 1540.00, 1309.60),
(20, 20, 20, 20, 5, 1, '2024-06-20', '2024-06-27', '2024-06-26', 1100.00, 150.00, 10.00, 1250.00, 1125.00),
(21, 21, 21, 21, 1, 2, '2024-06-21', '2024-06-28', '2024-06-27', 900.00, 120.00, 5.00, 1080.00, 1020.60),
(22, 22, 22, 22, 2, 3, '2024-06-22', '2024-06-29', '2024-06-28', 800.00, 110.00, 10.00, 970.00, 913.60),
(23, 23, 23, 23, 3, 4, '2024-06-23', '2024-06-30', '2024-06-29', 1200.00, 160.00, 15.00, 1420.00, 1217.60),
(24, 24, 24, 24, 4, 5, '2024-06-24', '2024-07-01', '2024-06-30', 1500.00, 200.00, 20.00, 1780.00, 1527.20),
(25, 25, 25, 25, 5, 1, '2024-06-25', '2024-07-02', '2024-07-01', 1300.00, 180.00, 10.00, 1480.00, 1339.20),
(26, 26, 91, 26, 1, 2, '2024-06-26', '2024-07-03', '2024-07-02', 1100.00, 150.00, 5.00, 1240.00, 1172.00),
(27, 27, 27, 27, 2, 3, '2024-06-27', '2024-07-04', '2024-07-03', 950.00, 130.00, 10.00, 1080.00, 972.00),
(28, 28, 28, 28, 3, 4, '2024-06-28', '2024-07-05', '2024-07-04', 850.00, 120.00, 5.00, 1020.00, 969.00),
(29, 29, 29, 29, 4, 5, '2024-06-29', '2024-07-06', '2024-07-05', 750.00, 100.00, 10.00, 850.00, 765.00),
(30, 30, 30, 30, 5, 1, '2024-06-30', '2024-07-07', '2024-07-06', 700.00, 90.00, 5.00, 770.00, 731.60),
(31, 31, 31, 31, 1, 2, '2024-07-01', '2024-07-08', '2024-07-07', 600.00, 80.00, 5.00, 680.00, 646.40),
(32, 32, 32, 32, 2, 3, '2024-07-02', '2024-07-09', '2024-07-08', 850.00, 110.00, 10.00, 970.00, 873.20),
(33, 33, 33, 33, 3, 4, '2024-07-03', '2024-07-10', '2024-07-09', 1000.00, 130.00, 15.00, 1180.00, 1003.60),
(34, 34, 34, 34, 4, 5, '2024-07-04', '2024-07-11', '2024-07-10', 1200.00, 150.00, 20.00, 1440.00, 1224.00),
(35, 35, 35, 35, 5, 1, '2024-07-05', '2024-07-12', '2024-07-11', 1100.00, 140.00, 10.00, 1250.00, 1125.00),
(36, 36, 36, 36, 1, 2, '2024-07-06', '2024-07-13', '2024-07-12', 950.00, 120.00, 5.00, 1080.00, 1026.00),
(37, 37, 37, 37, 2, 3, '2024-07-07', '2024-07-14', '2024-07-13', 800.00, 100.00, 10.00, 900.00, 828.00),
(38, 38, 38, 38, 3, 4, '2024-07-08', '2024-07-15', '2024-07-14', 700.00, 90.00, 5.00, 770.00, 731.60),
(39, 39, 39, 39, 4, 5, '2024-07-09', '2024-07-16', '2024-07-15', 600.00, 80.00, 10.00, 680.00, 612.00),
(40, 40, 40, 40, 5, 1, '2024-07-10', '2024-07-17', '2024-07-16', 850.00, 110.00, 15.00, 1010.00, 808.00),
(41, 41, 41, 41, 1, 2, '2024-07-11', '2024-07-18', '2024-07-17', 1000.00, 130.00, 20.00, 1320.00, 1188.00),
(42, 42, 42, 42, 2, 3, '2024-07-12', '2024-07-19', '2024-07-18', 1200.00, 160.00, 10.00, 1360.00, 1228.00),
(43, 43, 43, 43, 3, 4, '2024-07-13', '2024-07-20', '2024-07-19', 1400.00, 180.00, 5.00, 1580.00, 1491.60),
(44, 44, 44, 44, 4, 5, '2024-07-14', '2024-07-21', '2024-07-20', 1600.00, 200.00, 10.00, 1780.00, 1602.00),
(45, 45, 45, 45, 5, 1, '2024-07-15', '2024-07-22', '2024-07-21', 1800.00, 220.00, 15.00, 2060.00, 1854.00),
(46, 46, 46, 46, 1, 2, '2024-07-16', '2024-07-23', '2024-07-22', 2000.00, 240.00, 20.00, 2400.00, 1920.00),
(47, 47, 47, 47, 2, 3, '2024-07-17', '2024-07-24', '2024-07-23', 2200.00, 260.00, 10.00, 2460.00, 2214.00),
(48, 48, 48, 48, 3, 4, '2024-07-18', '2024-07-25', '2024-07-24', 2400.00, 280.00, 5.00, 2640.00, 2376.00),
(49, 49, 49, 49, 4, 5, '2024-07-19', '2024-07-26', '2024-07-25', 2600.00, 300.00, 10.00, 2900.00, 2610.00),
(50, 50, 91, 50, 5, 1, '2024-07-20', '2024-07-27', '2024-07-26', 2800.00, 320.00, 15.00, 3200.00, 2720.00),
(51, 51, 51, 51, 1, 2, '2024-07-21', '2024-07-28', '2024-07-27', 3000.00, 340.00, 20.00, 3600.00, 2880.00),
(52, 52, 52, 52, 2, 3, '2024-07-22', '2024-07-29', '2024-07-28', 3200.00, 360.00, 10.00, 3560.00, 3204.00),
(53, 53, 53, 53, 3, 4, '2024-07-23', '2024-07-30', '2024-07-29', 3400.00, 380.00, 5.00, 3740.00, 3366.00),
(54, 54, 54, 54, 4, 5, '2024-07-24', '2024-07-31', '2024-07-30', 3600.00, 400.00, 10.00, 4000.00, 3600.00),
(55, 55, 55, 55, 5, 1, '2024-07-25', '2024-08-01', '2024-07-31', 3800.00, 420.00, 15.00, 4380.00, 3723.00),
(56, 56, 56, 56, 1, 2, '2024-07-26', '2024-08-02', '2024-08-01', 4000.00, 440.00, 20.00, 4800.00, 3840.00),
(57, 57, 57, 57, 2, 3, '2024-07-27', '2024-08-03', '2024-08-02', 4200.00, 460.00, 10.00, 4660.00, 4194.00),
(58, 58, 58, 58, 3, 4, '2024-07-28', '2024-08-04', '2024-08-03', 4400.00, 480.00, 5.00, 4840.00, 4356.00),
(59, 59, 59, 59, 4, 5, '2024-07-29', '2024-08-05', '2024-08-04', 4600.00, 500.00, 10.00, 5100.00, 4590.00),
(60, 60, 60, 60, 5, 1, '2024-07-30', '2024-08-06', '2024-08-05', 4800.00, 520.00, 15.00, 5520.00, 4692.00),
(61, 61, 61, 61, 1, 2, '2024-07-31', '2024-08-07', '2024-08-06', 5000.00, 540.00, 20.00, 6000.00, 4800.00),
(62, 62, 62, 62, 2, 3, '2024-08-01', '2024-08-08', '2024-08-07', 5200.00, 560.00, 10.00, 5760.00, 5184.00),
(63, 63, 63, 63, 3, 4, '2024-08-02', '2024-08-09', '2024-08-08', 5400.00, 580.00, 5.00, 5940.00, 5346.00),
(64, 64, 64, 64, 4, 5, '2024-08-03', '2024-08-10', '2024-08-09', 5600.00, 600.00, 10.00, 6200.00, 5580.00),
(65, 65, 65, 65, 5, 1, '2024-08-04', '2024-08-11', '2024-08-10', 5800.00, 620.00, 15.00, 6700.00, 5695.00),
(66, 66, 66, 66, 1, 2, '2024-08-05', '2024-08-12', '2024-08-11', 6000.00, 640.00, 20.00, 7200.00, 5760.00),
(67, 67, 91, 67, 2, 3, '2024-08-06', '2024-08-13', '2024-08-12', 6200.00, 660.00, 10.00, 6860.00, 6174.00),
(68, 68, 68, 68, 3, 4, '2024-08-07', '2024-08-14', '2024-08-13', 6400.00, 680.00, 5.00, 7040.00, 6336.00),
(69, 69, 69, 69, 4, 5, '2024-08-08', '2024-08-15', '2024-08-14', 6600.00, 700.00, 10.00, 7300.00, 6570.00),
(70, 70, 70, 70, 5, 1, '2024-08-09', '2024-08-16', '2024-08-15', 6800.00, 720.00, 15.00, 7820.00, 6646.00),
(71, 71, 71, 71, 1, 2, '2024-08-10', '2024-08-17', '2024-08-16', 7000.00, 740.00, 20.00, 8400.00, 6720.00),
(72, 72, 72, 72, 2, 3, '2024-08-11', '2024-08-18', '2024-08-17', 7200.00, 760.00, 10.00, 7980.00, 7182.00),
(73, 73, 73, 73, 3, 4, '2024-08-12', '2024-08-19', '2024-08-18', 7400.00, 780.00, 5.00, 8120.00, 7308.00),
(74, 74, 74, 74, 4, 5, '2024-08-13', '2024-08-20', '2024-08-19', 7600.00, 800.00, 10.00, 8400.00, 7560.00),
(75, 75, 75, 75, 5, 1, '2024-08-14', '2024-08-21', '2024-08-20', 7800.00, 820.00, 15.00, 8980.00, 7633.00),
(76, 76, 76, 76, 1, 2, '2024-08-15', '2024-08-22', '2024-08-21', 8000.00, 840.00, 20.00, 9600.00, 7680.00),
(77, 77, 77, 77, 2, 3, '2024-08-16', '2024-08-23', '2024-08-22', 8200.00, 860.00, 10.00, 9020.00, 8118.00),
(78, 78, 78, 78, 3, 4, '2024-08-17', '2024-08-24', '2024-08-23', 8400.00, 880.00, 5.00, 9240.00, 8316.00),
(79, 79, 79, 79, 4, 5, '2024-08-18', '2024-08-25', '2024-08-24', 8600.00, 900.00, 10.00, 9500.00, 8550.00),
(80, 80, 80, 80, 5, 1, '2024-08-19', '2024-08-26', '2024-08-25', 8800.00, 920.00, 15.00, 10100.00, 8588.00),
(81, 81, 81, 81, 1, 2, '2024-08-20', '2024-08-27', '2024-08-26', 9000.00, 940.00, 20.00, 10800.00, 8640.00),
(82, 82, 82, 82, 2, 3, '2024-08-21', '2024-08-28', '2024-08-27', 9200.00, 960.00, 10.00, 10160.00, 9144.00),
(83, 83, 83, 83, 3, 4, '2024-08-22', '2024-08-29', '2024-08-28', 9400.00, 980.00, 5.00, 10340.00, 9306.00),
(84, 84, 84, 84, 4, 5, '2024-08-23', '2024-08-30', '2024-08-29', 9600.00, 1000.00, 10.00, 10600.00, 9540.00),
(85, 85, 85, 85, 5, 1, '2024-08-24', '2024-08-31', '2024-08-30', 9800.00, 1020.00, 15.00, 11300.00, 9618.00),
(86, 86, 86, 86, 1, 2, '2024-08-25', '2024-09-01', '2024-08-31', 10000.00, 1040.00, 20.00, 12000.00, 9600.00),
(87, 87, 87, 87, 2, 3, '2024-08-26', '2024-09-02', '2024-09-01', 10200.00, 1060.00, 10.00, 11260.00, 10134.00),
(88, 88, 88, 88, 3, 4, '2024-08-27', '2024-09-03', '2024-09-02', 10400.00, 1080.00, 5.00, 11460.00, 10314.00),
(89, 89, 89, 89, 4, 5, '2024-08-28', '2024-09-04', '2024-09-03', 10600.00, 1100.00, 10.00, 11710.00, 10590.00),
(90, 90, 90, 90, 5, 1, '2024-08-29', '2024-09-05', '2024-09-04', 10800.00, 1120.00, 15.00, 12420.00, 10536.00),
(91, 91, 91, 91, 1, 2, '2024-08-30', '2024-09-06', '2024-09-05', 11000.00, 1140.00, 20.00, 13200.00, 9600.00),
(92, 92, 92, 92, 2, 3, '2024-08-31', '2024-09-07', '2024-09-06', 11200.00, 1160.00, 10.00, 12370.00, 11106.00),
(93, 93, 93, 93, 3, 4, '2024-09-01', '2024-09-08', '2024-09-07', 11400.00, 1180.00, 5.00, 12580.00, 11322.00),
(94, 94, 94, 94, 4, 5, '2024-09-02', '2024-09-09', '2024-09-08', 11600.00, 1200.00, 10.00, 12810.00, 11529.00),
(95, 95, 95, 95, 5, 1, '2024-09-03', '2024-09-10', '2024-09-09', 11800.00, 1220.00, 15.00, 13630.00, 11514.00),
(96, 96, 96, 96, 1, 2, '2024-09-04', '2024-09-11', '2024-09-10', 12000.00, 1240.00, 20.00, 14400.00, 9600.00),
(97, 97, 91, 97, 2, 3, '2024-09-05', '2024-09-12', '2024-09-11', 12200.00, 1260.00, 10.00, 13470.00, 12123.00),
(98, 98, 98, 98, 3, 4, '2024-09-06', '2024-09-13', '2024-09-12', 12400.00, 1280.00, 5.00, 13690.00, 12318.00),
(99, 99, 99, 99, 4, 5, '2024-09-07', '2024-09-14', '2024-09-13', 12600.00, 1300.00, 10.00, 13910.00, 12519.00),
(100, 100, 100, 100, 5, 1, '2024-09-08', '2024-09-15', '2024-09-14', 12800.00, 1320.00, 15.00, 14730.00, 12597.00);




-- se crea persona cliente y empleado
create user 'cliente'@'%' identified by 'cliente123';
create user 'empleado'@'%' identified by 'empleado123';


-- permisos clientes depedendiento de las consultas que el ´puede hacer 
GRANT SELECT ON laboratorioTaller.vehiculos TO 'cliente'@'%';
GRANT SELECT ON laboratorioTaller.alquileres TO 'cliente'@'%';
GRANT SELECT ON laboratorioTaller.clientes TO 'cliente'@'%';
GRANT SELECT ON laboratorioTaller.empleados to 'cliente'@'%';

-- permisos de empleado depedendiendo de las cnsultas que el puede hacer 
GRANT SELECT, INSERT, UPDATE ON laboratorioTaller.sucursales TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON laboratorioTaller.empleados TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON laboratorioTaller.clientes TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON laboratorioTaller.vehiculos TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON laboratorioTaller.alquileres TO 'empleado'@'%';

-- ##########################################
-- ############ Consultas ###################
-- ##########################################

-- Consulta de disponibilidad de vehículos para alquiler por tipo de vehículo, rango de
-- precios de alquiler y fechas de disponibilidad.


-- ##########################################
-- ########## Consultas clientes ############
-- ##########################################

SELECT v.id_vehiculo, v.tipo_vehiculo, v.placa, v.referencia, v.modelo, v.color, a.valor_semana, a.valor_dia
FROM vehiculos v
LEFT JOIN alquileres a ON v.id_vehiculo = a.id_vehiculo
WHERE (a.fecha_salida IS NULL OR a.fecha_entrada < CURDATE())
AND v.tipo_vehiculo = 'Sedán'
AND a.valor_semana BETWEEN 500 AND 1000
AND CURDATE() BETWEEN '2024-06-01' AND '2024-06-30';


-- • Alquiler de vehículos.

select *
from alquileres;



-- • Consulta de historial de alquileres.

SELECT id_alquiler, fecha_entrada, fecha_salida, valor_pagado
FROM alquileres
WHERE id_cliente = 91;

-- Cliente puede mirar todos los vehículos
SELECT *
FROM vehiculos
ORDER BY referencia;

-- Cliente puede mirar su historial de alquileres con total y fechas
SELECT a.*, 
       SUM(valor_pagado) AS total_pagado
FROM alquileres a
WHERE a.id_cliente = id_cliente
GROUP BY a.id_alquiler, a.fecha_salida, a.fecha_entrada, a.fecha_esperada_llegada,
         a.valor_semana, a.valor_dia, a.porcentaje_descuento, a.valor_cotizado;

-- Cliente puede mirar las especificaciones de un carro con el nombre del carro
SELECT *
FROM vehiculos
WHERE referencia = nombre_carro;

-- Cliente puede mirar los empleados disponibles para solicitar ayuda en la sucursal que necesita
SELECT e.id_empleado, e.nombre, e.apellido, e.correo_electronico, e.celular
FROM empleados e
WHERE e.id_sucursal = id_sucursal;

-- ##########################################
-- ########## Consultas empleados ###########
-- ##########################################

-- Empleado puede mirar historial de empleados por sucursal
SELECT e.*
FROM empleados e
WHERE e.id_sucursal = :id_sucursal;

-- Empleado puede mirar historial de alquileres por sucursal
SELECT a.*
FROM alquileres a
WHERE a.id_sucursal_salida = :id_sucursal
   OR a.id_sucursal_entrada = :id_sucursal;

-- Empleado puede mirar todos los carros ordenados alfabéticamente
SELECT *
FROM vehiculos
ORDER BY referencia;

-- Empleado puede mirar las veces que un empleado ha estado involucrado con un alquiler
SELECT e.id_empleado, e.nombre, e.apellido, COUNT(a.id_alquiler) AS num_alquileres
FROM empleados e
JOIN alquileres a ON e.id_empleado = a.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido;

-- Empleado puede mirar los alquileres donde se pagó menos de lo cotizado
SELECT *
FROM alquileres
WHERE valor_pagado < valor_cotizado;




-- #################################
-- ####### Funciones ###############
-- #################################

DELIMITER //

CREATE FUNCTION calcular_valor_cotizado(tipo_vehiculo VARCHAR(50), dias INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE valor_semana DECIMAL(10,2);
    DECLARE valor_dia DECIMAL(10,2);
    DECLARE semanas INT;
    DECLARE dias_extras INT;
    DECLARE valor_total DECIMAL(10,2);

    SELECT valor_semana, valor_dia INTO valor_semana, valor_dia
    FROM vehiculos v
    JOIN alquileres a ON v.id_vehiculo = a.id_vehiculo
    WHERE v.tipo_vehiculo = tipo_vehiculo
    LIMIT 1;

    SET semanas = FLOOR(dias / 7);
    SET dias_extras = dias % 7;

    SET valor_total = (semanas * valor_semana) + (dias_extras * valor_dia);

    RETURN valor_total;
END //

DELIMITER ;

-- Funcionn #2

DELIMITER //

CREATE FUNCTION calcular_valor_pagado(fecha_devolucion DATE, fecha_esperada_llegada DATE, valor_cotizado DECIMAL(10,2), valor_dia DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE dias_retraso INT;
    DECLARE valor_extra DECIMAL(10,2);

    IF fecha_devolucion > fecha_esperada_llegada THEN
        SET dias_retraso = DATEDIFF(fecha_devolucion, fecha_esperada_llegada);
        SET valor_extra = dias_retraso * valor_dia * 1.08;
        RETURN valor_cotizado + valor_extra;
    ELSE
        RETURN valor_cotizado;
    END IF;
END //






-- #################################
-- ####### Procedimiento ###########
-- #################################



DELIMITER // 

  

CREATE PROCEDURE registrar_alquiler( 

    IN p_id_alquiler INT, 

    IN p_id_vehiculo INT, 

    IN p_id_cliente INT, 

    IN p_id_empleado INT, 

    IN p_id_sucursal_salida INT, 

    IN p_id_sucursal_entrada INT, 

    IN p_fecha_salida DATE, 

    IN p_fecha_entrada DATE, 

    IN p_fecha_esperada_llegada DATE, 

    IN p_valor_semana DECIMAL(10,2), 

    IN p_valor_dia DECIMAL(10,2), 

    IN p_porcentaje_descuento DECIMAL(5,2), 

    IN p_valor_cotizado DECIMAL(10,2), 

    IN p_valor_pagado DECIMAL(10,2) 

) 

BEGIN 

    INSERT INTO alquileres ( 

        id_alquiler, id_vehiculo, id_cliente, id_empleado, id_sucursal_salida, 

        id_sucursal_entrada, fecha_salida, fecha_entrada, fecha_esperada_llegada, 

        valor_semana, valor_dia, porcentaje_descuento, valor_cotizado, valor_pagado 

    ) 

    VALUES ( 

        p_id_alquiler, p_id_vehiculo, p_id_cliente, p_id_empleado, p_id_sucursal_salida, 

        p_id_sucursal_entrada, p_fecha_salida, p_fecha_entrada, p_fecha_esperada_llegada, 

        p_valor_semana, p_valor_dia, p_porcentaje_descuento, p_valor_cotizado, p_valor_pagado 

    ); 

END // 

  

DELIMITER ; 

 
 
-- #################################
-- ########### Eventos #############
-- #################################



 DELIMITER // 

  

CREATE EVENT actualizar_estado_alquileres_vencidos 

ON SCHEDULE EVERY 1 DAY 

STARTS '2024-07-01 00:00:00' 

DO 

BEGIN 

    UPDATE alquileres 

    SET valor_pagado = valor_pagado + (DATEDIFF(CURDATE(), fecha_esperada_llegada) * valor_dia * 1.08) 

    WHERE fecha_esperada_llegada < CURDATE() AND fecha_entrada IS NULL; 

END // 

  

DELIMITER ; 



-- Triggers y eventos 

-- Trigger 

-- Tabla verificacion

DELIMITER $$

DROP TRIGGER IF EXISTS trigger_check_modelo_before$$

CREATE TRIGGER trigger_check_modelo_before
BEFORE INSERT 
ON vehiculos FOR EACH ROW
BEGIN 
    IF NEW.modelo < 2012 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El modelo no puede ser anterior a 2012.';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

DROP TRIGGER IF EXISTS trigger_check_modelo_before$$

CREATE TRIGGER trigger_check_modelo_before
BEFORE update 
ON vehiculos FOR EACH ROW
BEGIN 
    IF NEW.modelo < 2012 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El modelo no puede ser anterior a 2012.';
    END IF;
END$$

DELIMITER ;

INSERT INTO vehiculos (id_vehiculo, tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) 
VALUES (102, 'Sedán', 'HIJ789', 'Volvo S90', 2010, 4, 5, TRUE, '2.0L', 'Azul Eléctrico');

INSERT INTO vehiculos (id_vehiculo, tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) 
VALUES (101, 'SUV', 'EFG456', 'Lexus NX', 2009, 4, 5, TRUE, '2.5L', 'Gris Metálico');






-- trigger para poner el la tabla de log el cambio de celular que han hecho los clientes

CREATE TABLE log_cambios_celular (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_celular VARCHAR(100),
    new_celular VARCHAR(100)
);

DELIMITER $$

DROP TRIGGER IF EXISTS trigger_guardar_celular_after_update$$

CREATE TRIGGER trigger_guardar_celular_after_update
AFTER UPDATE ON clientes
FOR EACH ROW
BEGIN
    IF OLD.celular <> NEW.celular THEN
        INSERT INTO log_cambios_celular (id_cliente, old_celular, new_celular)
        VALUES (OLD.id_cliente, OLD.celular, NEW.celular);
    END IF;
END$$

DELIMITER ;

select * from log_cambios_celular;
select * from clientes;

INSERT INTO clientes (id_cliente, nombre, apellido, cedula, direccion_residencia, ciudad_residencia, celular)
VALUES (101, 'Juan', 'Perez', '123456789', 'Calle 123', 'Ciudad ABC', '0987654321');

INSERT INTO clientes (id_cliente, nombre, apellido, cedula, direccion_residencia, ciudad_residencia, celular)
VALUES (102, 'Maria', 'Gomez', '987654321', 'Av. Principal', 'Ciudad XYZ', '9876543210');

UPDATE clientes 
SET celular = '114275233' 
WHERE id_cliente = 102;



