create database laboratorio;
use laboratorio;

create table sucursales(
id_sucursal int primary key,
ciudad varchar(100) not null,
direccion varchar(200) not null,
telefono_fijo varchar(15) not null,
correo_electronico varchar(100) not null
);

create table clientes (
id_cliente int primary key,
nombre varchar(100) not null,
apellido varchar(100) not null,
cedula varchar(15) not null,
direccion_residencia varchar(200) not null,
ciudad_residencia varchar (100) not null ,
celular varchar(15) not null
);

create table vehiculos (
id_vehiculo int primary key ,
tipo_vehiculo varchar(50) not null,
placa varchar(5) not null ,
referencia varchar(50) not null,
modelo int(4) not null ,
puertas int(2) not null,
capacidad int(3) not null,
sunroof boolean not null,
motor varchar(20) not null,
color varchar(30) not null
);