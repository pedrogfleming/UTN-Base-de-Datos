-- Ejercicios:
-- 1) Una base de datos hospitalaria contiene las siguientes relaciones:
-- PACIENTES (CODIGO-PAC, APELLIDO-PAC, EDAD)
-- MEDICAMENTOS (CODIGO-MED, PRECIO-UNITARIO)
-- GASTOS (CODIGO-PAC, CODIGO-MED)
-- Indicar las claves primarias y claves ajenas de cada relación.
En la tabla pacientes, CODIGO-PAC es pk de la tabla pacientes. 
En la tabla medicamentos, CODIGO-MED es pk de la tabla medicamentos.
En la tabla gastos, CODIGO-PAC es pk de la tabla gastos y CODIGO-MED es fk referenciando a la columna CODIGO-MED de la tabla medicamentos.


-- 2) Dadas las siguientes relaciones:
-- CURSOS (NUMCURSO, TITULO)
-- OFRECIMIENTOS (NUMCURSO, NUMOFR, FECHA, AULA)
-- PROFESORES (NUMCURSO, NUMOFR, NUMEMP)
-- ESTUDIANTES (NUMCURSO, NUMOFR, NUMEMP, CALIFICACION)
-- EMPLEADOS (NUMEMP, EMPLE-NOMBRE, PUESTO)
-- Indicar las claves primarias y claves ajenas de cada relación.
En la tabla cursos, NUMCURSO es la pk de la tabla cursos.
En la tabla ofrecimientos, NUMCURSO y NUMOFR es la pk compuesta de la tabla ofrecimientos, NUMCURSO es la fk que referencia la columna NUMCURSO de la tabla CURSOS
En la tabla profesores, NUMCURSO es fk que referencia la columna NUMCURSO de la tabla CURSOS, NUMOFR es fk que referencia la columna NUMOFR de la tabla OFRECIMIENTOS, NUMEMP es fk que referencia la columna NUMEMP de la tabla PROFESORES
En la tabla empleados, NUMEMP es la pk de la tabla empleados.
En la tabla estudiantes,NUMCURSO es fk que referencia la columna NUMCURSO de la tabla CURSOS, NUMEMP es fk que referencia la columna NUMEMP de la tabla PROFESORES, NUMOFR es fk que referencia la columna NUMOFR de la tabla OFRECIMIENTOS
En la tabla empleados, NUMEMP es la pk de la tabla empleados.
-- 3) Dadas las siguientes tablas:
-- Empleados (cod_emp, nombre, apellido, tipo_doc, num_doc, categoria, cod_ofic)
-- Oficinas (cod_ofic, descripción)
-- Crear las siguientes reglas de integridad:
--  La columna cod_emp debe ser clave primaria.
--  La columna cod_emp debe tener valores entre 100 y 1000.
--  Las columnas tipo_doc y num_doc deben contener valores no repetidos (únicos).
--  La columna Categoria debe contener algunos de los siguientes valores: Senior, Semi Senior,
-- Junior.
--  La columna cod_ofic debe tener valores que existan en la tabla Oficinas.

ALTER TABLE IF EXISTS Empleados
ADD CONSTRAINT pk_empleados PRIMARY KEY (cod_emp);
ALTER TABLE IF EXISTS Empleados
ADD CONSTRAINT pk_empleados  CHECK (cod_emp BETWEEN (0,100));

ALTER TABLE IF EXISTS Empleados
ADD CONSTRAINT unique_tipo_doc_num_doc UNIQUE (tipo_doc, num_doc);

ALTER TABLE IF EXISTS Empleados
ADD CONSTRAINT check_categoria CHECK (categoria IN ('Senior', 'Semi Senior', 'Junior'));

ALTER TABLE IF EXISTS Empleados
ADD CONSTRAINT fk_empleados_cod_ofic FOREIGN KEY (cod_ofic) REFERENCES Oficinas(cod_ofic);
