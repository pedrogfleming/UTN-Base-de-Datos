-- 1) Crear una vista formada por los números de proveedores y números de
--    productos situados en diferentes localidades.

CREATE VIEW v-proveedores-productos-numeros-diferentes-localidades AS
SELECT provs.numero, prods.pnro
FROM proveedores provs
INNER JOIN productos "PROV-PROD" pp 
ON
provs.numero = pp.numero
INNER JOIN productos prods
ON
pp.pnro = prods.pnro
WHERE pvs.localidad <> pdts.localidad;

SELECT provs.numero AS "nro proveedor", prods.pnro AS "numero de producto"
FROM proveedores provs
INNER JOIN "PROV-PROD" pp 
ON
provs.numero = pp.numero
INNER JOIN productos prods
ON
pp.pnro = prods.pnro
WHERE provs.localidad <> prods.localidad;

SELECT *
FROM "PROV-PROD" pp ;
-- 2) Agregar la columna IMPORTADOR a la tabla PRODUCTOS.
ALTER TABLE IF EXISTS productos ADD COLUMN IF NOT EXISTS importador varchar(30);
-- postgres workaround al describe
SELECT column_name, data_type, character_maximum_length, column_default, is_nullable
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'productos';
-- 3) Crear una vista formada por los registros de los proveedores que viven en Wilde
CREATE VIEW "v-proveedores-wilde" AS 
SELECT *
FROM proveedores p
WHERE p.localidad = 'Wilde';

SELECT *
FROM "v-proveedores-wilde";
-- 4) Crear las tablas DEPARTAMENTOS y EMPLEADOS con sus relaciones, y las
tablas PACIENTES y MEDICAMENTOS con sus relaciones

CREATE TABLE IF NOT EXISTS departamentos(
  id int PRIMARY KEY NOT NULL, descripcion varchar(60) NOT NULL  
);

CREATE TABLE IF NOT EXISTS empleados(
  id int PRIMARY KEY NOT NULL, nombre varchar(60) NOT NULL, apellido varchar(60) NOT NULL, departamento int NOT NULL, puesto varchar(60) NOT NULL, FOREIGN KEY (departamento) REFERENCES departamentos 
);

CREATE TABLE IF NOT EXISTS medicamentos(
	id int PRIMARY KEY NOT NULL, descripcion varchar(60) NOT NULL, laboratorio varchar(90) NOT NULL, precio decimal(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS pacientes (
	id int PRIMARY KEY NOT NULL, nombre varchar(30) NOT NULL, apellido varchar(30) NOT NULL, medicamento_id int NOT NULL, FOREIGN KEY (medicamento_id) REFERENCES medicamentos 
);