CREATE DATABASE MODULO_3;

USE MODULO_3;

CREATE TABLE Clientes (
ID_Cliente int not null IDENTITY(1,1) PRIMARY KEY, -- PK y entero porque va de 1 en 1
Nombre varchar(100) not null, -- texto para nombre, pero es corto
Perfil_bio varchar(max) not null, -- esun texto largo
Fecha_Registro date not null, -- fecha de registro, no importa la hora
);

Select*from clientes;

CREATE TABLE Productos (
ID_Producto int not null IDENTITY(1,1) PRIMARY KEY, --lo mismo que antes
Descripcion varchar(255) not null, -- es un texto largo
Precio decimal(10,2) not null, -- valor de 10 caracteres con 2 decimales
Esta_Activo bit not null, --1 si esverdadero, 2 es falso
);

select*from productos;
