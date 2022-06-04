CREATE DATABASE cac2022;

CREATE TABLE IF NOT EXISTS alumnos2022 (
Id INT(11) AUTO_INCREMENT NOT NULL, 
Nombre VARCHAR(40) NOT NULL,
Apellido VARCHAR(40) NOT NULL,
Edad TINYINT(2) NOT NULL,
Fecha TIMESTAMP NOT NULL,
Provincia VARCHAR(30) NOT NULL,
PRIMARY KEY (Id) 
);

INSERT INTO alumnos2022(Nombre, Apellido, Edad, Fecha, Provincia) 
	VALUES('Dario', 'Vizcarra', 33, current_timestamp(), 'Mendoza');
INSERT INTO alumnos2022(Nombre, Apellido, Edad, Fecha, Provincia) 
	VALUES('Roti', 'Vizcarra', 2, current_timestamp(), 'Mendoza');
INSERT INTO alumnos2022(Nombre, Apellido, Edad, Fecha, Provincia) 
	VALUES('Chiqui', 'Vizcarra', 4, current_timestamp(), 'Mendoza');
INSERT INTO alumnos2022(Nombre, Apellido, Edad, Fecha, Provincia) 
	VALUES('Copini', 'Vizcarra', 3, current_timestamp(), 'Mendoza');
INSERT INTO alumnos2022(Nombre, Apellido, Edad, Fecha, Provincia) 
	VALUES('Sariwey', 'Vizcarra', 2, current_timestamp(), 'Mendoza');


SELECT * FROM alumnos2022 a ;