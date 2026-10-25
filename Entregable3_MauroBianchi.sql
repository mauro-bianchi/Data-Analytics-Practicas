-- Entregable 3 
-- Autor: Mauro Bianchi
-- Fecha: 25/10

---- Sección DDL: Definición de la Estructura

-- Crear la base de datos
Create database Ventas_Tech_DB;

-- Drop Tables al incio para limpiar la DB, respetar el orden inverso de las dependencias (primero las que tienen FK)
Drop Table if exists ventas;
Drop Table if exists productos;
Drop Table if exists clientes;
Drop Table if exists categorias;

-- Crear las tablas en el orden correcto (primero sin dependencias)
Create table categorias (
id_categoria int identity(1,1) PRIMARY KEY,
nombre_categoria varchar(50) not null,
descripcion varchar(200)
);

Create table clientes (
id_cliente int identity(1,1) PRIMARY KEY,
nombre varchar(100) not null,
email varchar(100) UNIQUE, -- evita que se repitan valores en una columna
ciudad varchar(50),
fecha_registro date not null
);

Create table productos (
id_producto int identity(1,1) PRIMARY KEY,
nombre_producto varchar(100) not null,
id_categoria int FOREIGN KEY REFERENCES categorias (id_categoria),
precio decimal(10,2) not null,
stock int default 0, -- Si no indicás el stock, automáticamente es 0
activo bit default 1 -- Si no indicás si está activo, automáticamente es 1 (verdadero-activo)
);

Create table ventas (
id_venta int identity(1,1) PRIMARY KEY,
id_cliente int FOREIGN KEY REFERENCES clientes (id_cliente),
id_producto int FOREIGN KEY REFERENCES productos (id_producto),
cantidad int not null,
precio_unitario decimal(10,2) not null,
fecha_venta date not null
);

---- Sección DML: Trabajando con los datos

-- Insertamos datos en el orden correcto (primero las tablas sin dependencias -- sin FK)
-- no pongo la columna de id porque lo tengo ya definido como incremental desde 1

INSERT INTO categorias
(nombre_categoria, descripcion)
VALUES
('Computación', 'Laptops, PCs y monitores'),
('Accesorios', 'Periféricos y complementos'),
('Audio', 'Auriculares y parlantes'),
('Almacenamiento', 'Discos y memorias');

INSERT INTO clientes
(nombre, email, ciudad, fecha_registro)
VALUES
('María Lopez', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
('Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
('Ana Gomez', 'ana@mail.com', 'Rosario', '2024-02-01'),
('Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
('Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01'); 

INSERT INTO productos
(nombre_producto, id_categoria, precio, stock, activo)
VALUES
('Laptop Pro 15', 1, 1200.00, 15, 1),
('Mouse inalámbrico', 2, 28.00, 80, 1),
('Monitor 4K 27¨', 1, 450.00, 12, 1),
('Auriculares BT Pro', 3, 120.00, 35, 1),
('SSD Externo 1TB', 4, 130.00, 18, 1),
('Teclado Mecánico', 2, 95.00, 40, 1);

INSERT INTO ventas
(id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
(1, 1, 2, 1200.00, '2024-03-05'),
(2, 2, 5, 28.00, '2024-03-06'),
(3, 3, 1, 450.00, '2024-03-07'),
(1, 4, 2, 120.00, '2024-03-08'),
(4, 5, 3, 130.00, '2024-03-10'),
(2, 6, 4, 95.00, '2024-03-11'),
(5, 1, 1, 1200.00, '2024-03-12'),
(3, 2, 8, 28.00, '2024-03-13'),
(4, 4, 1, 120.00, '2024-03-14'),
(5, 3, 2, 450.00, '2024-03-15');

---- Sección Verificación: Selecciono las tablas para verificar que cargaron bien
SELECT*FROM categorias;

SELECT*FROM clientes;

SELECT*FROM productos;

SELECT*FROM ventas;






