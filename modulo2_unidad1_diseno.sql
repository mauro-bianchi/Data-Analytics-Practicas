CREATE DATABASE MODULO_3;

USE MODULO_3;

CREATE TABLE clientes (
id_cliente int not null IDENTITY(1,1) PRIMARY KEY, -- PK y entero porque va de 1 en 1
nombre varchar(100) not null, -- texto para nombre, pero es corto
perfil_bio varchar(max) not null, -- esun texto largo
fecha_registro date not null -- fecha de registro, no importa la hora
);

Select*from clientes;

CREATE TABLE productos (
id_producto int not null IDENTITY(1,1) PRIMARY KEY, --lo mismo que antes
descripcion varchar(255) not null, -- es un texto largo
precio decimal(10,2) not null, -- valor de 10 caracteres con 2 decimales
esta_activo bit not null --1 si esverdadero, 0 es falso
);

select*from productos;
