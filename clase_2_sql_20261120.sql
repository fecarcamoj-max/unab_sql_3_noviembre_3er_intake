-- Esto es un comentario...
# Esto también es un comentario.
-- DDL : Data Definition Language.
-- Crear una bds llamada unab_sql.
create database unab_sql;
drop database unab_sql;
-- Mostrar las bases de datos:
show databases;
-- Seleccionar la bds a utilizar.
use unab_sql;
-- Mostrar tablas de la bds seleccionada.
show tables;
-- Crear una tabla en la bds. DDL
create table persona(
	id bigint primary key auto_increment,
	nombre TEXT,
	apellido TEXT,
	fecha_nacimiento DATE, # YYYY-MM-DD
	apodo varchar(10), #texto de max 10 caracteres.,
	estado_cuenta int(1) not null default 1 #1 activo, 0 NO activo
);
#DDL
insert into persona 
(nombre, apellido, fecha_nacimiento, apodo, estado_cuenta)
values 
("Felipe", 'Cárcamo', "1993-04-26", "felipeacj", 1);

insert into persona
(id, nombre, apellido, fecha_nacimiento, apodo)
values 
(2, "Raul", "Ezter", "1995-03-02", "raulito");

#### Precaución al momento de hacer una transacción en SQL.
start transaction;
insert into persona (nombre, apellido, fecha_nacimiento, apodo)
values
("fabian", "cst", "2026-01-01", "fb"),
("valentina", "prd", "1990-01-01", "vl"),
("marta", "vera", "1950-06-25", "mt")
;
commit; #Confirmar los cambios
rollback; #Volver atrás

#UPDATE -> Actualizar registros:...
start transaction;
update persona set 
	estado_cuenta = 0, 
	fecha_nacimiento = "1980-01-01"
	;
rollback;

# DELETE
start transaction;
delete from persona; 
rollback;

# DROP TABLE persona;
# ALTER TABLE..... Modificar una tabla y sus columnas.

alter table persona
	modify column apodo varchar(20) unique, #Restricción para apodo único.
	add column pais varchar(2) default "CL",#CL, AR, BR, BL
	add column ultimo_acceso datetime null,  #YYYY-MM-DD HH:mm:ss
	drop estado_cuenta
;

#TEST INSERT UNIQUE
insert persona (apodo) 
VALUES
("raulito2");

# DML - SELECT. Consultas a tabla única.
select * from persona;
#Llamar a columnas específicas:::
select nombre, apodo from persona;
# Mostrar Hora del servidor.
select NOW(); #UTC
#MOSTRAR VALORES SIN LLAMAR A UNA TABLA:::
select "TEXTO", 123, "2026-01-01";

# SENTENCIA LIMIT -> LIMITAR LA MUESTRA DE INFORMACIÓN.
select * from PERSONA limit 3;

#Sentencias de Operaciones SQL: COUNT, SUM, MIN, MAX, STD, AVG
# Contar la cantidad de registros que hay dentro de la bds.
select COUNT(*) from persona;
# misma consulta a una columna en específico agregando un alias
select COUNT(id) as total_registros from persona;
#SUMAR LOS VALORES DE LOS IDS, PROMEDIO DE LOS IDS.
select SUM(id) as suma_ids, AVG(id) as prom_ids from persona;
#MAX de la columna, MIN de la col, Desviación estándar.
select MAX(id) as max_id, MIN(id) as min_id, std(id) desv_std_id 
from persona;
# MAX, MIN aplicar a campos fecha:
select max(fecha_nacimiento) reciente, min(fecha_nacimiento) longevo
from persona;
# Operaciones aritméticas:::
select 1+2, 2*2, 10/2, 10-8, id * id, id * 100
from persona;



# SENTENCIA WHERE -> Filtrar información.
# Muestra a la persona con id 12.
select * from persona where id = 12;
# Muestra a la persona con id 12 y a la persona con id 11
select * from persona where id = 12 and id = 11; #Incorrecto
select * from persona where id = 12 or id = 11; #correcto
select * from persona where id in (11, 12); #correcto
#Comparación con fechas.
select * from persona where fecha_nacimiento = "1990-01-01";
#Operaciones sobre fechas que también se pueden aplicar a los 
# filtros where:
select month(fecha_nacimiento), year(fecha_nacimiento)
from persona;
# Mostrar a las personas que hayan nacido en enero.
select * from persona where month(fecha_nacimiento) = 1;
# Mostrar a las personas que hayan nacido en 2026
select * from persona where year(fecha_nacimiento) = 2026;

# Aplicar rangos a los filtros. > <, >=, <=, between (entre)
select * from persona where id > 9; # ]9, +]
select * from persona where id >= 9;# [9, +]
select * from persona where id < 9; # [-, 9[ 
select * from persona where id <= 9;# [-, 9]
# Años:
select * from persona where year(fecha_nacimiento) >= 2000;

#Rangos con límites, de inicio a fin. AND y.
#Caso: Mostrar a las personas que tengan un id entre 10 y 20.
select * from persona where id >= 10 and id <= 20;
select * from persona where id between 10 and 20;

#Caso: Mostrar a las personas entre 2000 y 2030.
select * from persona where fecha_nacimiento >= "2000-01-01"
and fecha_nacimiento <= "2030-01-01";

select * from persona where fecha_nacimiento between 
"2000-01-01" and "2030-01-01";

select * from persona where year(fecha_nacimiento) between 
2000 and 2030;

# Comparar textos....























