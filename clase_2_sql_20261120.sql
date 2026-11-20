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

select

# SENTENCIA WHERE -> Filtrar información.
select * from persona where id = 12;











