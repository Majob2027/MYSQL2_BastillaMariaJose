create database TareaDia2;
use TareaDia2;

CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 


CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);


INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);


-- Consulta #1

select apellido1
from empleado;

-- Consulta #2 

select distinct apellido1
from empleado;

-- Consulta #3

select id , nif , nombre ,apellido1 , apellido2 , id_departamento
from empleado;

-- Consulta #4

select nombre , apellido1 , apellido2 
from empleado ;

-- consulta #5

select id_departamento ,  nombre 
from empleado;

-- consulta #6

select distinct id_departamento ,  nombre 
from empleado;


-- Consulta #7

select concat( nombre , " " , apellido1)
from empleado;

-- Consulta #8

select upper(nombre) as nombre_mayuscula , upper(apellido1) as apellido_mayuscula
from empleado;

-- Consulta #9

select lower(nombre) as nombre_mayuscula , lower(apellido1) as apellido_mayuscula
from empleado;

-- Consulta #10 

SELECT 
    nombre, 
    SUBSTRING(nif, 1, LENGTH(nif) - 1) AS nif_digitos,
    RIGHT(nif, 1) AS nif_letra
FROM empleado;

-- consulta #11

SELECT 
    nombre AS departamento, 
    (presupuesto - gastos) AS presupuesto_actual
FROM 
    departamento;

-- Consulta #12

SELECT 
    nombre AS departamento, 
    (presupuesto - gastos) AS presupuesto_actual
FROM 
    departamento
order by presupuesto_actual asc;

-- Consulta #13


SELECT 
    nombre AS departamento, 
    (presupuesto - gastos) AS presupuesto_actual
FROM 
    departamento
    
order by presupuesto_actual desc;

-- Consulta #14

select nombre 
from departamento 
order by nombre desc;

-- Consulta #15

select apellido1 , apellido2 , nombre
from empleado
order by apellido1, apellido2 , nombre asc;

-- Consulta #16

select nombre , presupuesto 
from departamento
order by presupuesto asc
limit 3;

-- Consulta #17

select nombre , presupuesto 
from departamento
order by presupuesto desc
limit 3;

-- Consulta #18


select nombre , gastos 
from departamento
order by gastos asc
limit 2;

-- Consulta #19


select nombre , gastos 
from departamento
order by gastos desc
limit 2;

-- consulta #20 

SELECT *
FROM empleado
LIMIT 5 OFFSET 2;

-- consulta #21

select nombre , presupuesto 
from departamento
where presupuesto = 150000 or presupuesto > 150000;

-- Consulta #22

select nombre , gastos 
from departamento
where gastos < 5000;

-- Consulta #23

select nombre , presupuesto 
from departamento
  where presupuesto >= 100000 AND presupuesto <= 200000;

-- Consulta #24

select nombre , presupuesto 
from departamento
where presupuesto <100000 or presupuesto >200000;

-- Consulta #25

select nombre 
from departamento
where presupuesto between 100000 and 200000;


-- Consulta #26

select nombre 
from departamento
where presupuesto not between 100000 and 200000;

-- Consulta #27
select nombre , gastos , presupuesto 
from departamento
where gastos > presupuesto ;

-- Consulta #28
select nombre , gastos , presupuesto 
from departamento
where gastos < presupuesto ;


-- Consulta #29

select nombre , gastos , presupuesto 
from departamento
where gastos = presupuesto;

-- Consulta #30

SELECT *
FROM empleado
WHERE apellido2 IS NULL;




-- Consulta #31

SELECT *
FROM empleado
WHERE apellido2 IS not NULL;


-- Consulta #32

select *
from empleado
where apellido2 = 'López';

-- Consulta #33

select *
from empleado
where apellido2 = 'Díaz' or 'Moreno';

-- Consulta #34

SELECT *
FROM empleado
WHERE apellido2 IN ('Díaz', 'Moreno');


-- Consulta #35

select nombre , apellido1 , apellido2 , nif , id_departamento
from empleado
where id_departamento = 3;

-- Consulta #36

select nombre , apellido1 , apellido2 , nif , id_departamento
from empleado
where id_departamento IN (2, 4, 5);



-- Consultas multitabla 
-- Consulta #1
SELECT 
    e.nombre AS empleado_nombre, 
    d.id AS departamento_id, 
    d.nombre AS departamento_nombre, 
    d.presupuesto, 
    d.gastos 
FROM 
    empleado e 
INNER JOIN 
    departamento d 
ON 
    e.id_departamento = d.id;

-- Consulta #2

SELECT 
    d.nombre AS departamento_nombre,
    e.nombre, 
    e.apellido1,
    e.apellido2,
    d.id AS departamento_id, 
    d.presupuesto, 
    d.gastos 
FROM 
    empleado e 
INNER JOIN 
    departamento d 
ON 
    e.id_departamento = d.id
order by d.presupuesto ,nombre , apellido1 , apellido2 asc;

