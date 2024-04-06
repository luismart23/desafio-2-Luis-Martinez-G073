CREATE TABLE IF NOT EXISTS INSCRITOS(
    cantidad INT, 
    fecha DATE, 
    fuente VARCHAR
);

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (44, '2021-01-01', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (56, '2021-01-01', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (39, '2021-01-02', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (81, '2021-01-02', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (12, '2021-01-03', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (91, '2021-01-03', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (48, '2021-01-04', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (45, '2021-01-04', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (55, '2021-01-05', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (33, '2021-01-05', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (18, '2021-01-06', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (12, '2021-01-06', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (34, '2021-01-07', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (24, '2021-01-07', 'Página');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (83, '2021-01-08', 'Blog');

INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES (99, '2021-01-08', 'Página');


-- 1. ¿Cuántos registros hay?
SELECT COUNT(*) AS total_registros FROM INSCRITOS;

--Esta consulta utiliza la función COUNT(*), que cuenta el número total de registros en la tabla INSCRITOS. 
--El asterisco * indica que se cuentan todos los registros sin excepción. Luego, el resultado se presenta 
--en una columna llamada total_registros, que se ha creado usando AS total_registros.
--La cláusula AS en SQL se utiliza para renombrar una columna o una tabla en los resultados de una consulta.


-- 2. ¿Cuántos inscritos hay en total?
SELECT SUM(cantidad) AS total_inscritos FROM INSCRITOS;

--En esta consulta, se utiliza la función SUM(cantidad), que suma todos los valores de la columna cantidad 
--en la tabla INSCRITOS. Esto da como resultado el total de inscritos. Nuevamente, el resultado se presenta en 
--una columna llamada total_inscritos, que se ha creado usando AS total_inscritos.


-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT *
FROM INSCRITOS
WHERE fecha = (SELECT MIN(fecha) FROM INSCRITOS);

--Aquí, se realiza una subconsulta para encontrar la fecha más antigua en la tabla INSCRITOS utilizando SELECT MIN(fecha) 
--FROM INSCRITOS. Luego, se compara cada fecha de los registros con esta fecha mínima y se seleccionan aquellos registros 
--que coinciden. La palabra clave AS no se usa directamente aquí, pero en el resultado de la consulta, las columnas de 
--la tabla INSCRITOS se muestran tal como están.


-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha, SUM(cantidad) AS inscritos_por_dia
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;

--En esta consulta, se utiliza la función SUM(cantidad) para sumar la cantidad de inscritos agrupados por la fecha. 
--La cláusula GROUP BY fecha agrupa los registros según la fecha, y luego se ordenan los resultados por fecha usando 
--ORDER BY fecha.


-- 5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS total_inscritos
FROM INSCRITOS
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1;

--Esta consulta es similar a la anterior, pero además de agrupar por fecha y sumar la cantidad de inscritos por día, 
--se ordena el resultado de manera descendente según la suma de inscritos y se limita a mostrar solo la primera fila, 
--que representa el día con la mayor cantidad de inscritos.



