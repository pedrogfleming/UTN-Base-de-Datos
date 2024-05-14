-- EJERCICIOS DE DML:
-- Realizar las siguientes proposiciones SQL con la siguiente estructura:
--PROVEEDORES (NUMERO, NOMBRE, DOMICILIO, LOCALIDAD)
--PRODUCTOS (PNRO, PNOMBRE, PRECIO, TAMAÑO, LOCALIDAD)
--PROV-PROD (NUMERO, PNRO, CANTIDAD)
--1) Obtener los detalles completos de todos los productos.
SELECT *
FROM productos;
--2) Obtener los detalles completos de todos los proveedores de Capital.
SELECT *
FROM proveedores p
WHERE localidad = 'Capital';
--3) Obtener todos los envíos en los cuales la cantidad está entre 200 y 300 inclusive.
SELECT *
FROM "PROV-PROD" pp
WHERE cantidad >= 200
AND cantidad <= 300;
--4) Obtener los números de los productos suministrados por algún proveedor de
--Avellaneda.
SELECT p.pnro
FROM productos p
INNER JOIN "PROV-PROD" pp 
ON
p.pnro = pp.pnro
INNER JOIN proveedores p2 
ON
pp.numero = p2.numero
WHERE p2.localidad = 'Avellaneda';
--5) Obtener la cantidad total del producto 001 enviado por el proveedor 103.
SELECT 
sum(pp.cantidad)
FROM productos p
INNER JOIN "PROV-PROD" pp 
ON
p.pnro = pp.pnro
INNER JOIN proveedores p2 
ON
pp.numero = p2.numero
WHERE p2.numero = 103 AND p.pnro = 1
GROUP BY p.pnro;
--6) Obtener los números de los productos y localidades en los cuales la segunda letra
--del nombre de la localidad sea A.
SELECT 
pnro , localidad 
FROM productos p 
WHERE p.localidad LIKE '_a%';
--7) Obtener los precios de los productos enviados por el proveedor 102.
SELECT 
p2.precio
FROM "PROV-PROD" pp 
INNER JOIN proveedores p 
ON pp.numero  = p.numero 
INNER JOIN productos p2 
ON p2.pnro = pp.pnro 
WHERE p.numero = 102;
--8) Construir una lista de todas las localidades en las cuales esté situado por lo menos
--un proveedor o un producto.
SELECT LOCALIDAD FROM PROVEEDORES
UNION
SELECT LOCALIDAD FROM PRODUCTOS
ORDER BY LOCALIDAD;

--9) Cambiar a “Chico” el tamaño de todos los productos medianos.
UPDATE productos p SET "tamaÑo" = 'Chico'
WHERE "tamaÑo" = 'Mediano';

--10) Eliminar todos lo sproductos para los cuales no haya envíos.

DELETE FROM productos
WHERE productos.pnro IN (
SELECT 
p.pnro 
FROM productos p 
LEFT JOIN "PROV-PROD" pp 
ON p.pnro = pp.pnro
WHERE  pp.pnro IS NULL
);

--11) Insertar un nuevo proveedor (107) en la tabla PROVEEDORES. El nombre y la
--localidad son Rosales y Wilde respectivamente; el domicilio no se conoce todavía.
INSERT INTO proveedores (numero, nombre, domicilio, localidad)
VALUES (101, 'Rosales', 'desconocido', 'Rosales');
