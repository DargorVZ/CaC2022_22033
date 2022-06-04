-- 						DESAFIO BASE DE DATOS
-- 1) Dada la siguiente tabla de datos, armar las tablas pertinentes con sus claves primarias y claves foráneas correspondiente:

USE cac2022;

CREATE TABLE IF NOT EXISTS departamento (
	Numero_Departamento INT(2) NOT NULL,
	Nombre_Departamento VARCHAR(20) NOT NULL,
	Presupuesto INT(5) NOT NULL,
PRIMARY KEY (Numero_Departamento)
);

INSERT INTO departamento VALUES(14, 'Informatica', 80000);

INSERT INTO departamento VALUES(15,'Gestion',95000);

INSERT INTO departamento VALUES(16,'Comunicacion',75000);

INSERT INTO departamento VALUES(37,'Desarrollo',65000);

INSERT INTO departamento VALUES(77,'Investigacion',40000);

SELECT * FROM departamento d ;

CREATE TABLE IF NOT EXISTS empleados (
	DNI INT(8) NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellido VARCHAR(20) NOT NULL,
	Depto INT(2) NOT NULL,
PRIMARY KEY (DNI),
FOREIGN KEY (Depto) REFERENCES departamento(Numero_Departamento)
);

INSERT INTO empleados VALUES(31096678, 'Juan', 'Lopez', 14);

INSERT INTO empleados VALUES(31096675, 'Martín', 'Zarabia', 77);

INSERT INTO empleados VALUES(34269854, 'Jose', 'Velez', 77);

INSERT INTO empleados VALUES(41369852, 'Paula', 'Madariaga', 77);

INSERT INTO empleados VALUES(33698521, 'Pedro', 'Perez', 14);

INSERT INTO empleados VALUES(32698547, 'Mariana', 'Lopez', 15);

INSERT INTO empleados VALUES(42369854, 'Abril', 'Sanchez', 37);

INSERT INTO empleados VALUES(36125896, 'Marti', 'Julia', 14);

INSERT INTO empleados VALUES(36985471, 'Omar', 'Diaz', 15);

INSERT INTO empleados VALUES(32145698, 'Guadalupe', 'Perez', 77);

INSERT INTO empleados VALUES(32369854, 'Bernardo', 'Pantera', 37);

INSERT INTO empleados VALUES(36125965, 'Lucia', 'Pesaro', 14);

INSERT INTO empleados VALUES(31236985, 'Maria', 'Diamante', 14);

INSERT INTO empleados VALUES(31698547, 'Carmen', 'Barbieri', 16);

SELECT * FROM empleados e ;

-- 						2) Realizar las siguientes consultas:
-- 2.1 obtener los apellidos de los empleados

SELECT apellido FROM empleados e;

-- 2.2 obtener los apellidos de los empleados sin repeticiones

SELECT DISTINCT apellido FROM empleados e ;

-- 2.3 obtener los datos de los empleados que tengan el apellido Lopez

SELECT * FROM empleados e WHERE Apellido = 'Lopez';

-- 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez

SELECT * FROM empleados e WHERE Apellido = 'Lopez' OR Apellido = 'Perez';

-- 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14

SELECT * FROM empleados e WHERE Depto = 14;

-- 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77

SELECT * FROM empleados e WHERE Depto = 37 OR Depto = 77;

-- 2.7 Obtener los datos de los empleados cuyo apellido comience con P

SELECT * FROM empleados e WHERE Apellido LIKE 'P%';

-- 2.8 Obtener el presupuesto total de todos los departamentos

SELECT SUM(Presupuesto) AS 'Presupuesto Total' FROM departamento d;

-- 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento

SELECT * FROM empleados e INNER JOIN departamento d ON e.Depto = d.Numero_Departamento;

-- 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento

SELECT e.Nombre, e.Apellido, d.Nombre_Departamento, d.Presupuesto FROM empleados e INNER JOIN departamento d ON e.Depto = d.Numero_Departamento; 

-- 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000

SELECT e.Nombre, e.Apellido FROM empleados e INNER JOIN departamento d ON e.Depto = d.Numero_Departamento AND d.Presupuesto > 60000;

-- 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109

INSERT INTO departamento VALUES(11, 'Calidad', 40000);

INSERT INTO empleados VALUES(89267109, 'Esther', 'Vazquez', 11);

-- 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos

UPDATE departamento SET Presupuesto = Presupuesto - (Presupuesto * 0.1);

-- 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14)

UPDATE empleados SET Depto = 14 WHERE Depto = 77;

-- 2.15 Despedir a los empleados del departamento de informática (código 14)

DELETE FROM empleados WHERE Depto = 14;
SELECT * FROM empleados e ;
-- 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000

DELETE FROM empleados WHERE Depto = (SELECT Numero_Departamento  FROM departamento WHERE Presupuesto > 90000);
