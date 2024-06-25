create database laboratorio;
use laboratorio;

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
    placa VARCHAR(15) NOT NULL,
    referencia VARCHAR(50) NOT NULL,
    modelo INT NOT NULL,
    puertas INT NOT NULL,
    capacidad INT NOT NULL,
    sunroof BOOLEAN NOT NULL,
    motor VARCHAR(20) NOT NULL,
    color VARCHAR(30) NOT NULL
);

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


INSERT INTO clientes (id_cliente, nombre, apellido, cedula, direccion_residencia, ciudad_residencia, celular) VALUES
(1, 'Juan', 'Pérez', '1234567890', 'Calle 1 #2-3', 'Bogotá', '3001234567'),
(2, 'María', 'Gómez', '2345678901', 'Carrera 4 #5-6', 'Medellín', '3012345678'),
(3, 'Carlos', 'López', '3456789012', 'Avenida 7 #8-9', 'Cali', '3023456789'),
(4, 'Ana', 'Martínez', '4567890123', 'Calle 10 #11-12', 'Barranquilla', '3034567890'),
(5, 'Luis', 'Rodríguez', '5678901234', 'Carrera 13 #14-15', 'Cartagena', '3045678901');


INSERT INTO vehiculos (id_vehiculo, tipo_vehiculo, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color) VALUES
(1, 'Sedán', 'ABC123', 'Toyota Corolla', 2022, 4, 5, TRUE, '1.8L', 'Rojo'),
(2, 'Compacto', 'DEF456', 'Hyundai i10', 2021, 4, 5, FALSE, '1.2L', 'Blanco'),
(3, 'Camioneta', 'GHI789', 'Ford Ranger', 2023, 4, 5, TRUE, '2.3L', 'Negro'),
(4, 'Deportivo', 'JKL012', 'Chevrolet Camaro', 2020, 2, 4, TRUE, '3.6L', 'Amarillo'),
(5, 'SUV', 'MNO345', 'Honda CR-V', 2022, 4, 7, TRUE, '2.4L', 'Azul');


INSERT INTO empleados (id_empleado, id_sucursal, nombre, apellido, cedula, direccion_residencia, correo_electronico, celular) VALUES
(1, 1, 'Pedro', 'Ramírez', '6789012345', 'Calle 16 #17-18', 'pedro.ramirez@autorental.com', '3101234567'),
(2, 2, 'Luisa', 'Fernández', '7890123456', 'Carrera 19 #20-21', 'luisa.fernandez@autorental.com', '3112345678'),
(3, 3, 'Andrés', 'García', '8901234567', 'Avenida 22 #23-24', 'andres.garcia@autorental.com', '3123456789'),
(4, 4, 'Sofía', 'Hernández', '9012345678', 'Calle 25 #26-27', 'sofia.hernandez@autorental.com', '3134567890'),
(5, 5, 'Miguel', 'Torres', '0123456789', 'Carrera 28 #29-30', 'miguel.torres@autorental.com', '3145678901');


INSERT INTO alquileres (id_alquiler, id_vehiculo, id_cliente, id_empleado, id_sucursal_salida, id_sucursal_entrada, fecha_salida, fecha_entrada, fecha_esperada_llegada, valor_semana, valor_dia, porcentaje_descuento, valor_cotizado, valor_pagado) VALUES
(1, 1, 1, 1, 1, 2, '2024-06-01', '2024-06-08', '2024-06-07', 700.00, 100.00, 10.00, 800.00, 720.00),
(2, 2, 2, 2, 2, 3, '2024-06-02', '2024-06-10', '2024-06-09', 600.00, 90.00, 5.00, 720.00, 684.00),
(3, 3, 3, 3, 3, 4, '2024-06-03', '2024-06-12', '2024-06-11', 900.00, 130.00, 15.00, 1040.00, 884.00),
(4, 4, 4, 4, 4, 5, '2024-06-04', '2024-06-11', '2024-06-10', 1200.00, 170.00, 20.00, 1370.00, 1096.00),
(5, 5, 5, 5, 5, 1, '2024-06-05', '2024-06-13', '2024-06-12', 800.00, 110.00, 10.00, 920.00, 828.00);

-- se crea persona cliente y empleado
create user 'cliente'@'localhost' identified by 'cliente123';
create user 'empleado'@'localhost' identified by 'empleado123';


-- permisos clientes depedendiento de las consultas que el ´puede hacer 
GRANT SELECT ON laboratorio.vehiculos TO 'cliente'@'localhost';
GRANT SELECT ON laboratorio.alquileres TO 'cliente'@'localhost';
GRANT SELECT ON laboratorio.clientes TO 'cliente'@'localhost';

-- permisos de empleado depedendiendo de las cnsultas que el puede hacer 
GRANT SELECT, INSERT, UPDATE ON laboratorio.sucursales TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE, ON laboratorio.empleados TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE,  ON laboratorio.clientes TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE,  ON laboratorio.vehiculos TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE,  ON laboratorio.alquileres TO 'empleado'@'localhost';


-- Otorgar permisos de selección en las vistas a los clientes
GRANT SELECT ON vista_disponibilidad_vehiculos TO 'cliente'@'localhost';
GRANT SELECT ON vista_historial_alquileres TO 'cliente'@'localhost';

-- Revocar permisos no necesarios
REVOKE ALL PRIVILEGES ON autorental.* FROM 'cliente'@'localhost';
REVOKE ALL PRIVILEGES ON autorental.* FROM 'empleado'@'localhost';

-- Volver a asignar solo los permisos necesarios
GRANT SELECT ON autorental.vista_disponibilidad_vehiculos TO 'cliente'@'localhost';
GRANT SELECT ON autorental.vista_historial_alquileres TO 'cliente'@'localhost';
GRANT SELECT ON autorental.vehiculos TO 'cliente'@'localhost';
GRANT SELECT ON autorental.alquileres TO 'cliente'@'localhost';
GRANT SELECT ON autorental.clientes TO 'cliente'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON autorental.sucursales TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON autorental.empleados TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON autorental.clientes TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON autorental.vehiculos TO 'empleado'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON autorental.alquileres TO 'empleado'@'localhost';
