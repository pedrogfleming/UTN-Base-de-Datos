-- 1) Cuáles tablas contienen la columna LOCALIDAD?
SELECT * FROM 

SELECT table_name 
FROM information_schema.columns 
WHERE column_name = 'localidad';
-- 2) Cuántas columnas tiene la tabla PRODUCTOS?
SELECT COUNT(*) 
FROM information_schema.columns 
WHERE table_name = 'productos';
-- 3) Obtener una lista de todos los usuarios dueños de por lo menos una tabla, junto con el
-- número de tablas que le pertenecen a cada uno.
SELECT r.rolname AS owner, COUNT(*) AS num_tables
FROM pg_class c
JOIN pg_roles r ON r.oid = c.relowner
WHERE c.relkind = 'r' -- solo tablas
GROUP BY r.rolname
HAVING COUNT(*) > 0;

-- 4) Obtener una lista de los nombres de todas las tablas que tienen por lo menos un
-- índice.
SELECT DISTINCT tablename 
FROM pg_indexes;