create database DIA7_EJERCICIO; 
USE DIA7_EJERCICIO;

-- examen completo de tabla 

CREATE TABLE `customer` (
`id` int DEFAULT NULL,
`first_name` varchar (30) DEFAULT NULL,
`surname` varchar (40) DEFAULT NULL
);
INSERT INTO `customer`
VALUES (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5, 'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke');

-- Es muy dificil hacer este proceso cuando la camntodad de datos es muy grande y para eso

select * from customer order by surname;

-- Hacer una primary key 

ALTER TABLE customer ADD PRIMARY KEY(id);

-- creacion de tabla usuario con indice 

CREATE TABLE usuario (id INT NOT NULL,
apellidos CHAR(30) NOT NULL,
nombre CHAR(30) NOT NULL,
PRIMARY KEY (id),
INDEX indice01 (apellidos, nombre));

show databases;

use dia3;
show tables;

select * 
from pedido;


-- Consulta #1
-- 1- Escribe una consulta que permita agrupar los clientes de todos los empleados 
-- cuyo puesto sea responsable de ventas. Se requiere que la consulta muestre: 
-- Nombre del cliente, teléfono, la ciudad, nombre y primer apellido del responsable 
-- de ventas y su email. 

select * 
from cliente;

select * 
from empleado;

select c.nombre_cliente , c.telefono , c.ciudad , e.nombre , e.apellido1 , e.email
from cliente c
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where puesto = 'Representante Ventas';


-- Consulta #2 

SELECT p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.estado, p.comentarios, p.codigo_cliente
FROM pedido p
INNER JOIN cliente c ON p.codigo_cliente = c.codigo_cliente
WHERE c.ciudad = 'Sotogrande'
AND p.fecha_pedido BETWEEN '2009-03-15' AND '2009-07-15';

-- Consulta #3

-- 3- Se desea obtener los productos cuya gama pertenezca a las frutas y que el 
-- proveedor sea Frutas Talaveras S.A, se desea mostrar el código, nombre, 
-- descripción, cantidad en stock, y su precio con 10% de descuento, de igual forma 
-- se pide la cantidad en los distintos pedidos que se han hecho. 

show tables ;
select *
from producto ;

select pp.codigo_producto, p.nombre, p.descripcion, ROUND(p.precio_venta * 0.9, 2) , COUNT(d.codigo_pedido) 
from p producto
LEFT JOIN detalle_pedido d ON p.codigo_producto = d.codigo_producto
where gama = 'Frutales' 
and proveedor = 'Frutas Talaveras S.A';