-- Consulta #3
SELECT d.id, d.nombre
FROM departamento d
WHERE EXISTS (
    SELECT 1
    FROM empleado e
    WHERE e.id_departamento = d.id
);

-- Consulta #4
SELECT d.id, d.nombre, (d.presupuesto - d.gastos) AS presupuesto_actual
FROM departamento d
WHERE EXISTS (
    SELECT 1
    FROM empleado e
    WHERE e.id_departamento = d.id
);


-- Consulta #5
SELECT d.nombre
FROM empleado e
JOIN departamento d ON e.id_departamento = d.id
WHERE e.nif = '38382980M';

-- Consulta #6
SELECT d.nombre
FROM empleado e
JOIN departamento d ON e.id_departamento = d.id
WHERE e.nombre = 'Pepe' AND e.apellido1 = 'Ruiz' AND e.apellido2 = 'Santana';

-- Consulta #7

SELECT d.id, d.nombre, d.presupuesto, d.gastos, e.id AS id_empleado, e.nif, e.nombre, e.apellido1, e.apellido2
FROM departamento d
INNER JOIN empleado e ON d.id = e.id_departamento
where id_departamento = 5;

-- Consulta #8

SELECT e.id AS id_empleado, e.nif, e.nombre, e.apellido1, e.apellido2
FROM empleado e
INNER JOIN departamento d ON e.id_departamento = d.id
where id_departamento in (2, 4 ,5);

-- Consulta #9

SELECT e.nombre
FROM empleado e
INNER JOIN departamento d ON e.id_departamento = d.id
where presupuesto not between 100000 and 200000;

-- Consultas #10

SELECT d.nombre
FROM departamento d
INNER JOIN empleado e ON d.id = e.id_departamento
WHERE e.apellido2 IS NULL;

-- Consultas multitabla


-- Consulta #1

SELECT d.id, d.nombre, d.presupuesto, d.gastos, e.id AS id_empleado, e.nif, e.nombre, e.apellido1, e.apellido2
FROM departamento d
right JOIN empleado e ON d.id = e.id_departamento;

-- Consulta #2

SELECT  e.id AS id_empleado, e.nif, e.nombre, e.apellido1, e.apellido2
FROM departamento d
right JOIN empleado e ON d.id = e.id_departamento
WHERE e.id_departamento IS NULL;

-- Consulta #3

SELECT d.id, d.nombre
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
WHERE e.id_departamento IS NULL;

-- Consulta #4

SELECT d.id, d.nombre, d.presupuesto, d.gastos, e.id AS id_empleado, e.nif, e.nombre, e.apellido1, e.apellido2
FROM departamento d
left JOIN empleado e ON d.id = e.id_departamento
order by d.nombre asc;

-- Consulta #5

-- Empleados sin departamento
SELECT e.nombre AS entidad_nombre, 'Empleado' AS tipo, NULL AS departamento_nombre
FROM empleado e
WHERE e.id_departamento IS NULL

UNION

-- Departamentos sin empleados
SELECT d.nombre AS entidad_nombre, 'Departamento' AS tipo, d.nombre AS departamento_nombre
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
WHERE e.id_departamento IS NULL

ORDER BY departamento_nombre;

-- Consultas Resumen

-- Consulta #1

select sum(presupuesto)
from departamento;

-- Consulta #2

select avg(presupuesto)
from departamento;

-- Consulta #3


select min(presupuesto)
from departamento;

-- Consulta #4

SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (SELECT MIN(presupuesto) FROM departamento)
limit 1;

-- Consulta #5

select max(presupuesto)
from departamento;


-- Consulta #6

SELECT d.nombre, d.presupuesto
FROM departamento d
WHERE d.presupuesto = (SELECT max(presupuesto) FROM departamento);

-- Consulta #7

select count(id)
from empleado;

-- Consulta #8

select count(id)
from empleado
where apellido2 is not null;

-- Consulta #9

SELECT d.nombre AS departamento, COUNT(e.id) AS id_empleado
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre;

-- Consulta #10


SELECT d.nombre AS departamento, COUNT(e.id) AS id_empleado
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre
HAVING COUNT(e.id) >= 2;

-- Consulta #11

SELECT d.nombre AS departamento, COUNT(e.id) AS id_empleado
FROM departamento d
LEFT JOIN empleado e ON d.id = e.id_departamento
GROUP BY d.nombre;

-- Consulta #12

SELECT d.nombre AS departamento, COUNT(e.id) AS num_empleados
FROM departamento d
INNER JOIN empleado e ON d.id = e.id_departamento
WHERE d.presupuesto > 200000
GROUP BY d.nombre;



-- Explicación de la consulta:

-- SUBSTRING(nif, 1, LENGTH(nif) - 1): Esta función extrae una subcadena del nif, empezando desde el primer carácter (1) hasta el penúltimo carácter (LENGTH(nif) - 1). 
-- Esto extrae los dígitos del NIF.

-- RIGHT(nif, 1): Esta función devuelve el último carácter del nif, que en el caso del NIF español es la letra de control.
